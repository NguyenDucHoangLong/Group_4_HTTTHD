package tools;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMai {

	public static void sendMail(String to, String subject, String text, String name) {
		final String email = "yoloshop12345@gmail.com";
		final String password = "yolo12345";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(email, password);
					}
				});
		try {
			String content = "Email:" + to + "------Họ tên:" + name + "---------Nội dung:" + text;
			Message message = new MimeMessage(session);
			message.setHeader("Content-Type", "text/plain; charset=UTF-8");
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("yolocustomer@gmail.com"));
			message.setSubject(subject);
			message.setText(content);
			Transport.send(message);
			System.out.println("Sent message successfully …");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

	public static void main(String[] args) {
		sendMail("ndhlong1994@gmail.com", "sendmai", "hello, Duong", "Long");
	}
}
