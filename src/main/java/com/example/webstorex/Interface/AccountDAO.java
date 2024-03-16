package com.example.webstorex.Interface;

import com.example.webstorex.Entity.Account;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountDAO extends JpaRepository<Account, String> {
	Page<Account> findByFullnameAndAdmin(String name, boolean kt, Pageable pageable);
	Page<Account> findByAdmin(boolean kt, Pageable pageable);
}
