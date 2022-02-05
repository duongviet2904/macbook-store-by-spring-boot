package com.devpro.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.devpro.repositories.ProductRepo;

public class Cart {
	private List<CartItem> cartItems = new ArrayList<CartItem>();

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public BigDecimal getTotal(ProductRepo productRepo ) {
		BigDecimal decimal = BigDecimal.ZERO;
		for(CartItem cartItem : cartItems) {
			Product product = productRepo.getOne(cartItem.getMaSanPham());
			decimal = decimal.add(product.getPrice());
		}
		return decimal;
	}
	
	public double total(ProductRepo productRepo) {
		Double total = 0.00;
		for(CartItem cartItem : cartItems) {
			Product product = productRepo.getOne(cartItem.getMaSanPham());
			total = total + cartItem.getSoluong() * product.getPrice().doubleValue();
		}
		return total;
	}
}
