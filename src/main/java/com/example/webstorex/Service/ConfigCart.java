package com.example.webstorex.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.webstorex.Entity.Configuration;
import com.example.webstorex.Interface.ConfigurationDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

@SessionScope
@Service("cartconfig")
public class ConfigCart implements ConfigCartService{
	Map<Integer, Configuration> map = new HashMap<Integer,Configuration>();
	@Autowired
	ConfigurationDAO configdao;

	@Override
	public void add(int id) {
		Configuration item = configdao.getById(id);
		map.put(id, item);
	}

	@Override
	public void remove(int id) {
		map.remove(id);
	}

	@Override
	public void clear() {
		Configuration item = null;
		for (Integer id : map.keySet()) {
			item = map.get(id);
		}
		map.clear();
	}

	@Override
	public List<Configuration> getItems() {
		ArrayList<Configuration> ds = new ArrayList<Configuration>();
		for (Integer key : map.keySet()) {
			ds.add(map.get(key));
		}
		return ds;
	}
}
