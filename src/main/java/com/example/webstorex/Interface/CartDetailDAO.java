package com.example.webstorex.Interface;

import java.util.List;

import com.example.webstorex.Entity.CartDetail;
import com.example.webstorex.Entity.CartItem;
import com.example.webstorex.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CartDetailDAO extends JpaRepository<CartDetail, Integer> {
	 CartDetail findByCartItemIsAndProduct(CartItem cart, Product p);
		
		  @Query("SELECT cd FROM CartDetail cd  where cd.cartItem.id = :cartId")
		  List<CartDetail> findByCartId(Integer cartId);
		 
	
}
