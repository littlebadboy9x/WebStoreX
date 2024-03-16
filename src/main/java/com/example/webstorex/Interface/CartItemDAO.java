package com.example.webstorex.Interface;

import com.example.webstorex.Entity.Account;
import com.example.webstorex.Entity.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface CartItemDAO extends JpaRepository<CartItem, Integer> {
	 CartItem findByAccount(Account acc);
}
