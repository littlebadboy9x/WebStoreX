package com.example.webstorex.Controller.User;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.example.webstorex.Entity.Category;
import com.example.webstorex.Entity.Product;
import com.example.webstorex.Entity.Report2;
import com.example.webstorex.Interface.CategoryDAO;
import com.example.webstorex.Interface.ProductDAO;
import com.example.webstorex.Service.ShoppingCartService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ListProductController {
	@Autowired
	ProductDAO dao;
	@Autowired
	CategoryDAO catedao;
	DecimalFormat df = new DecimalFormat("#,###₫");

	@Autowired
	ShoppingCartService cart;

	@Autowired
	HttpServletRequest req;

	@RequestMapping("/list/search/product/searchname")
	public String ListSearname(Model model) {
		String name = req.getParameter("searchname");
		String namefind = "%" + name + "%";
		List<Product> listpd = dao.findByNameLike(namefind);
		model.addAttribute("slsptt", listpd.size());
		model.addAttribute("SLTGH", cart.getCount());
		model.addAttribute("listpd", listpd);
		return "/home";
	}

	@RequestMapping("/list/search/product/name")
	public String ListSearchName(Model model) {
		String name = req.getParameter("name");
		String namefind = "%" + name + "%";
		List<Product> listpd = dao.findByNameLike(namefind);
		model.addAttribute("slsptt", listpd.size());
		model.addAttribute("SLTGH", cart.getCount());
		model.addAttribute("listpd", listpd);
		return "/home";
	}

	
	@RequestMapping("/list/search/product/price")
	public String ListSearchPrice(Model model) {
		String price = req.getParameter("price");
		List<Product> listpd = dao.findByPriceBetween(0, Double.parseDouble(price));
		model.addAttribute("slsptt", listpd.size());
		model.addAttribute("SLTGH", cart.getCount());
		model.addAttribute("listpd", listpd);
		return "/home";
	}

	@RequestMapping("/list/search/product/cate/name")
	public String ListSearchCate(Model model) {
		String name = req.getParameter("name");
		String cateId = req.getParameter("id");
		Category cate = catedao.getById(cateId);
		List<Product> listpd = new ArrayList<>();
		if (name.equals("ios")) {
			String namefind = "%" + "iphone" + "%";
			listpd = dao.findByCategoryIsAndNameLike(cate, namefind);
		} else {
			String namefind = "%" + "iphone" + "%";
			listpd = dao.findByCategoryIsAndNameNotLike(cate, namefind);
		}

		model.addAttribute("slsptt", listpd.size());
		model.addAttribute("SLTGH", cart.getCount());
		model.addAttribute("listpd", listpd);
		return "/home";
	}
	@ModelAttribute("cateList")
	public List<Category> getCategories() {
		List<Category> list = catedao.findByProductId();
		return list;
	}
	@ModelAttribute("listob")
	public List<Report2> getReport() {
		List<Report2> list = dao.getAmountTotal();
		return list;
	}
	
}
