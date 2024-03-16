package com.example.webstorex.Interface;

import com.example.webstorex.Entity.Configuration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ConfigurationDAO extends JpaRepository<Configuration, Integer> {
}
