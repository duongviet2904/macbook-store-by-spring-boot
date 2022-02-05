package com.devpro.controller.admin;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.User;
import com.devpro.repositories.UserRepo;

@Controller 
public class AdminLoginController {

	@Autowired
	private UserRepo userRepo;
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		return "back-end/login";
	}
	
	@RequestMapping(value = { "/registion" }, method = RequestMethod.POST)
	public String registion(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password_again = request.getParameter("password-again");
		String email = request.getParameter("email");
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(8);
		User user = new User();
		
		if(password.equals(password_again)) {
			user.setUsername(username);
			user.setPassword(encoder.encode(password));
			user.setEmail(email);
			user.setCreatedDate(LocalDateTime.now());
		}
		
		userRepo.save(user);
		return "back-end/login";
	}
	

	@RequestMapping(value = { "/hien-thi-loi-neu-khong-co-quen" }, method = RequestMethod.GET)
	public String accessDenied(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		return "back-end/accessDenied";
	}
	
}
