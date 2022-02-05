package com.devpro.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;
import com.devpro.repositories.UserRepo;

@Controller 
public class AdminIndexController {
	@Autowired
	CategoryRepo categoryRepo;
	
	@Autowired
	ProductRepo productRepo;
	
	@Autowired
	UserRepo userRepo;
	
	@Autowired
	SaleOrderRepo saleOrderRepo;
	
	@RequestMapping(value = {"/admin"}, method = RequestMethod.GET )
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		model.addAttribute("qualityOfProduct", productRepo.count());
		model.addAttribute("qualityOfUser", userRepo.count());
		model.addAttribute("qualityOfCategory", categoryRepo.count());
		model.addAttribute("qualityOfSaleOrder", saleOrderRepo.count());
		return "back-end/index";
	}

}
