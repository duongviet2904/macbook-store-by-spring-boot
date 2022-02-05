package com.devpro.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CartItem {
	private int maSanPham;
	private String tenSanPham;
	private int soluong;
	private BigDecimal giaban;
	private String seo;
	private List<ProductImages> productImages = new ArrayList<ProductImages>();
		
	
	public int getMaSanPham() {
		return maSanPham;
	}

	public void setMaSanPham(int maSanPham) {
		this.maSanPham = maSanPham;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public BigDecimal getGiaban() {
		return giaban;
	}

	public void setGiaban(BigDecimal giaban) {
		this.giaban = giaban;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public List<ProductImages> getProductImages() {
		return productImages;
	}

	public void setProductImages(List<ProductImages> productImages) {
		this.productImages = productImages;
	}

}
