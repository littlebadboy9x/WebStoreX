package com.example.webstorex.Entity;

import java.io.Serializable;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Cartdetails")
public class CartDetail implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@ManyToOne
	@JoinColumn(name = "Cartid")
	CartItem cartItem;
	@ManyToOne
	@JoinColumn(name = "Prdid")
	Product product;
	Double price;
	Integer Amount;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public CartItem getCartItem() {
		return cartItem;
	}
	public void setCartItem(CartItem cartItem) {
		this.cartItem = cartItem;
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
	public CartDetail(Integer id, CartItem cartItem, Product product, Double price, Integer amount) {
		this.id = id;
		this.cartItem = cartItem;
		this.product = product;
		this.price = price;
		Amount = amount;
	}
	public CartDetail() {
		
	}
	
}
