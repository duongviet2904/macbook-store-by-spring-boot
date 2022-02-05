package com.devpro.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_products")
public class Product extends BaseEntity{
	
	@Column(name = "title", length = 500, nullable = false)
	private String title;

	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;

	@Column(name = "price_old", precision = 13, scale = 2, nullable = false)
	private BigDecimal price_old;
	
	@Column(name = "short_description", length = 3000, nullable = false)
	private String short_description;

	@Lob
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String detail_description;

	@Column(name = "seo", nullable = false)
	private String seo;

	@Column(name = "ishot", nullable = false)
	private Boolean ishot = Boolean.FALSE;

	@Column(name = "isnew", nullable = false)
	private Boolean isnew = Boolean.FALSE;

	@Column(name = "issale", nullable = false)
	private Boolean issale = Boolean.FALSE;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;

	  @OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.EAGER, orphanRemoval = true)
	private List<ProductImages> productImages = new ArrayList<ProductImages>();
	
	public void addProductImages(ProductImages _productImages) {
		_productImages.setProduct(this);
		productImages.add(_productImages);
	}
	
	public void removeProductImages(ProductImages _productImages) {
		_productImages.setProduct(null);
		productImages.remove(_productImages);
	}

	public void removeProductImages() {
		for(ProductImages productImages : productImages) {
			removeProductImages(productImages);
		}
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public String getDetail_description() {
		return detail_description;
	}

	public void setDetail_description(String detail_description) {
		this.detail_description = detail_description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	public List<ProductImages> getProductImages() {
		return productImages;
	}

	public void setProductImages(List<ProductImages> productImages) {
		this.productImages = productImages;
	}

	public BigDecimal getPrice_old() {
		return price_old;
	}

	public void setPrice_old(BigDecimal price_old) {
		this.price_old = price_old;
	}

	public Boolean getIshot() {
		return ishot;
	}

	public void setIshot(Boolean ishot) {
		this.ishot = ishot;
	}

	public Boolean getIsnew() {
		return isnew;
	}

	public void setIsnew(Boolean isnew) {
		this.isnew = isnew;
	}

	public Boolean getIssale() {
		return issale;
	}

	public void setIssale(Boolean issale) {
		this.issale = issale;
	}

}
