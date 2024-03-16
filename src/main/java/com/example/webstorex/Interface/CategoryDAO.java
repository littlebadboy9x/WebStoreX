package com.example.webstorex.Interface;

import java.util.List;

import com.example.webstorex.Entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
@Repository
public interface CategoryDAO extends JpaRepository<Category, String> {
	@Query("SELECT distinct p.category FROM Product p ")
	  List<Category> findByProductId();
}
