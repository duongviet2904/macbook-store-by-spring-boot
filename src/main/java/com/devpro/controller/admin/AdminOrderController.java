package com.devpro.controller.admin;

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

import com.devpro.entities.SaleOrder;
import com.devpro.model.AjaxResponse;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;
import com.devpro.services.ProductService;

@Controller 
public class AdminOrderController {

	@Autowired
	SaleOrderRepo saleOrderRepo;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	ProductRepo productRepo;
	
	@RequestMapping(value = {"/admin/orders"}, method = RequestMethod.GET )
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		ProductSearch productSearch = new ProductSearch();
		model.addAttribute("orders", saleOrderRepo.findAll());
		model.addAttribute("service", productService);
		model.addAttribute("productSearch", productSearch);
		
		return "back-end/view_orders";
	}
	
	@RequestMapping(value = {"/admin/is-pay"}, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> pay(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody SaleOrder data) throws Exception{
		SaleOrder order = saleOrderRepo.getOne(data.getId());
		order.setUpdatedDate(LocalDateTime.now());
		order.setStatus(true);
		saleOrderRepo.save(order);
		return ResponseEntity.ok(new AjaxResponse(200, "Thành công"));
	}
	
	@RequestMapping(value = {"/admin/is-ship"}, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> refund(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody SaleOrder data) throws Exception{
		SaleOrder order = saleOrderRepo.getOne(data.getId());
		order.setUpdatedDate(LocalDateTime.now());
		order.setStatus(false);
		saleOrderRepo.save(order);
		return ResponseEntity.ok(new AjaxResponse(200, "Thành công"));
	}
	
	@RequestMapping(value = {"/admin/is-cancel"}, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> cancel(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody SaleOrder data) throws Exception{
		SaleOrder order = saleOrderRepo.getOne(data.getId());
		order.setUpdatedDate(LocalDateTime.now());
		order.setIsCancel(true);
		saleOrderRepo.save(order);
		return ResponseEntity.ok(new AjaxResponse(200, "Thành công"));
	}
}
