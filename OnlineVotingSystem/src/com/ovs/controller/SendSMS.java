package com.ovs.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Properties;
import java.util.Random;

import javax.mail.*;  
import javax.mail.internet.*;
import javax.activation.*;
 
public class SendSMS {
	
	public static void main(String args[]) {
		String msg = SendSMS.sendSms(132456,919677251702L);
		System.out.println(msg);
	}

	public static String sendSms(int otp,long mobnum) {
		try {	
			// Construct data
			String apiKey = "apikey=" + "vP3loOvkGOg-RxlJa6CH2uemkZfM6XaUGIyDXiHiu2";// vP3loOvkGOg-UFF6NY8Htzs5fXWIGLjQlArQn0603j	
			String message = "&message=" + "Your OTP for Online Voting is "+otp;
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + "919677251702";
			System.out.println(message);
			System.out.println(numbers);
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			
			return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			return "Error "+e;
		}
}
	public int generateOtp() {
		int otp = 0;
		for(int i=0;i<20;i++) {
			otp = new Random().nextInt(899999)+100000;
		}
			return otp;
	}
	
	public static void sendMail(int otp,String to){  
        //Get properties object    
        Properties props = new Properties();    
        props.put("mail.smtp.host", "smtp.gmail.com");    
        props.put("mail.smtp.socketFactory.port", "465");    
        props.put("mail.smtp.socketFactory.class",    
                  "javax.net.ssl.SSLSocketFactory");    
        props.put("mail.smtp.auth", "true");    
        props.put("mail.smtp.port", "465");    
        //get Session   
        Session session = Session.getDefaultInstance(props,    
         new javax.mail.Authenticator() {    
         protected PasswordAuthentication getPasswordAuthentication() {    
         return new PasswordAuthentication("onlinevoting21@gmail.com","8618959874");  
         }    
        });    
        //compose message    
        try {    
         MimeMessage message = new MimeMessage(session);    
         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
         message.setSubject("OTP to vote");    
         message.setText("Your OTP is "+otp+".");    
         //send message  
         Transport.send(message);    
         System.out.println("message sent successfully");    
        } catch (MessagingException e) {throw new RuntimeException(e);}    
           
  }  
}