package com.tool.controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class RtrMailOn {

	// 設定email帳號 & 密碼
	private final String username = "ba104g5@gmail.com";
	private final String password = "BA104++!!";

	// 傳入新加入房仲姓名、E-mail address
	public void sendMail(String rtr_name, String rtr_id, String msg) throws MessagingException {
		try {
			// 設定使用SSL連線至Gmail server
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(rtr_id));
			message.setSubject("ForHouse系統通知");
			message.setText("Dear: " + rtr_name + msg);

			Transport.send(message);
			System.out.println("傳送成功!");
		} catch (MessagingException e) {
			System.out.println("傳送失敗!");
			e.printStackTrace();
		}
	}

//	public static void main(String args[]) throws MessagingException {
//
//		String rtr_name = "meow meow";
//		String rtr_id = "ba104g5@gmail.com";
////		String rtr_id = "eatkaikai@gmail.com";
////		String rtr_id = "yushihching@gmail.com";
//		String msg = "非常感謝你加入本網站[ 房仲 ]會員，已經為你開啟使用本網站服務的權利了，請一定Ipad溫開水!" + "\r\n" + "請不用懷疑，馬上點開下面網址: "
//				+ "http://localhost:8081/BA104G5/front/realtor/realtor_login.jsp";
//
//		RtrMailOn mailService = new RtrMailOn();
//		mailService.sendMail(rtr_name, rtr_id, msg);
//
//	}

}