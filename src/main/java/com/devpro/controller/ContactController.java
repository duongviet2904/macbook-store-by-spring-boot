package com.devpro.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.Contact;
import com.devpro.model.AjaxResponse;
import com.devpro.repositories.ContactRepo;

@Controller 
public class ContactController {
	
	@Autowired
	ContactRepo contactRepo;

	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("contact", new Contact());
		model.addAttribute("cate", "contact");
		return "front-end/contact";
	}
	
	@RequestMapping(value = {"/save-contact-with-ajax"}, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> saveContactWithAjax(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody Contact data) throws Exception{
		data.setCreatedDate(LocalDateTime.now());
		contactRepo.save(data);
		model.addAttribute("cate", "contact");
		return ResponseEntity.ok(new AjaxResponse(200, "Thành công"));
	}
}
