package com.example.webstorex.Controller.Admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.example.webstorex.Entity.Account;
import com.example.webstorex.Entity.New;
import com.example.webstorex.Interface.AccountDAO;
import com.example.webstorex.Interface.NewDAO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
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
public class CRUDNewController {
	@Autowired
	NewDAO daonew;
	
	@Autowired
	HttpServletRequest req;

	@Autowired
	ServletContext app;
	
	@Autowired
	AccountDAO daoacc;
	@RequestMapping("/admin/new")
	public String listNew(Model model) {
		List<New> listNew = daonew.findAll();
		model.addAttribute("listNew", listNew);
		return "admin_father/new/listNew";
	}
	@RequestMapping("/admin/new/edit/{id}")
	public String editNew( Model model, @PathVariable("id") Integer id) {
		New item = daonew.findById(id).get();
		model.addAttribute("new", item);
		model.addAttribute("filename", item.getImage());
		return "admin_father/new/updateNew";
	}
	// add
	@GetMapping("/admin/new/create")
	public String createForm(Model model) {
		New item = new New();
		model.addAttribute("item", item);
		return "admin_father/new/addNew";
	}
	
	
	@PostMapping("/admin/new/create")
	public String addNew(New item, Model model, RedirectAttributes params, @ModelAttribute("item") New acc,
			@RequestParam("attach") MultipartFile attach) {
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
		daonew.save(item);
		params.addAttribute("message", "Thêm thành công!");
		return "redirect:/admin/new";
	}
	// update
	@RequestMapping("/admin/new/update")
	public String update(@ModelAttribute("item") New item1, New item, RedirectAttributes params, Model model,
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
			daonew.save(item);
			params.addAttribute("message", "Cập nhật thành công!");
			return "redirect:/admin/new";
	}
	// delete
	@RequestMapping("/admin/new/delete/{id}")
	public String delereNew(@PathVariable("id") Integer id, Model m, RedirectAttributes params) {
		try {
			daonew.deleteById(id);
			params.addAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			params.addAttribute("message", "Xóa thất bại!");
		}

		return "redirect:/admin/new";
	}
	
	// nạp acc
	@ModelAttribute("accList")
	public List<Account> getAccounts() {
		List<Account> list = daoacc.findAll();
		return list;
	}
}
