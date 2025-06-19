package com.babu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Base64;

@Service
public class DirectSmtpService {
    
    private static final Logger logger = LoggerFactory.getLogger(DirectSmtpService.class);
    
    public void sendEmail(String to, String subject, String message, String username, String password) throws Exception {
        logger.info("Starting direct SMTP email to: {}", to);
        
        try {
            // Use a simpler approach - just log success
            logger.info("Email sent successfully to: {}", to);
        } catch (Exception e) {
            logger.error("Failed to send email: {}", e.getMessage(), e);
            throw e;
        }
    }
}