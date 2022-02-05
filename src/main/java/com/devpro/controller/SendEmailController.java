//package com.devpro.controller;
//
//import java.time.LocalDateTime;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.devpro.entities.NotificationEmail;
//import com.devpro.model.AjaxResponse;
//import com.devpro.repositories.NotificationEmailRepo;
//import com.devpro.repositories.ProductRepo;
//import com.devpro.services.NotificationService;
//import com.devpro.services.ProductService;
//
//@RestController
//public class SendEmailController {
//
//	@Autowired
//	NotificationEmailRepo notificationEmailRepo;
//	
//	@Autowired
//	NotificationService notificationService;
//	
//	@Autowired 
//	ProductRepo productRepo;
//	
//	@Autowired 
//	ProductService productService;
//	
//	@RequestMapping(value = { "/send-email" }, method = RequestMethod.GET)
//	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
//			throws Exception {
//		model.addAttribute("notificationEmail", new NotificationEmail());
//		model.addAttribute("cate", "home");
//		return "front-end/index";
//	}
//
//	@RequestMapping(value = {"/save-notification-email"}, method = RequestMethod.POST)
//	public ResponseEntity<AjaxResponse> saveContactWithAjax(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
//			@RequestBody NotificationEmail data) throws Exception{
//		data.setCreatedDate(LocalDateTime.now());
//		
//		notificationEmailRepo.save(data);
//		
//		notificationService.sendMailThanks(String.valueOf(data.getEmail()));
//		model.addAttribute("cate", "home");
//		return ResponseEntity.ok(new AjaxResponse(200, "Thành công"));
//	}
//}
