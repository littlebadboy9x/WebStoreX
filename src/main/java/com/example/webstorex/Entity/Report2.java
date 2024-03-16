package com.example.webstorex.Entity;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
public class Report2 {
	@Id
	Serializable group;
	Long sum;

	public Serializable getGroup() {
		return group;
	}

	public void setGroup(Serializable group) {
		this.group = group;
	}

	public Long getSum() {
		return sum;
	}

	public void setSum(Long sum) {
		this.sum = sum;
	}

	public Report2(Serializable group, Long sum) {
		this.group = group;
		this.sum = sum;
	}

	public Report2() {

	}

}

