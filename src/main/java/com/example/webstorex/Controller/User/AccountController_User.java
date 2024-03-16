package com.example.webstorex.Controller.User;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import com.example.webstorex.Entity.Account;
import com.example.webstorex.Entity.MailInfo;
import com.example.webstorex.Interface.AccountDAO;
import com.example.webstorex.Service.CookieService;
import com.example.webstorex.Service.MailerService;
import com.example.webstorex.Service.SessionService;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
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
public class AccountController_User {

	@Autowired
	AccountDAO dao;

	@Autowired
	HttpServletRequest req;

	@Autowired
	SessionService session;

	@Autowired
	CookieService cookie;

	@Autowired
	ServletContext app;

	@Autowired
	MailerService mailer;

	@Autowired
	HttpServletRequest request;

// đăng nhập
	@GetMapping("/user/account/login")
	public String login(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if (ckid != null) { 
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();

			model.addAttribute("userid", uid);
			model.addAttribute("pass", pwd);
		}
		return "function/login";
	}

	@PostMapping("/user/account/login")
	public String login(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password, RedirectAttributes params,
			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {
		try {
			Account user = dao.getById(username);
			if (!user.getPassword().equals(password)) {
				params.addAttribute("message", "Mật khẩu không đúng!");
				return "redirect:/user/account/login";
			} else {
				if (!user.isActivated()) {
					params.addAttribute("message", "Tài khoản chưa active!");
					return "redirect:/user/account/login";
				} else {
					if (user.isAdmin()) {
						params.addAttribute("message", "Tài khoản không có quyền truy cập!");
						return "redirect:/user/account/login";
					} else {
						String uri = session.getAttribute("security-uri");
						session.setAttribute("user", user);
						if (uri != null) {
							String link = uri;
							session.removeAttribute("security-uri");
							return "redirect:" + link;

						} else {
							params.addAttribute("message", "Đăng nhập thành công!");

						}
						if (rm == true) {
							cookie.create("userid", user.getUsername(), 30);
							cookie.create("pass", user.getPassword(), 30); 
						} else { 
							cookie.remove("userid");
							cookie.remove("pass");
						}
					}

				}
			}
		} catch (Exception e) {
			params.addAttribute("message", "Tài khoản không tồn tại!");
			return "redirect:/user/account/login";
		}
		return "redirect:/user/home";
	}

// đăng kí	
	@GetMapping("/user/account/sign-up")
	public String register(Model model) {
		return "function/sign-up";
	}

// dang ki post
	@PostMapping("/user/account/sign-up")
	public String register(Model model, RedirectAttributes params, @RequestParam("attach") MultipartFile attach)
			throws MessagingException {
		boolean kt = true;
		String us = req.getParameter("username");
		List<Account> items = dao.findAll();
		for (Account item : items) {
			if (item.getUsername().equals(us)) {
				kt = false;
			}
		}
		if (kt == true) {
			Account item = new Account();
			Date date = new Date();
			item.setUsername(req.getParameter("username"));
			item.setPassword(req.getParameter("password"));
			item.setFullname(req.getParameter("fullname"));
			item.setEmail(req.getParameter("email"));
			item.setCreatedate(date);
			if (attach.isEmpty()) {
				item.setPhoto("NoImage.jpg");
			} else {
				String filename = null;
				filename = attach.getOriginalFilename();
				File file = new File(app.getRealPath("/user/images/" + filename));
				try {
					attach.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					params.addAttribute("message", "Hình ảnh đã tồn tại!");
				}
				item.setPhoto(filename);
				model.addAttribute("filename", filename);
			}

			item.setAdmin(false);
			item.setActivated(false);
			dao.save(item);
			model.addAttribute("message", "Đăng ký thành công. Vui lòng kiểm tra mail để kích hoạt tài khoản!");

			String to = item.getEmail();
			String subject = "Welcome!";
			String url = request.getRequestURL().toString().replace("sign-up", "activate/" + item.getUsername());
			String body = "Tech shop xin chào! Vui lòng nhấn vào <a href='" + url
					+ "'>Activate</a> để kích hoạt tài khoản.";
			MailInfo mail = new MailInfo(to, subject, body);
			mailer.send(mail);
		} else {
			model.addAttribute("message", "Tên đăng nhập đã tồn tại!!");
		}
		return "function/sign-up";

	}

	// active
	@GetMapping("/user/account/activate/{id}")
	public String activate(Model model, @PathVariable("id") String id) {
		Account acc = dao.getById(id);
		acc.setActivated(true);
		dao.save(acc);
		return "redirect:/user/account/login";
	}

	@RequestMapping("user/account/logout")
	public String logout(Model model) {
		session.removeAttribute("user");
		return "redirect:/user/home";
	}

// edit
	@RequestMapping("/user/account/edit/{username}")
	public String edit(Model model, @PathVariable("username") String username) {
		Account item = dao.findById(username).get();
		model.addAttribute("acc", item);
		model.addAttribute("filename", item.getPhoto());
		return "function/edit";
	}

// update
	@RequestMapping("/user/account/update")
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
			model.addAttribute("filename", item.getPhoto());
			model.addAttribute("message", "Cập nhật thành công!");
		} else {
			model.addAttribute("filename", item.getPhoto());
			params.addAttribute("message", "Cập nhật thất bại!");
		}
		return "function/edit";
	}

// forgot
	@GetMapping("/user/account/forgot")
	public String forgot(Model model) {
		return "function/forgot";
	}

	@PostMapping("/user/account/forgot")
	public String forgot1(Model model) throws MessagingException {
		String userid = req.getParameter("username");
		String email = req.getParameter("email");
		if (userid != null && email != null) {
			String to = email;
			Account item = dao.getById(userid);
			if (item != null) {
				String subject = "Welcome!";
				String body = "Tech shop xin chào! Mật khẩu của bạn là " + item.getPassword();
				MailInfo mail = new MailInfo(to, subject, body);
				mailer.send(mail);
				model.addAttribute("message", "Lấy mật khẩu thành công! check mail bạn nhé!");
			}
		}
		return "function/forgot";
	}

// change password
	@GetMapping("/user/account/change")
	public String change(Model model) {
		Account item = session.getAttribute("user");
		model.addAttribute("account", item);
		return "function/change";
	}

	@PostMapping("/user/account/change")
	public String change1(Model model) {
		Account item2 = session.getAttribute("user");
		Account item = dao.getById(item2.getUsername());
		
		String pw = req.getParameter("pw");
		String pw1 = req.getParameter("pw1");
		String pw2 = req.getParameter("pw2");
		if (pw == item.getPassword()) {
		}
		if (pw.equals(item.getPassword())) {
			if (pw1.equals(pw2)) {
				item.setPassword(pw1);
				dao.save(item);
				model.addAttribute("message", "Thay đổi mật khẩu thành công!");
			} else {
				model.addAttribute("message", "Mật khẩu mới và xác nhận mật khẩu là không khớp!");
			}
		} else {
			model.addAttribute("message", "Mật khẩu hiện tại là không chính xác!");
		}
		return "function/change";
	}

// ham kiem tra
	boolean ktTrung() {
		boolean kt = true;
		String us = req.getParameter("username");
		List<Account> items = dao.findAll();
		for (Account item : items) {
			if (item.getUsername().equals(us)) {
				kt = false;
			}
		}
		return kt;
	}
	
}
