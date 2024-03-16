package com.example.webstorex.Controller.Admin;

import java.util.List;

import com.example.webstorex.Entity.Category;
import com.example.webstorex.Interface.CategoryDAO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
public class CRUDCategoryControlller {
	@Autowired
	HttpServletRequest req;

	@Autowired
	CategoryDAO dao; // làm việc với bảng Categories

	@RequestMapping("/admin/category")
	public String index(Model model) {
		Category cate = new Category();
		model.addAttribute("cate", cate);
		List<Category> listcate = dao.findAll();
		model.addAttribute("listcate", listcate);
		return "admin_father/category/listCategory";
	}

	@RequestMapping("/admin/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id, RedirectAttributes params) {
		model.addAttribute("cate", dao.findById(id));
		params.addAttribute("id", id);
		return "admin_father/category/updateCategory";
	}

	@GetMapping("/admin/category/create")
	public String createForm(Model model) {
		Category cate = new Category();
		model.addAttribute("cate", cate);
		return "admin_father/category/addCategory";
	}

	@PostMapping("/admin/category/create")
	public String create(Category item, Model model, RedirectAttributes params, @ModelAttribute("cate") Category cate) {
		if (dao.existsById(item.getId()) == false) {
			if (req.getParameter("id").toString().length() > 4) {
				model.addAttribute("message", "Id danh mục không được quá 4 kí tự!");
			} else {
				dao.save(item);
				params.addAttribute("message", "Thêm thành công!");
				return "redirect:/admin/category";
			}

		} else {
			model.addAttribute("message", "Id danh mục này đã tồn tại!");

		}
		return "admin_father/category/addCategory";
	}

	@RequestMapping("/admin/category/update")
	public String update(@ModelAttribute("cate") Category cate, Category item, RedirectAttributes params, Model model) {
		if (req.getParameter("id") != null) {
			dao.save(item);
			params.addAttribute("message", "Cập nhật thành công!");
			return "redirect:/admin/category";
		} else {
			params.addAttribute("message", "Cập nhật thất bại!");
		}
		return "admin_father/category/updateCategory";
	}

	@RequestMapping("/admin/category/delete/{id}")
	public String delete(@PathVariable("id") String id, Model m, RedirectAttributes params) {
		try {
			dao.deleteById(id);
			params.addAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			params.addAttribute("message", "Xóa thất bại!");
		}

		return "redirect:/admin/category";
	}

}
