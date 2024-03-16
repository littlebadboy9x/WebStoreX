package com.example.webstorex.Controller.Admin;

import java.io.File;
import java.io.IOException;
import java.util.Optional;

import com.example.webstorex.Entity.Account;
import com.example.webstorex.Interface.AccountDAO;
import com.example.webstorex.Service.SessionService;
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
public class CRUDAccountController {
	@Autowired
	AccountDAO dao;

	@Autowired
	SessionService session;

	@Autowired
	HttpServletRequest req;

	@Autowired
	ServletContext app;

	// quản lý danh sách admin
	@RequestMapping("/admin/admin/list")
	public String listAdmin(Model model, @RequestParam("field") Optional<String> field,
			@RequestParam("p") Optional<Integer> p, @RequestParam("t") Optional<Integer> t) {
		String fullname = req.getParameter("fullname");
		int pa = p.orElse(0);
		if (pa < 0) {
			pa = 0;
		}
		int s = t.orElse(0);
		Sort sort = Sort.by(Direction.ASC, field.orElse("username"));
		if (s == 0) {
			model.addAttribute("s", s);
			sort = Sort.by(Direction.ASC, field.orElse("username"));
			s = 1;
		} else if (s == 1) {
			model.addAttribute("s", s);
			sort = Sort.by(Direction.DESC, field.orElse("username"));
			s = 0;
		}
		String column = req.getParameter("field");
		if (column != null) {
			req.setAttribute("column", column);
		} else {
			req.setAttribute("column", "username");
		}
		Pageable pageable = PageRequest.of(pa, 5, sort);
		if (fullname != null) {
			model.addAttribute("fullname", "fullname=" + fullname + "&");
			Page<Account> page = dao.findByFullnameAndAdmin(fullname, true, pageable);
			int lastPage = page.getTotalPages();
			int prePage = page.getNumber();
			if (prePage + 1 > lastPage) {
				page = dao.findAll(PageRequest.of(lastPage, 5));
			}
			model.addAttribute("page", page);
		} else {
			Page<Account> page = dao.findByAdmin(true, pageable);
			int lastPage = page.getTotalPages();
			int prePage = page.getNumber();
			if (prePage + 1 > lastPage) {
				page = dao.findAll(PageRequest.of(lastPage - 1, 5));
			}
			model.addAttribute("page", page);
		}
		return "admin_father/account/listAdmin";
	}
	
	// Chuyển hướng đến trang admin
	@GetMapping("/admin/admin/create")
	public String createForm(Model model) {
		Account acc = new Account();
		model.addAttribute("acc", acc);
		return "admin_father/account/addAdmin";
	}
	
	// Thêm admin
	@PostMapping("/admin/admin/create")
	public String create(Account item, Model model, RedirectAttributes params, @ModelAttribute("acc") Account acc,
			@RequestParam("attach") MultipartFile attach) throws IllegalStateException, IOException {
		if (dao.existsById(item.getUsername()) == false) {
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
				item.setPhoto(filename);
			} else {
				item.setPhoto(req.getParameter("photo"));
				if (item.getPhoto().equals("")) {
					item.setPhoto("NoImage.jpg");
				}
			}
			dao.save(item);
			params.addAttribute("message", "Thêm thành công!");

		} else {
			model.addAttribute("message", "Tên đăng nhập này đã tồn tại!");
		}
		return "redirect:/admin/admin/list";
	}
	
	// Cập nhật admin
	@RequestMapping("/admin/admin/update")
	public String update(@ModelAttribute("acc") Account acc, Account item, RedirectAttributes params, Model model,
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
			item.setPhoto(filename);
		}
		if (dao.existsById(item.getUsername())) {
			dao.save(item);
			params.addAttribute("message", "Cập nhật thành công!");
			return "redirect:/admin/admin/list";
		} else {
			params.addAttribute("message", "Cập nhật thất bại!");
		}
		return "admin_father/account/updateAdmin";
	}

	// quản lý danh sách user
	@RequestMapping("/admin/user/list")
	public String listUser(Model model, @RequestParam("field") Optional<String> field,
			@RequestParam("p") Optional<Integer> p, @RequestParam("t") Optional<Integer> t) {
		String fullname = req.getParameter("fullname");
		int pa = p.orElse(0);
		if (pa < 0) {
			pa = 0;
		}
		int s = t.orElse(0);
		Sort sort = Sort.by(Direction.ASC, field.orElse("username"));
		if (s == 0) {
			model.addAttribute("s", s);
			sort = Sort.by(Direction.ASC, field.orElse("username"));
			s = 1;
		} else if (s == 1) {
			model.addAttribute("s", s);
			sort = Sort.by(Direction.DESC, field.orElse("username"));
			s = 0;
		}
		String column = req.getParameter("field");
		if (column != null) {
			req.setAttribute("column", column);
		} else {
			req.setAttribute("column", "username");
		}
		Pageable pageable = PageRequest.of(pa, 5, sort);
		if (fullname != null) {
			model.addAttribute("fullname", "fullname=" + fullname + "&");
			Page<Account> page = dao.findByFullnameAndAdmin(fullname, false, pageable);
			int lastPage = page.getTotalPages();
			int prePage = page.getNumber();
			if (prePage + 1 > lastPage) {
				page = dao.findAll(PageRequest.of(lastPage, 5));
			}
			model.addAttribute("page", page);
		} else {
			Page<Account> page = dao.findByAdmin(false, pageable);
			int lastPage = page.getTotalPages();
			int prePage = page.getNumber();
			if (prePage + 1 > lastPage) {
				page = dao.findAll(PageRequest.of(lastPage - 1, 5));
			}
			model.addAttribute("page", page);
		}
		return "admin_father/account/listUser";
	}
	
	@RequestMapping("/admin/admin/edit/{username}")
	public String edit(Model model, @PathVariable("username") String username) {
		Account item = dao.findById(username).get();
		model.addAttribute("acc", item);
		model.addAttribute("filename", item.getPhoto());
		return "admin_father/account/updateAdmin";
	}

	// Xóa người dùng
	@RequestMapping("/admin/admin/delete/{username}")
	public String create(@PathVariable("username") String username, Model m, RedirectAttributes params) {
		try {
			Account acc = session.getAttribute("user");
			if (!acc.getUsername().equals(username)) {
				dao.deleteById(username);
				params.addAttribute("message", "Xóa thành công!");
			} else {
				params.addAttribute("message", "Bạn không được xóa chính mình!");
			}

		} catch (Exception e) {
			params.addAttribute("message", "Xóa thất bại!");
		}

		return "redirect:/admin/admin/list";
	}

	// update user
	@RequestMapping("/admin/user/update")
	public String updateUser(@ModelAttribute("acc") Account acc, Account item, RedirectAttributes params, Model model,
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
			item.setPhoto(filename);
		}
		if (dao.existsById(item.getUsername())) {
			dao.save(item);
			params.addAttribute("message", "Cập nhật thành công!");
			return "redirect:/admin/user/list";
		} else {
			params.addAttribute("message", "Cập nhật thất bại!");
		}
		return "admin_father/account/updateUser";
	}

	@RequestMapping("/admin/user/edit/{username}")
	public String editUser(Model model, @PathVariable("username") String username) {
		Account item = dao.findById(username).get();
		model.addAttribute("acc", item);
		model.addAttribute("filename", item.getPhoto());
		return "admin_father/account/updateUser";
	}

	@RequestMapping("/admin/user/delete/{username}")
	public String createUser(@PathVariable("username") String username, Model m, RedirectAttributes params) {
		try {
			dao.deleteById(username);
			params.addAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			params.addAttribute("message", "Xóa thất bại!");
		}

		return "redirect:/admin/user/list";
	}

}
