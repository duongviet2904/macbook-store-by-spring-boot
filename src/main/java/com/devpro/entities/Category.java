package com.devpro.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_category")
public class Category extends BaseEntity{
	@Column(name = "name", nullable = false)
	private String name;
	
//	@Lob
//	@Column(name = "description", nullable = false, columnDefinition = "LONGTEXT")
//	private String description;
//	
	@Column(name = "seo", nullable = false)
	private String seo;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "category", fetch = FetchType.LAZY)
	private List<Product> products = new ArrayList<Product>();

	public void addProduct(Product product) {
		products.add(product);
		product.setCategory(this);
	}
	
	public void removeProduct(Product product) {
		products.remove(product);
		product.setCategory(null);
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
//
//	public String getDescription() {
//		return description;
//	}
//
//	public void setDescription(String description) {
//		this.description = description;
//	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
