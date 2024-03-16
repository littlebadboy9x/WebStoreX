package com.example.webstorex.Controller.Admin;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Optional;

import com.example.webstorex.Entity.Category;
import com.example.webstorex.Entity.Product;
import com.example.webstorex.Interface.CategoryDAO;
import com.example.webstorex.Interface.ProductDAO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CRUDProductController {
	@Autowired
	ProductDAO daopd;
	DecimalFormat df = new DecimalFormat("#,###₫");

	@Autowired
	CategoryDAO daoct;

	@Autowired
	ServletContext app;

	@Autowired
	HttpServletRequest req;

	// product list phân trang
	@RequestMapping("/admin/product")
	public String listProduct(Model model, @RequestParam("field") Optional<String> field,
			@RequestParam("p") Optional<Integer> p, @RequestParam("t") Optional<Integer> t) {
		String cateid = req.getParameter("category");
		int pa = p.orElse(0);
		if (pa < 0) {
			pa = 0;
		}
		int s = t.orElse(0);
		Sort sort = Sort.by(Direction.ASC, field.orElse("name"));
		if (s == 0) {
			model.addAttribute("s", s);
			sort = Sort.by(Direction.ASC, field.orElse("name"));
			s = 1;
		} else if (s == 1) {
			model.addAttribute("s", s);
			sort = Sort.by(Direction.DESC, field.orElse("name"));
			s = 0;
		}
		String column = req.getParameter("field");
		if (column != null) {
			req.setAttribute("column", column);
		} else {
			req.setAttribute("column", "name");
		}
		Pageable pageable = PageRequest.of(pa, 5, sort);
		if (cateid != null) {
			model.addAttribute("cate", "category=" + cateid + "&");
			Category cate = daoct.getById(cateid);
			Page<Product> page = daopd.findByCategory(cate, pageable);
			int lastPage = page.getTotalPages();
			int prePage = page.getNumber();
			if (prePage + 1 > lastPage) {
				page = daopd.findAll(PageRequest.of(lastPage - 1, 5));
			}
			model.addAttribute("page", page);
		} else {
			Page<Product> page = daopd.findAll(pageable);
			int lastPage = page.getTotalPages();
			int prePage = page.getNumber();
			if (prePage + 1 > lastPage) {
				page = daopd.findAll(PageRequest.of(lastPage - 1, 5));
			}
			model.addAttribute("page", page);
		}
		return "admin_father/product/listProduct";
	}

// addproduct get
	@GetMapping("/admin/product/create")
	public String createForm(Model model) {
		Product prd = new Product();
		model.addAttribute("prd", prd);
		return "admin_father/product/addProduct";
	}

// addproduct post
	@PostMapping("/admin/product/create")
	public String create(Product item, Model model, RedirectAttributes params, @ModelAttribute("prd") Product prd,
			@RequestParam("attach") MultipartFile attach) throws IllegalStateException, IOException {
		if (attach.getSize() > 0) {
			File folder = new File(req.getServletContext().getRealPath("/user/images"));
			if (!folder.exists()) {
				folder.mkdirs();
			}
			String filename = null;
			if (!attach.isEmpty()) {
				filename = attach.getOriginalFilename();
				File file = new File(app.getRealPath("/user/images/" + filename));
				try {
					attach.transferTo(file);
					model.addAttribute("filename", filename);
				} catch (IllegalStateException | IOException e) {
					params.addAttribute("message", "Hình ảnh đã tồn tại!");
				}

			}
			item.setImage(filename);
		} else {
			item.setImage(req.getParameter("image"));
			if (item.getImage().equals("")) {
				item.setImage("NoImage.jpg");
			}
		}
		daopd.save(item);
		model.addAttribute("message", "Thêm thành công!");
		return "redirect:/admin/product";
	}

// updateproduct
	@RequestMapping("/admin/product/update")
	public String update(@ModelAttribute("prd") Product prd, Product item, RedirectAttributes params, Model model,
			@RequestParam("attach") MultipartFile attach) throws IllegalStateException, IOException {
		if (attach.getSize() > 0) {
			File folder = new File(req.getServletContext().getRealPath("/user/images"));
			if (!folder.exists()) {
				folder.mkdirs();
			}
			String filename = null;
			if (!attach.isEmpty()) {
				filename = attach.getOriginalFilename();
				File file = new File(app.getRealPath("/user/images/" + filename));
				try {
					attach.transferTo(file);
					model.addAttribute("filename", filename);
				} catch (IllegalStateException | IOException e) {
					params.addAttribute("message", "Hình ảnh đã tồn tại!");
				}
			}
			item.setImage(filename);
		}
		if (daopd.existsById(item.getId())) {
			daopd.save(item);
			params.addAttribute("message", "Cập nhật thành công!");
			return "redirect:/admin/product";
		} else {
			params.addAttribute("message", "Cập nhật thất bại!");
		}
		return "admin_father/product/updateProduct";
	}

// editproduct		
	@RequestMapping("/admin/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Product item = daopd.findById(id).get();
		model.addAttribute("gias", item.getPrice().intValue());
		model.addAttribute("prd", item);
		model.addAttribute("gia", item.getPrice().intValue());
		model.addAttribute("filename", item.getImage());
		return "admin_father/product/updateProduct";
	}

// delete product
	@RequestMapping("/admin/product/delete/{id}")
	public String create(@PathVariable("id") Integer id, Model m, RedirectAttributes params) {
		try {
			daopd.deleteById(id);
			params.addAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			params.addAttribute("message", "Xóa thất bại!");
		}

		return "redirect:/admin/product";
	}

	@ModelAttribute("cateList")
	public List<Category> getCategories() {
		List<Category> list = daoct.findByProductId();
		return list;
	}
	
}
