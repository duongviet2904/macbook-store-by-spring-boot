package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Constants;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.ProductService;

/**
 * 
 * @author admin
 *
 */
@Controller // -> tạo ra 1 bean tên webConf và được spring-container quản lí.
			// -> báo module web mapping request cho controller này.
public class IndexController implements Constants{
	@Autowired
	ProductRepo productRepo;
	
	@Autowired
	CategoryRepo categoryRepo;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("categories", categoryRepo.findAll());
		model.addAttribute("products", productRepo.findAll());
		model.addAttribute("productsHot", productService.hotProduct());
		model.addAttribute("productsNew", productService.newProduct());
		model.addAttribute("productsSale", productService.saleProduct());
		model.addAttribute("cate", "home");
		return "front-end/index";
	}
	
}
