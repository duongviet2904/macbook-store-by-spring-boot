package com.devpro.model;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

public class ProductSearch {

	public static int SIZE_ITEMS_ON_PAGE = 12;

	private String seoProduct;
	private String seoCategoty;
	private String name;
	private Integer id;
	private Integer currentPage = 1;
	private Integer categoryId;
	private BigDecimal price;
	private String value;
	private String keyword;
	private BigDecimal priceBegin, priceEnd;
	private String tag;
	private Integer userId;
	//hibernate pagination
	private int begin, end, totalPage;
	
	public ProductSearch() {
		
	}
	
	public void parseRequest(final HttpServletRequest request) {
		Integer currentPage = null;

		String strPage = request.getParameter("page");
		if (strPage != null && !strPage.isEmpty()) {
			currentPage = Integer.parseInt(strPage);
		}

		this.setCurrentPage(currentPage);
	}

	public String getSeoProduct() {
		return seoProduct;
	}

	public void setSeoProduct(String seoProduct) {
		this.seoProduct = seoProduct;
	}

	public String getSeoCategoty() {
		return seoCategoty;
	}

	public void setSeoCategoty(String seoCategoty) {
		this.seoCategoty = seoCategoty;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public BigDecimal getPriceBegin() {
		return priceBegin;
	}

	public void setPriceBegin(BigDecimal priceBegin) {
		this.priceBegin = priceBegin;
	}

	public BigDecimal getPriceEnd() {
		return priceEnd;
	}

	public void setPriceEnd(BigDecimal priceEnd) {
		this.priceEnd = priceEnd;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	

}
