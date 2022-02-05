package com.devpro.controller.admin;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.controller.BaseCategoryController;
import com.devpro.entities.Product;
import com.devpro.repositories.NotificationEmailRepo;
import com.devpro.repositories.ProductRepo;
//import com.devpro.services.NotificationService;
import com.devpro.services.ProductService;
import com.github.slugify.Slugify;

@Controller 
public class AdminProductController extends BaseCategoryController{

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductRepo productRepo;
	
//	@Autowired
//	NotificationEmailRepo notificationEmailRepo;
//	
//	@Autowired
//	NotificationService notificationService;
	
	@RequestMapping(value = {"/admin/products"}, method = RequestMethod.GET )
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		List<Product> products = productRepo.findAll();
		model.addAttribute("products", products);
		
		return "back-end/view_products";
	}
	
	
	@RequestMapping(value = {"/admin/product-add"}, method = RequestMethod.GET )
	public String add(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		model.addAttribute("product", new Product());
		return "back-end/insert_product";
	}
	
	//EDIT - ADD
	@RequestMapping(value = {"/admin/product-add"}, method = RequestMethod.POST)
	public String saveProduct(@RequestParam("product_images") MultipartFile[] productImages,
			@ModelAttribute("product") Product product,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		
		Slugify slg = new Slugify();
		String seo = slg.slugify(product.getTitle() + "-" + System.currentTimeMillis());
		product.setSeo(seo);
		product.setCreatedDate(LocalDateTime.now());
		productService.save(productImages, product);
		
//		notificationService.sendMail(notificationEmailRepo, product);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value = { "/admin/products/{id}" }, method = RequestMethod.GET)
	public String saveProduct(@PathVariable("id") Integer id,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		Product product = productRepo.getOne(id);
		model.addAttribute("product", product);
		return "back-end/insert_product";
	}
	
	@RequestMapping(value = { "/admin/product-delete/{id}" }, method = RequestMethod.GET)
	public String deleteProduct(@PathVariable("id") Integer id,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		productRepo.deleteById(id);
		return "redirect:/admin/products";
	}
	
}
