package com.example.webstorex.Entity;

import java.io.Serializable;
import java.util.List;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable {
	
	@Id
	String id;
	String name;
	@OneToMany(mappedBy = "category")
	List<Product> products;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public List<Product> getProducts() {
		return products;
	}
	
	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Category(String id, String name, List<Product> products) {
		this.id = id;
		this.name = name;
		this.products = products;
	}

	public Category() {
		
	}
	
}
