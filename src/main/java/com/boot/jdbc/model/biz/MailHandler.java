package com.boot.jdbc.model.biz;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler{
	
	private final JavaMailSender sender;
	private final MimeMessage mimeMessage;
	private final MimeMessageHelper mimeMessageHelper;
	
	public MailHandler(JavaMailSender javaMailSender) throws MessagingException {
		this.sender = javaMailSender;
		this.mimeMessage = javaMailSender.createMimeMessage();
		this.mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		
	}
	
	public void setFrom(String fromAdderss) throws MessagingException {
		mimeMessageHelper.setFrom(fromAdderss);
	}
	
	public void setTo(String email) throws MessagingException {
		mimeMessageHelper.setTo(email);
	}
	
	public void setSubject(String subject) throws MessagingException {
		mimeMessageHelper.setSubject(subject);
	}
	
	public void setText(String text, boolean useHtml) throws MessagingException {
		mimeMessageHelper.setText(text,useHtml);
	}
	
	public void setAttach(String fileName, String path) throws IOException, MessagingException {
		File file = new ClassPathResource(path).getFile();
		FileSystemResource fileSystemResource = new FileSystemResource(file);
		
		mimeMessageHelper.addInline(fileName, fileSystemResource);
	}
	
	public void setInline(String fileName, String path) throws IOException, MessagingException {
		File file = new ClassPathResource(path).getFile();
        FileSystemResource fileSystemResource = new FileSystemResource(file);

        mimeMessageHelper.addInline(fileName, fileSystemResource);
	}
	
	public void send() {
		sender.send(mimeMessage);
	}
	
	
	
	
	
	
}
