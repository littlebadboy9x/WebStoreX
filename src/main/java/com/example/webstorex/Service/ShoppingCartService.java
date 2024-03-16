package com.example.webstorex.Service;

public interface ShoppingCartService {
	
	void add(Integer id);

	void remove(Integer id);

	void update(Integer id, int amount);

	void clear();

	int getCount();

	double getTotal();

}
