package com.example.webstorex.Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
	
	@Id
	String username;
	String password;
	String fullname;
	String email;
	String photo;
	boolean activated;
	boolean admin;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "Createdate")
	Date createdate;
	@OneToMany(mappedBy = "account")
	List<Pay> pays;
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getFullname() {
		return fullname;
	}
	
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhoto() {
		return photo;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public boolean isActivated() {
		return activated;
	}
	
	public void setActivated(boolean activated) {
		this.activated = activated;
	}
	
	public boolean isAdmin() {
		return admin;
	}
	
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	public Date getCreatedate() {
		return createdate;
	}
	
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	
	public List<Pay> getPays() {
		return pays;
	}
	
	public void setPays(List<Pay> pays) {
		this.pays = pays;
	}
	
	public Account(String username, String password, String fullname, String email, String photo, boolean activated,
			boolean admin, Date createdate, List<Pay> pays) {
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.photo = photo;
		this.activated = activated;
		this.admin = admin;
		this.createdate = createdate;
		this.pays = pays;
	}
	
	public Account() {
		
	}
	
}
