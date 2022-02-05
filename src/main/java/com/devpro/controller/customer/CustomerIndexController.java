package com.devpro.controller.customer;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.User;
import com.devpro.repositories.UserRepo;

@Controller
public class CustomerIndexController {
	
	@Autowired
	UserRepo userRepo;
	
	@RequestMapping(value = { "/customer" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", user);
		return "back-end/customer/index";
	}
	
	@RequestMapping(value = { "/customer-update" }, method = RequestMethod.GET)
	public String index2(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", user);
		return "back-end/customer/update_info";
	}
	
	@RequestMapping(value = { "/customer/{id}" }, method = RequestMethod.GET)
	public String index2(@PathVariable("id") Integer id,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		User user = userRepo.getOne(id);
		model.addAttribute("user", user);
		return "back-end/customer/update_info";
	}
	
	@RequestMapping(value = { "/customer-update" }, method = RequestMethod.POST)
	public String index2(@ModelAttribute("user") User user,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		user.setUpdatedDate(LocalDateTime.now());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(8);
		String result = encoder.encode(user.getPassword());
		user.setPassword(result);
		userRepo.save(user);
		
		return "back-end/customer/index";
	}
}
