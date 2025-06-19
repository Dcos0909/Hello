package com.babu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BabuApplication {

	public static void main(String[] args) {
		// Set Jakarta Mail provider before starting application
		System.setProperty("mail.util.StreamProvider.class", "org.eclipse.angus.mail.util.DefaultStreamProvider");
		System.setProperty("mail.mime.StreamProvider.class", "org.eclipse.angus.mail.util.DefaultStreamProvider");
		
		SpringApplication.run(BabuApplication.class, args);
	}

}
