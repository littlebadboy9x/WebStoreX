package com.example.webstorex.Fillter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig_Admin implements WebMvcConfigurer {
	@Autowired
	AuthInterceptor_Admin auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth)
				.addPathPatterns("/admin/**")
				.excludePathPatterns("/admin/assets/**","/admin/login","/admin/images/*");
	}
}
