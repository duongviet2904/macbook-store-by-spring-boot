package com.devpro.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity {
	@Column(name = "code")
	private String code;

	@Column(name = "total", precision = 13, scale = 2, nullable = false)
	private BigDecimal total;

	@Column(name = "customer_firstName")
	private String customerFirstName;
	
	@Column(name = "customer_lastName")
	private String customerLastName;

	@Column(name = "customer_address")
	private String customerAddress;
	
	@Column(name = "customer_phone")
	private String customerPhone;

	@Column(name = "customer_email")
	private String customerEmail;
	
	@Column(name = "customer_note")
	private String customerNote;
	
	@Column(name = "seo")
	private String seo;
//
	@Column(name = "isCancel", nullable = false)
	private Boolean isCancel = Boolean.FALSE;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private User user;
//	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "saleOrder", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<SaleOrderProducts> saleOrderProducts = new ArrayList<SaleOrderProducts>();
	
	public void addSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(this);
		saleOrderProducts.add(_saleOrderProducts);
	}


	public double total() {
		Double total = 0.00;
		for(SaleOrderProducts pro : saleOrderProducts) {
			total = total + pro.getQuality() * pro.getProduct().getPrice().doubleValue();
		}
		return total;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerFirstName() {
		return customerFirstName;
	}

	public void setCustomerFirstName(String customerFirstName) {
		this.customerFirstName = customerFirstName;
	}

	public String getCustomerLastName() {
		return customerLastName;
	}

	public void setCustomerLastName(String customerLastName) {
		this.customerLastName = customerLastName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerNote() {
		return customerNote;
	}

	public void setCustomerNote(String customerNote) {
		this.customerNote = customerNote;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public List<SaleOrderProducts> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(List<SaleOrderProducts> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Boolean getIsCancel() {
		return isCancel;
	}


	public void setIsCancel(Boolean isCancel) {
		this.isCancel = isCancel;
	}

	

}
