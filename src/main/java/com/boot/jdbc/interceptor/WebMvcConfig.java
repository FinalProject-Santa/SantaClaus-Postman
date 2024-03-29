package com.boot.jdbc.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	@Autowired
	HttpInterceptor httpInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(httpInterceptor)
		.addPathPatterns("/*")
		.excludePathPatterns("/main/loginForm")
		.excludePathPatterns("/main/main"); //메인
	}

}
