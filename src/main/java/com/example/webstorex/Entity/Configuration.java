package com.example.webstorex.Entity;

import java.io.Serializable;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Configurations")
public class Configuration implements Serializable {
	@Id
	Integer id;
	@ManyToOne
	@JoinColumn(name = "phone_id" )
	Product product;
	String manhinh;
	String hedieuhanh;
	String camerasau;
	String cameratruoc;
	String chip;
	String ram;
	String bonhotrong;
	String sim;
	boolean hotro5g;
	String pin_sac;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public String getManhinh() {
		return manhinh;
	}
	
	public void setManhinh(String manhinh) {
		this.manhinh = manhinh;
	}
	
	public String getHedieuhanh() {
		return hedieuhanh;
	}
	
	public void setHedieuhanh(String hedieuhanh) {
		this.hedieuhanh = hedieuhanh;
	}
	
	public String getCamerasau() {
		return camerasau;
	}
	
	public void setCamerasau(String camerasau) {
		this.camerasau = camerasau;
	}
	
	public String getCameratruoc() {
		return cameratruoc;
	}
	
	public void setCameratruoc(String cameratruoc) {
		this.cameratruoc = cameratruoc;
	}
	
	public String getChip() {
		return chip;
	}
	
	public void setChip(String chip) {
		this.chip = chip;
	}
	
	public String getRam() {
		return ram;
	}
	
	public void setRam(String ram) {
		this.ram = ram;
	}
	
	public String getBonhotrong() {
		return bonhotrong;
	}
	
	public void setBonhotrong(String bonhotrong) {
		this.bonhotrong = bonhotrong;
	}
	
	public String getSim() {
		return sim;
	}
	
	public void setSim(String sim) {
		this.sim = sim;
	}
	
	public boolean isHotro5g() {
		return hotro5g;
	}
	
	public void setHotro5g(boolean hotro5g) {
		this.hotro5g = hotro5g;
	}
	
	public String getPin_sac() {
		return pin_sac;
	}
	
	public void setPin_sac(String pin_sac) {
		this.pin_sac = pin_sac;
	}

	public Configuration(Integer id, Product product, String manhinh, String hedieuhanh, String camerasau,
			String cameratruoc, String chip, String ram, String bonhotrong, String sim, boolean hotro5g,
			String pin_sac) {
		this.id = id;
		this.product = product;
		this.manhinh = manhinh;
		this.hedieuhanh = hedieuhanh;
		this.camerasau = camerasau;
		this.cameratruoc = cameratruoc;
		this.chip = chip;
		this.ram = ram;
		this.bonhotrong = bonhotrong;
		this.sim = sim;
		this.hotro5g = hotro5g;
		this.pin_sac = pin_sac;
	}

	public Configuration() {
		
	}
	
}
