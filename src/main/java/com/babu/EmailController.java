package com.babu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Value;

import jakarta.mail.internet.MimeMessage;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

@Controller
@RequestMapping("/email")
public class EmailController {

    private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

    @Autowired
    private JavaMailSender mailSender;
    
    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    
    @Value("${app.mail.default.username:}")
    private String defaultUsername;
    
    @Value("${app.mail.default.password:}")
    private String defaultPassword;
    
    private final Map<String, String> emailStatus = new ConcurrentHashMap<>();
    private final List<String> successEmails = Collections.synchronizedList(new ArrayList<>());
    private final List<String> failedEmails = Collections.synchronizedList(new ArrayList<>());
    private final List<String> cancelledEmailsList = Collections.synchronizedList(new ArrayList<>());
    private final AtomicInteger totalEmails = new AtomicInteger(0);
    private final AtomicInteger processedEmails = new AtomicInteger(0);
    private volatile boolean campaignCancelled = false;
    private final List<CompletableFuture<Void>> runningTasks = Collections.synchronizedList(new ArrayList<>());
    private final Map<String, CompletableFuture<Void>> emailTasks = new ConcurrentHashMap<>();
    private final Set<String> cancelledEmails = ConcurrentHashMap.newKeySet();

    @GetMapping("/")
    public String emailHome() {
        logger.info("Email home page accessed");
        return "email/index";
    }

    @GetMapping("/howto")
    public String howto() {
        logger.info("Email How to Use page accessed");
        return "email/howto";
    }

    @PostMapping("/upload-emails")
    @ResponseBody
    public Map<String, Object> uploadEmails(@RequestParam("emailFile") MultipartFile emailFile) {
        logger.info("Email file upload started: {}", emailFile.getOriginalFilename());
        Map<String, Object> response = new HashMap<>();
        
        try {
            List<String> emails = readEmailsFromFile(emailFile);
            logger.info("Successfully parsed {} emails from file", emails.size());
            
            response.put("status", "success");
            response.put("emails", emails);
            response.put("totalCount", emails.size());
            
        } catch (Exception e) {
            logger.error("Error uploading email file: {}", e.getMessage(), e);
            response.put("status", "error");
            response.put("message", e.getMessage());
        }
        
        return response;
    }

    @PostMapping("/send-bulk")
    @ResponseBody
    public Map<String, Object> sendBulkEmails(
            @RequestParam("emailFile") MultipartFile emailFile,
            @RequestParam("subject") String subject,
            @RequestParam("message") String message,
            @RequestParam(value = "attachment", required = false) MultipartFile attachment,
            @RequestParam(value = "delay", defaultValue = "0") int delay,
            @RequestParam(value = "mode", defaultValue = "async") String mode) {
        
        logger.info("=== SEND-BULK REQUEST RECEIVED ===");
        Map<String, Object> response = new HashMap<>();
        
        try {
            // Check credentials - use default only if user enters "kuku"
            JavaMailSenderImpl mailSenderImpl = (JavaMailSenderImpl) mailSender;
            if ("kuku".equals(mailSenderImpl.getUsername())) {
                mailSenderImpl.setUsername(defaultUsername);
                mailSenderImpl.setPassword(defaultPassword);
                logger.info("Using default email credentials (admin mode)");
            } else if (mailSenderImpl.getUsername() == null || mailSenderImpl.getPassword() == null || 
                      defaultUsername.equals(mailSenderImpl.getUsername())) {
                response.put("status", "error");
                response.put("message", "Email credentials not configured. Please configure in Settings.");
                return response;
            }
            
            // Clear previous results
            successEmails.clear();
            failedEmails.clear();
            cancelledEmailsList.clear();
            emailStatus.clear();
            processedEmails.set(0);
            campaignCancelled = false;
            runningTasks.clear();
            emailTasks.clear();
            cancelledEmails.clear();
            
            List<String> emails = readEmailsFromFile(emailFile);
            totalEmails.set(emails.size());
            
            logger.info("Campaign initialized with {} recipients", emails.size());
            sendProgressUpdate();
            
            // Async email sending logic (simplified for integration)
            for (String email : emails) {
                emailStatus.put(email, "Queued");
                CompletableFuture<Void> task = CompletableFuture.runAsync(() -> {
                    try {
                        if (campaignCancelled || cancelledEmails.contains(email)) {
                            cancelledEmailsList.add(email);
                            updateEmailStatus(email, "Cancelled");
                            processedEmails.incrementAndGet();
                            sendProgressUpdate();
                            return;
                        }
                        
                        Thread.sleep(delay * 1000L);
                        updateEmailStatus(email, "Sending");
                        sendEmail(email.trim(), subject, message, attachment);
                        
                        if (!campaignCancelled && !cancelledEmails.contains(email)) {
                            successEmails.add(email);
                            updateEmailStatus(email, "Sent");
                            logger.info("Email sent successfully to: {}", email);
                        } else {
                            cancelledEmailsList.add(email);
                            updateEmailStatus(email, "Cancelled");
                        }
                    } catch (Exception e) {
                        if (!campaignCancelled && !cancelledEmails.contains(email)) {
                            failedEmails.add(email);
                            updateEmailStatus(email, "Failed");
                            logger.error("Failed to send email to {}: {}", email, e.getMessage());
                        } else {
                            cancelledEmailsList.add(email);
                            updateEmailStatus(email, "Cancelled");
                        }
                    } finally {
                        emailTasks.remove(email);
                        processedEmails.incrementAndGet();
                        sendProgressUpdate();
                    }
                });
                emailTasks.put(email, task);
                runningTasks.add(task);
            }
            
            response.put("status", "success");
            response.put("totalEmails", emails.size());
            response.put("message", "Bulk email campaign initiated successfully");
            
        } catch (Exception e) {
            logger.error("Error in bulk email campaign: {}", e.getMessage(), e);
            response.put("status", "error");
            response.put("message", e.getMessage());
        }
        
        return response;
    }

    @PostMapping("/cancel-all")
    @ResponseBody
    public String cancelAll() {
        logger.warn("Emergency stop initiated - cancelling all email operations");
        campaignCancelled = true;
        
        synchronized (runningTasks) {
            for (CompletableFuture<Void> task : runningTasks) {
                task.cancel(true);
            }
            runningTasks.clear();
        }
        
        emailTasks.clear();
        emailStatus.replaceAll((email, status) -> {
            if ("Pending".equals(status) || "Queued".equals(status) || "Sending".equals(status)) {
                return "Cancelled";
            }
            return status;
        });
        
        sendProgressUpdate();
        return "All email operations cancelled successfully";
    }

    @PostMapping("/update-credentials")
    @ResponseBody
    public Map<String, Object> updateCredentials(@RequestBody Map<String, String> credentials) {
        logger.info("Updating email credentials");
        Map<String, Object> response = new HashMap<>();
        
        try {
            String email = credentials.get("email");
            String password = credentials.get("password");
            
            if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                response.put("status", "error");
                response.put("message", "Email and password are required");
                return response;
            }
            
            JavaMailSenderImpl mailSenderImpl = (JavaMailSenderImpl) mailSender;
            
            // Prevent users from setting default credentials directly
            if (defaultUsername.equals(email.trim())) {
                response.put("status", "error");
                response.put("message", "Cannot use system reserved email address");
                return response;
            }
            
            mailSenderImpl.setUsername(email.trim());
            mailSenderImpl.setPassword(password.trim());
            
            response.put("status", "success");
            response.put("message", "Email credentials updated successfully");
            logger.info("Email credentials updated for: {}", email);
            
        } catch (Exception e) {
            logger.error("Error updating credentials: {}", e.getMessage(), e);
            response.put("status", "error");
            response.put("message", "Failed to update credentials: " + e.getMessage());
        }
        
        return response;
    }

    @GetMapping("/get-credentials")
    @ResponseBody
    public Map<String, Object> getCredentials() {
        Map<String, Object> response = new HashMap<>();
        try {
            JavaMailSenderImpl mailSenderImpl = (JavaMailSenderImpl) mailSender;
            String currentUsername = mailSenderImpl.getUsername();
            
            // Hide default credentials from user - only show if user has set their own
            if (defaultUsername.equals(currentUsername)) {
                response.put("email", "");
                response.put("hasPassword", false);
            } else {
                response.put("email", currentUsername != null ? currentUsername : "");
                response.put("hasPassword", mailSenderImpl.getPassword() != null && !mailSenderImpl.getPassword().isEmpty());
            }
        } catch (Exception e) {
            logger.error("Error getting credentials: {}", e.getMessage());
            response.put("email", "");
            response.put("hasPassword", false);
        }
        return response;
    }

    private void updateEmailStatus(String email, String status) {
        emailStatus.put(email, status);
        Map<String, Object> update = new HashMap<>();
        update.put("email", email);
        update.put("status", status);
        update.put("timestamp", System.currentTimeMillis());
        messagingTemplate.convertAndSend("/topic/email-status", update);
    }

    private void sendProgressUpdate() {
        Map<String, Object> progress = new HashMap<>();
        progress.put("total", totalEmails.get());
        progress.put("processed", processedEmails.get());
        progress.put("success", successEmails.size());
        progress.put("failed", failedEmails.size());
        progress.put("cancelled", cancelledEmailsList.size());
        progress.put("percentage", calculateProgress());
        progress.put("timestamp", System.currentTimeMillis());
        
        messagingTemplate.convertAndSend("/topic/progress", progress);
    }

    private int calculateProgress() {
        if (totalEmails.get() == 0) return 0;
        return (int) ((processedEmails.get() * 100.0) / totalEmails.get());
    }

    private void sendEmail(String to, String subject, String message, MultipartFile attachment) throws Exception {
        JavaMailSenderImpl mailSenderImpl = (JavaMailSenderImpl) mailSender;
        if (mailSenderImpl.getUsername() == null || mailSenderImpl.getPassword() == null) {
            throw new RuntimeException("Email credentials not configured. Please configure in Settings.");
        }
        
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        
        helper.setFrom(mailSenderImpl.getUsername());
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(message, true);
        
        if (attachment != null && !attachment.isEmpty()) {
            helper.addAttachment(attachment.getOriginalFilename(), attachment);
        }
        
        mailSender.send(mimeMessage);
    }

    private List<String> readEmailsFromFile(MultipartFile file) throws Exception {
        List<String> emails = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (!line.isEmpty() && line.contains("@")) {
                    emails.add(line);
                }
            }
        }
        return emails;
    }
}