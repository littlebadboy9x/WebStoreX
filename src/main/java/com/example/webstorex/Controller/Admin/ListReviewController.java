package com.example.webstorex.Controller.Admin;

import java.util.Date;
import java.util.List;

import com.example.webstorex.Entity.Account;
import com.example.webstorex.Entity.Product;
import com.example.webstorex.Entity.Review;
import com.example.webstorex.Interface.ProductDAO;
import com.example.webstorex.Interface.ReviewDAO;
import com.example.webstorex.Service.SessionService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ListReviewController {
	@Autowired
	ReviewDAO daorv;

	@Autowired
	SessionService session;

	@Autowired
	HttpServletRequest req;

	@Autowired
	ProductDAO daopd;

	@RequestMapping("/admin/review")
	public String listReview(Model model) {
		List<Review> listReview = daorv.findAll();
		model.addAttribute("listReview", listReview);
		return "admin_father/review/listReview";
	}

	// delete
	@RequestMapping("/admin/review/delete/{id}")
	public String deleteNew(@PathVariable("id") Integer id, Model m, RedirectAttributes params) {
		try {
			daorv.deleteById(id);
			params.addAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			params.addAttribute("message", "Xóa thất bại!");
		}

		return "redirect:/admin/review";
	}

	@PostMapping("/user/review/create")
	public String CreateNew(Model m, RedirectAttributes params) {
		Account acc = session.getAttribute("user");
		Product p = daopd.getById(Integer.parseInt(req.getParameter("prdid")));
		Review rv1 = daorv.findByAccountAndProduct(acc, p);
		if(rv1==null) {
			Date date = new Date();
			Review rv = new Review();
			rv.setAccount(acc);
			rv.setProduct(p);
			rv.setContent(req.getParameter("content"));
			rv.setCreated(date);
			daorv.save(rv);
			params.addAttribute("message", "Đánh giá thành công!");
		}else {
			params.addAttribute("message", "Một sản phẩm bạn chỉ được đánh giá 1 lần!");
		}
		return "redirect:/user/product/productdetail/" + p.getId();
	}
}
