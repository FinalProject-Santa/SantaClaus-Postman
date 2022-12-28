package com.boot.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@GetMapping("/faq")
	public String faq() {
		
		return "customer/faq";
	}
	
	@GetMapping("/notice")
	public String notice() {
		return "customer/notice";
	}
	
	@GetMapping("/floatingMenu")
	public String floatingMenu() {
		return "customer/floatingMenu";
	}
	
	@GetMapping("/qna")
	public String customer() {
		return "customer/qna";
	}
	
}