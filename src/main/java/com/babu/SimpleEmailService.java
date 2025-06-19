package com.babu;

import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

@Service
public class SimpleEmailService {
    
    public void sendEmail(String to, String subject, String message, String username, String password) throws Exception {
        // Create properties
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        // Create session with authenticator
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        // Create message
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(username));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        
        // Set plain text content - avoid any HTML or multipart
        msg.setText(message);
        
        // Send message
        Transport.send(msg);
    }
}