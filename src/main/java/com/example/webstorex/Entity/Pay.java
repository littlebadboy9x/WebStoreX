package com.example.webstorex.Entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "Pays")
public class Pay {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@ManyToOne
	@JoinColumn(name = "Username")
	Account account;
	String phone;
	String address;
	String message;
	Double total;
	String payment;
	String status;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date created;
	@OneToMany(mappedBy = "pay")
	List<OrderDetail> orderDetails;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Account getAccount() {
		return account;
	}
	
	public void setAccount(Account account) {
		this.account = account;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Double getTotal() {
		return total;
	}
	
	public void setTotal(Double total) {
		this.total = total;
	}
	
	public String getPayment() {
		return payment;
	}
	
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getCreated() {
		return created;
	}
	
	public void setCreated(Date created) {
		this.created = created;
	}
	
	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}
	
	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Pay(Long id, Account account, String phone, String address, String message, Double total, String payment,
			String status, Date created, List<OrderDetail> orderDetails) {
		this.id = id;
		this.account = account;
		this.phone = phone;
		this.address = address;
		this.message = message;
		this.total = total;
		this.payment = payment;
		this.status = status;
		this.created = created;
		this.orderDetails = orderDetails;
	}

	public Pay() {
		
	}
	
}
