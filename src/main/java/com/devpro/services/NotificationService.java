//package com.devpro.services;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.mail.MessagingException;
//import javax.mail.internet.MimeMessage;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.MailException;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.stereotype.Service;
//
//import com.devpro.entities.NotificationEmail;
//import com.devpro.entities.Product;
//import com.devpro.repositories.NotificationEmailRepo;
//
//@Service
//public class NotificationService {
//	
//	@Autowired
//	NotificationEmailRepo notificationEmailRepo;
//	
//	@Autowired
//	private JavaMailSender javaMailSender;
//
//	@Autowired
//	public NotificationService(JavaMailSender javaMailSender) {
//		this.javaMailSender = javaMailSender;
//	}
//	
//	public void sendMail(NotificationEmailRepo notificationEmailRepo, Product product) throws MailException, MessagingException{
//		MimeMessage mail = javaMailSender.createMimeMessage();
//		MimeMessageHelper helper = new MimeMessageHelper(mail, true);
//		
//		List<NotificationEmail> list = new ArrayList<>();
//		list = notificationEmailRepo.findAll();
//		for(int i = 0; i < list.size(); i++) {
//			helper.setFrom("duongnguyenviet2904@gmail.com");
//			helper.setTo(list.get(i).getEmail());
//			helper.setSubject("Chúng tôi vừa mở bán 1 sản phẩm mới!");
//			helper.setText("Vui lòng bấm vào <a href=\"localhost:8888/shop-details/" + product.getSeo() + "\">đây</a> để xem chi tiết !", true) ;
//			
//			javaMailSender.send(mail);
//		}
//		
//	}
//	
//	public void sendMailThanks(String email) throws MailException{
//		SimpleMailMessage mail = new SimpleMailMessage();
//		mail.setFrom("duongnguyenviet2904@gmail.com");
//		mail.setTo(email);
//		mail.setSubject("Thư cảm ơn!");
//		mail.setText("Cảm ơn bạn đã đăng kí nhận thông báo sản phẩm mới! \nChúng tôi hứa sẽ mang tới cho quý khách những sản phẩm tuyệt vời nhất !") ;
//		
//		javaMailSender.send(mail);
//		System.out.println("send mail successful!");
//		
//	}
//}
