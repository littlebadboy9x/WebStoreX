package com.example.webstorex.Fillter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	AuthInterceptor auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth)
				.addPathPatterns("/user/account/edit", "/user/account/change", "/user/add/**", "/user/order/**",
						"/user/cart", "/user/cart/*", "/user/review/create")
				.excludePathPatterns("/admin/assets/**", "/admin/login", "/admin/images/*");
	}
}
