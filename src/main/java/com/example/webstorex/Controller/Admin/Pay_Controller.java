package com.example.webstorex.Controller.Admin;

import java.util.Date;
import java.util.Optional;

import com.example.webstorex.Entity.Pay;
import com.example.webstorex.Interface.PayDAO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class Pay_Controller {
	@Autowired
	PayDAO daopay;
	
	@Autowired
	HttpServletRequest req;

	@RequestMapping("/admin/order")
	public String listOrder(Model model, @RequestParam("field") Optional<String> field,
			@RequestParam("p") Optional<Integer> p, @RequestParam("t") Optional<Integer> t) {
		String from = req.getParameter("from");
		String to = req.getParameter("to");
		int pa = p.orElse(0);
		if (pa < 0) {
			pa = 0;
		}
		int s = t.orElse(0);
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		if (s == 0) {
			model.addAttribute("s", s);
			sort = Sort.by(Direction.ASC, field.orElse("id"));
			s = 1;
		} else if (s == 1) {
			model.addAttribute("s", s);
			sort = Sort.by(Direction.DESC, field.orElse("id"));
			s = 0;
		}
		String column = req.getParameter("field");
		if (column != null) {
			req.setAttribute("column", column);
		} else {
			req.setAttribute("column", "id");
		}
		if (from != null & to != null) {
			Pageable pageable = PageRequest.of(pa, 8);
			Page<Pay> page = daopay.findByCreatedBetween(from, to, pageable);
			if (!page.isEmpty()) {
				int lastPage = page.getTotalPages();
				int prePage = page.getNumber();
				if (prePage + 1 > lastPage) {
					page = daopay.findAll(PageRequest.of(lastPage - 1, 8));
				}
				model.addAttribute("page", page);
			}else {
				page = daopay.findAll(pageable);
				int lastPage = page.getTotalPages();
				int prePage = page.getNumber();
				if (prePage + 1 > lastPage) {
					page = daopay.findAll(PageRequest.of(lastPage - 1, 8));
				}
				model.addAttribute("page", page);
			}

		} else {

			Pageable pageable = PageRequest.of(pa, 8, sort);
			Page<Pay> page = daopay.findAll(pageable);
			int lastPage = page.getTotalPages();
			int prePage = page.getNumber();
			if (prePage + 1 > lastPage) {
				page = daopay.findAll(PageRequest.of(lastPage - 1, 8));
			}
			model.addAttribute("page", page);
		}

		return "admin_father/order/listOrder";
	}

	// xem chi tiết đơn hàng
	@RequestMapping("/admin/order/edit/{id}")
	public String editOrder(Model model, @PathVariable("id") Long id) {
		Pay item = daopay.findById(id).get();
		model.addAttribute("total", item.getTotal().intValue());
		model.addAttribute("ord", item);
		return "admin_father/order/updateOrder";
	}

	// cập nhật trạng thái đơn hàng
	@RequestMapping("/admin/order/update/{id}")
	public String UpdateOrder(Model model, @ModelAttribute("ord") Pay pay, Pay item, @PathVariable("id") Long id) {
		try {
			Pay item2 = daopay.findById(id).get();
			model.addAttribute("ord", item2);
			model.addAttribute("total", item2.getTotal().intValue());
			daopay.save(item);
			model.addAttribute("total", item.getTotal().intValue());
			model.addAttribute("message1", "Cập nhật thành công!");
		} catch (Exception e) {
			model.addAttribute("message2", "Cập nhật thất bại!");
		}
		return "admin_father/order/updateOrder";
	}

}
