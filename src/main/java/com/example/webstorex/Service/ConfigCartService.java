package com.example.webstorex.Service;

import com.example.webstorex.Entity.Configuration;

import java.util.List;

public interface ConfigCartService {
	List<Configuration> getItems();

	void add(int id);

	void remove(int id);


	void clear();
}
