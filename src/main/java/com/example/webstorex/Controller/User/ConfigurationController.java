package com.example.webstorex.Controller.User;

import com.example.webstorex.Interface.ConfigurationDAO;
import com.example.webstorex.Interface.ProductDAO;
import com.example.webstorex.Service.ConfigCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
public class ConfigurationController {


	@Autowired
	ProductDAO daopd;
	@Autowired
	ConfigurationDAO daocf;
	@Autowired
	ConfigCartService confcart;
	
	@RequestMapping("/user/conf/home")
	public String configcart1(Model model) {
		model.addAttribute("items",confcart.getItems());
		return "configcart/config";
	}
	
	@RequestMapping("/user/conf/add/{id}")
	public String configcart(Model model,@PathVariable("id") Integer id,RedirectAttributes params) {
		if (daocf.existsById(id)) {
			confcart.add(id);
		}else {
			params.addAttribute("message", "Chưa cập nhật được cấu hình!");
			return "redirect:/user/home";
		}
		model.addAttribute("items",confcart.getItems());
		return "configcart/config";
	}
	@RequestMapping("/user/conf/delete/{id}")
	public String delete(@PathVariable("id") Integer id, Model m, RedirectAttributes params) {
		try {
			confcart.remove(id);
			params.addAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			params.addAttribute("message", "Xóa thất bại!");
		}

		return "redirect:/user/conf/home";
	}
	
}
