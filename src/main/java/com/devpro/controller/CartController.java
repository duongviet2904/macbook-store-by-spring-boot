package com.devpro.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.Cart;
import com.devpro.entities.CartItem;
import com.devpro.entities.Product;
import com.devpro.entities.SaleOrder;
import com.devpro.entities.SaleOrderProducts;
import com.devpro.entities.User;
import com.devpro.model.AjaxResponse;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;
import com.devpro.repositories.UserRepo;

@Controller
public class CartController extends BaseCategoryController {

	@Autowired ProductRepo productRepo;
	@Autowired SaleOrderRepo saleOrderRepo;
	@Autowired UserRepo userRepo;
	
	@RequestMapping(value = { "/choose-product-to-cart" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> muaHang(@RequestBody CartItem cartItem,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();
		
		Cart cart = null;
		// kiểm tra xem SESSION đã có gio hàng chưa ?
		// nếu chưa có thì tạo mới 1 giỏ hàng và lưu vào SESSION.
		if (httpSession.getAttribute("CART") != null) {
			cart = (Cart) httpSession.getAttribute("CART");
		} else {
			cart = new Cart();
			httpSession.setAttribute("CART", cart);
		}
		
		List<CartItem> _cartItem = cart.getCartItems();
		
		boolean sanPhamDaCoTrongGioHangPhaiKhong = false;
		
		// trường hợp đã có sản phẩm trong giỏ hàng.
		for(CartItem item : _cartItem) {
			if(item.getMaSanPham() == cartItem.getMaSanPham()) {
				sanPhamDaCoTrongGioHangPhaiKhong = true;
				item.setSoluong(item.getSoluong() + cartItem.getSoluong());
				
			}
		}
		
		// nếu sản phẩm chưa có trong giỏ hàng.
		if(!sanPhamDaCoTrongGioHangPhaiKhong) {
			
			Product product = productRepo.getOne(cartItem.getMaSanPham());
			cartItem.setTenSanPham(product.getTitle());
			cartItem.setGiaban(product.getPrice());
			cartItem.setSeo(product.getSeo());
			cartItem.setProductImages(product.getProductImages());
			cart.getCartItems().add(cartItem);
		}
		httpSession.setAttribute("SL_SP_GIO_HANG", cart.getCartItems().size());
		httpSession.setAttribute("total", cart.total(productRepo));
		model.addAttribute("cate", "shop");
		return ResponseEntity.ok(new AjaxResponse(200, cart.getCartItems().size()));
	}
	
	@RequestMapping(value = { "/remove-product-to-cart/{seo}" }, method = RequestMethod.GET)
	public String removePro(@PathVariable("seo") String seo,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();
		Cart cart = (Cart) httpSession.getAttribute("CART");
		List<CartItem> _cartItem = cart.getCartItems();
		
		for(int i = 0; i < _cartItem.size(); i++) {
			if(_cartItem.get(i).getSeo().equals(seo)) {
				_cartItem.remove(i);
			}
		}
		
		httpSession.setAttribute("SL_SP_GIO_HANG", cart.getCartItems().size());
		httpSession.setAttribute("total", cart.total(productRepo));
		model.addAttribute("cate", "page");
		return "front-end/shopping-cart";
	}
	
	@RequestMapping(value = { "/save-cart" }, method = RequestMethod.POST)
	public String save(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		
		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();
		Cart cart = (Cart) httpSession.getAttribute("CART");;
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String note = request.getParameter("note");
		Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		saleOrder.setCreatedDate(LocalDateTime.now());
		saleOrder.setCustomerFirstName(firstName);
		saleOrder.setCustomerLastName(lastName);
		saleOrder.setCustomerAddress(address);
		saleOrder.setCustomerPhone(phone);
		saleOrder.setCustomerEmail(email);
		saleOrder.setCustomerNote(note);
		saleOrder.setTotal(cart.getTotal(productRepo));
		if(user instanceof User) {
			saleOrder.setUser(userRepo.getOne(((User) user).getId()));
		}
		for(CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productRepo.getOne(cartItem.getMaSanPham()));
			saleOrderProducts.setQuality(cartItem.getSoluong());
			saleOrderProducts.setCreatedDate(LocalDateTime.now());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}
		saleOrderRepo.save(saleOrder);
		
		// lưu xong xoá giỏ hàng đi
		httpSession.removeAttribute("CART");
		httpSession.removeAttribute("SL_SP_GIO_HANG");
		httpSession.removeAttribute("total");
		model.addAttribute("cate", "page");
		return "front-end/shopping-cart";
	}
}
