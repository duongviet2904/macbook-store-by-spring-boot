package com.devpro.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.User;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;
import com.devpro.services.ProductService;

@Controller
public class CustomerOrderController {
	@Autowired
	SaleOrderRepo saleOrderRepo;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	ProductRepo productRepo;
	
	@RequestMapping(value = {"/customer/my-orders"}, method = RequestMethod.GET )
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ProductSearch search = new ProductSearch();
		search.setUserId(user.getId());
		model.addAttribute("orders", productService.myOrder(search));
		
		return "back-end/customer/view_orders";
	}
}
