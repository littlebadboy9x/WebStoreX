package com.example.webstorex.Entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@ManyToOne
	@JoinColumn(name = "Categoryid")
	Category category;
	String name;
	Double price;
	Boolean avaliable;
	String description;
	String content;
	Integer discount;
	String image;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date createdate;
	String other;

	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Boolean getAvaliable() {
		return avaliable;
	}

	public void setAvaliable(Boolean avaliable) {
		this.avaliable = avaliable;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	public Product(Integer id, Category category, String name, Double price, Boolean avaliable, String description,
			String content, Integer discount, String image, Date createdate, String other,
			List<OrderDetail> orderDetails) {
		this.id = id;
		this.category = category;
		this.name = name;
		this.price = price;
		this.avaliable = avaliable;
		this.description = description;
		this.content = content;
		this.discount = discount;
		this.image = image;
		this.createdate = createdate;
		this.other = other;
		this.orderDetails = orderDetails;
	}

	public Product() {
		
	}

	@Override
	public String toString() {
		 SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); 
		return "Product [id=" + id + ", catalog_id=" + category.id + ", name=" + name + ", price=" + price + ", avaliable="
		+ avaliable + ", description=" + description + ", content=" + content + ", discount=" + discount
		+ ", image_link=" + image + ", created="
		+ createdate 
		+", other=" + other +"]";
	}
	
}
