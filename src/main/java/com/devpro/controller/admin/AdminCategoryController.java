package com.devpro.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.devpro.entities.Category;
import com.devpro.repositories.CategoryRepo;
import com.github.slugify.Slugify;

@Controller 
public class AdminCategoryController{
	
	@Autowired
	private CategoryRepo categoryRepo;
	
	@RequestMapping(value = {"/admin/categories"}, method = RequestMethod.GET )
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		model.addAttribute("categories", categoryRepo.findAll());
		return "back-end/view_categories";
	}
	
	@RequestMapping(value = {"/admin/category-add"}, method = RequestMethod.GET )
	public String add(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		model.addAttribute("category", new Category());
		return "back-end/insert_category";
	}
	
	@RequestMapping(value = {"/admin/category-add"}, method = RequestMethod.POST)
	public String add(@ModelAttribute("category") Category category,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		Slugify slg = new Slugify();
		String seo = slg.slugify(category.getName() + "-" + System.currentTimeMillis());
		category.setSeo(seo);
		categoryRepo.save(category);
		return "redirect:/admin/categories";
	}

	@RequestMapping(value = { "/admin/categories/{id}" }, method = RequestMethod.GET)
	public String saveCategory(@PathVariable("id") Integer id,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		Category category = categoryRepo.getOne(id);
		model.addAttribute("category", category);
		return "back-end/insert_category";
	}

	@RequestMapping(value = { "/admin/categories-delete/{id}" }, method = RequestMethod.GET)
	public String deleteCategory(@PathVariable("id") Integer id,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		categoryRepo.deleteById(id);
		return "redirect:/admin/categories";
	}
}
