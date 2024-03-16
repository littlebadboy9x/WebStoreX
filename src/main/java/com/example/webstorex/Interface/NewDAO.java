package com.example.webstorex.Interface;

import com.example.webstorex.Entity.New;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NewDAO extends JpaRepository<New, Integer> {
}
