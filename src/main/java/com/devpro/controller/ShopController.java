package com.devpro.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Constants;
import com.devpro.entities.Product;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.ProductService;

@Controller 
public class ShopController extends BaseCategoryController implements Constants{
	
	@Autowired
	private ProductRepo productRepo;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = { "/shop" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute(CURRENTCATEGORYSEO);
		
		ProductSearch productSearch = new ProductSearch();
		httpSession.setAttribute("productSeach", productSearch);
		Integer currentPage = 1;
		BigDecimal priceBegin = null;
		BigDecimal priceEnd = null;
		
		String strCurrentPage = request.getParameter("page");
		String strPriceBegin = request.getParameter("priceBegin");
		String strPriceEnd = request.getParameter("priceEnd");
		String strValueToSort = request.getParameter("value");
		
		if(strCurrentPage != null) currentPage = Integer.parseInt(strCurrentPage);
			productSearch.setCurrentPage(currentPage);
		
		if(strPriceBegin != null && strPriceEnd != null) {
			priceBegin = new BigDecimal(strPriceBegin);
			priceEnd = new BigDecimal(strPriceEnd);
		}
		
		if(strPriceBegin != null && strPriceEnd == null) {
			priceBegin = new BigDecimal(strPriceBegin);
		}
		
		if(strValueToSort != null && strValueToSort.equalsIgnoreCase("asc")) {
			strValueToSort.replaceAll(strValueToSort, "asc");
		} else if(strValueToSort != null && strValueToSort.equalsIgnoreCase("desc")) {
			strValueToSort.replaceAll(strValueToSort, "desc");
		}
		
		productSearch.setCurrentPage(null);
		productSearch.setPriceBegin(priceBegin);
		productSearch.setPriceEnd(priceEnd);
		productSearch.setValue(strValueToSort);
		List<Product> list = productService.search(productSearch);
		double tam = (double) list.size() / productSearch.SIZE_ITEMS_ON_PAGE;
		int totalPage = (int) Math.ceil(tam);
		
		httpSession.setAttribute("size", productService.search(productSearch).size());
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("beginPrice", priceBegin);
		model.addAttribute("endPrice", priceEnd);
		model.addAttribute("value", strValueToSort);
		productSearch.setCurrentPage(currentPage);
		httpSession.setAttribute("currentPage", currentPage);
		
		model.addAttribute("products", productService.search(productSearch));

		String link = request.getRequestURL().toString() + "?" + request.getQueryString();
		model.addAttribute("link", link);
		model.addAttribute("cate", "shop");
		return "front-end/shop";
	}
	
	@RequestMapping(value = { "/shop-details" }, method = RequestMethod.GET)
	public String shopDetails(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		return "front-end/shop-details";
	}
	
	@RequestMapping(value = { "/shopping-cart" }, method = RequestMethod.GET)
	public String cart(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		httpSession.getAttribute("CART");
		model.addAttribute("productRepo", productRepo);
		httpSession.getAttribute("total");
		model.addAttribute("cate", "page");
		return "front-end/shopping-cart";
	}
	
	//DETAILES
	@RequestMapping(value = { "/shop-details/{seo}" }, method = RequestMethod.GET)
	public String index(@PathVariable("seo") String seo,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		ProductSearch productSearch2 = new ProductSearch();
		productSearch2.setSeoProduct(seo);
		Product product = productService.searchProductBySeo(productSearch2);
		model.addAttribute("product", product);
		model.addAttribute("size", product.getProductImages().size());
		
		productSearch2.setSeoCategoty(product.getCategory().getSeo());
		
		List<Product> _products = productService.search(productSearch2);
		model.addAttribute("relatedProducts",_products );
		model.addAttribute("cate", "shop");
		
		return "front-end/shop-details";
	}
	
	
	//SEARCH CATEGORY
	@RequestMapping(value = { "/shop/{seo}" }, method = RequestMethod.GET)
	public String getFromCategoryId(@PathVariable("seo") String seo,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		ProductSearch productSearch = new ProductSearch();
		
		productSearch.setSeoCategoty(seo);
		Integer currentPage = 1;
		BigDecimal priceBegin = null;
		BigDecimal priceEnd = null;
		
		String strCurrentPage = request.getParameter("page");
		String strPriceBegin = request.getParameter("priceBegin");
		String strPriceEnd = request.getParameter("priceEnd");
		String strValueToSort = request.getParameter("value");
		
		if(strCurrentPage != null) currentPage = Integer.parseInt(strCurrentPage);
			productSearch.setCurrentPage(currentPage);
		
		if(strPriceBegin != null && strPriceEnd != null) {
			priceBegin = new BigDecimal(strPriceBegin);
			priceEnd = new BigDecimal(strPriceEnd);
		}
		
		if(strPriceBegin != null && strPriceEnd == null) {
			priceBegin = new BigDecimal(strPriceBegin);
		}
		
		if(strValueToSort != null && strValueToSort.equalsIgnoreCase("asc")) {
			strValueToSort.replaceAll(strValueToSort, "asc");
		} else if(strValueToSort != null && strValueToSort.equalsIgnoreCase("desc")) {
			strValueToSort.replaceAll(strValueToSort, "desc");
		}
		
		productSearch.setValue(strValueToSort);
		productSearch.setPriceBegin(priceBegin);
		productSearch.setPriceEnd(priceEnd);
		
		productSearch.setCurrentPage(null);
		List<Product> list = productService.search(productSearch);
		double tam = (double) list.size() / productSearch.SIZE_ITEMS_ON_PAGE;
		int totalPage = (int) Math.ceil(tam);
		
		httpSession.setAttribute("size", productService.search(productSearch).size());
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("beginPrice", priceBegin);
		model.addAttribute("endPrice", priceEnd);
		model.addAttribute("value", strValueToSort);
		
		productSearch.setCurrentPage(currentPage);
		httpSession.setAttribute("currentPage", currentPage);
		
		//List<Product> products = productService.search(productSearch);
		
		model.addAttribute("products", productService.search(productSearch));
		httpSession.setAttribute("currentPage", currentPage);
		httpSession.setAttribute("currentCategorySeo", seo);
		model.addAttribute("cate", "shop");
		return "front-end/shop";
	}
	
	//SEARCH-KEYWORD
	@RequestMapping(value = { "/shop" }, method = RequestMethod.POST)
	public String seachByKeyWord(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		ProductSearch productSearch = (ProductSearch) httpSession.getAttribute("productSeach");
		httpSession.removeAttribute(CURRENTCATEGORYSEO);
		
		String keyword = request.getParameter("keyword");
		productSearch.setKeyword(keyword);
		
		Integer currentPage = 1;
		
		String strCurrentPage = request.getParameter("page");
		
		if(strCurrentPage != null) currentPage = Integer.parseInt(strCurrentPage);
			productSearch.setCurrentPage(currentPage);
		
		productSearch.setCurrentPage(null);
		httpSession.setAttribute("size", productService.search(productSearch).size());
		
		productSearch.setCurrentPage(currentPage);
		model.addAttribute("products", productService.search(productSearch));
		model.addAttribute("cate", "shop");
		
		return "front-end/shop";
	}
		
		//SEARCH BY TAGNAME
		@RequestMapping(value = { "/shop/search-by/{tag}"}, method = RequestMethod.GET)
		public String index4(@PathVariable("tag") String tag,
				final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
				throws Exception {
			ProductSearch productSearch = new ProductSearch();
			productSearch.setTag(tag);
			Integer currentPage = 1;
			
			String strCurrentPage = request.getParameter("page");
			
			if(strCurrentPage != null) currentPage = Integer.parseInt(strCurrentPage);
				productSearch.setCurrentPage(currentPage);
			
			productSearch.setCurrentPage(null);
			model.addAttribute("size", productService.search(productSearch).size());
			
			productSearch.setCurrentPage(currentPage);
			model.addAttribute("products", productService.search(productSearch));
			
			productSearch.setTag(null);
			
			model.addAttribute("cate", "shop");
			
			return "front-end/shop";
		}
		
}
