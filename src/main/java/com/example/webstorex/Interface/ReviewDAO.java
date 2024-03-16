package com.example.webstorex.Interface;

import java.util.List;

import com.example.webstorex.Entity.Account;
import com.example.webstorex.Entity.Product;
import com.example.webstorex.Entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface ReviewDAO extends JpaRepository<Review, Integer> {
	Review findByAccountAndProduct(Account acc, Product p);
	List <Review> findByProduct(Product p);
}
