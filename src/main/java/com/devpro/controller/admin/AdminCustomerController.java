package com.devpro.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.repositories.UserRepo;

@Controller 
public class AdminCustomerController {
	
	@Autowired
	UserRepo userRepo;
	
	@RequestMapping(value = {"/admin/customers"}, method = RequestMethod.GET )
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		model.addAttribute("users", userRepo.findAll());
		return "back-end/view_customers";
	}
	
	@RequestMapping(value = {"/admin/customers-delete/{id}"}, method = RequestMethod.GET )
	public String index(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		userRepo.deleteById(id);
		return "back-end/view_customers";
	}
}
