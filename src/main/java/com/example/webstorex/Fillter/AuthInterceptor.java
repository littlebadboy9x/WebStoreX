package com.example.webstorex.Fillter;

import com.example.webstorex.Entity.Account;
import com.example.webstorex.Service.SessionService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Account user = session.getAttribute("user"); // lấy từ session
		String error = "";
		if (user == null) { // chưa đăng nhập
			error = "Vui long dang nhap!";
		}
		if (error.length() > 0) { // có lỗi
			session.setAttribute("security-uri", uri);
			response.sendRedirect("/user/account/login?error=" + error);
			return false;
		}
		return true;
	}
}
