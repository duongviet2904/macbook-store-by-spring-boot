package com.devpro.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class AdminSlideController {
	@RequestMapping(value = {"/admin/slides"}, method = RequestMethod.GET )
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		return "back-end/view_slides";
	}
	
	@RequestMapping(value = {"/admin/slide-add"}, method = RequestMethod.GET )
	public String add(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		return "back-end/insert_slide";
	}
}
