package com.example.webstorex.Entity;

import java.io.Serializable;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Orderdetails")
public class OrderDetail implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@ManyToOne
	@JoinColumn(name = "Payid")
	Pay pay;
	@ManyToOne
	@JoinColumn(name = "Productid")
	Product product;
	Double price;
	Integer Amount;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Pay getPay() {
		return pay;
	}
	
	public void setPay(Pay pay) {
		this.pay = pay;
	}
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public Double getPrice() {
		return price;
	}
	
	public void setPrice(Double price) {
		this.price = price;
	}
	
	public Integer getAmount() {
		return Amount;
	}
	
	public void setAmount(Integer amount) {
		Amount = amount;
	}

	public OrderDetail(Long id, Pay pay, Product product, Double price, Integer amount) {
		this.id = id;
		this.pay = pay;
		this.product = product;
		this.price = price;
		Amount = amount;
	}

	public OrderDetail() {
		
	}
	
}
