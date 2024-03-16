package com.example.webstorex.Interface;

import java.util.List;

import com.example.webstorex.Entity.OrderDetail;
import com.example.webstorex.Entity.Pay;
import com.example.webstorex.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
@Repository
public interface OrderDetailDAO extends JpaRepository<OrderDetail,Long> {
	OrderDetail findByPayAndProduct(Pay pay, Product p);
	@Query("SELECT od FROM OrderDetail od where od.pay.id = :payId")
	  List<OrderDetail> findByPayId(Long payId);
}
