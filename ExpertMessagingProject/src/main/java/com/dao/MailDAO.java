package com.dao;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;

public class MailDAO {

	private JavaMailSender mailSender;
	
	public MailDAO() {
       super();
	}

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public boolean sendMail(String to,String subject,String msg)
	{
		boolean b = false;
		
		MimeMessagePreparator prep = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage)
					throws Exception 
			{
			   mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			   mimeMessage.setFrom(new InternetAddress("abc@gmail.com"));
			   mimeMessage.setContent(msg,"text/html; charset=utf-8");
			   mimeMessage.setSubject(subject);
			}
		};
		
		try
		{
			mailSender.send(prep);
			b = true;
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return b;
	}

}
