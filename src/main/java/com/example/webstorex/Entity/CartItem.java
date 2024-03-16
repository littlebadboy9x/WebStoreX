package com.example.webstorex.Entity;

import java.io.Serializable;
import java.util.List;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Cartitems")
public class CartItem implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@ManyToOne
	@JoinColumn(name = "Userid")
	Account account;
	@OneToMany(mappedBy = "cartItem")
	List<CartDetail> cartDetails;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Account getAccount() {
		return account;
	}
	
	public void setAccount(Account account) {
		this.account = account;
	}
	
	public List<CartDetail> getCartDetails() {
		return cartDetails;
	}
	
	public void setCartDetails(List<CartDetail> cartDetails) {
		this.cartDetails = cartDetails;
	}

	public CartItem(Integer id, Account account, List<CartDetail> cartDetails) {
		this.id = id;
		this.account = account;
		this.cartDetails = cartDetails;
	}

	public CartItem() {
		
	}
	
}
