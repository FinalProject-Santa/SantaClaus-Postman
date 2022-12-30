package com.boot.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class mypageController {
	
	@GetMapping("/main")
	public String mainpage() {
		return "mypage/mypage";
	}
	
	@GetMapping("/infoUpdateform")
	public String infoUpdateForm() {
		return "mypage/myinfoUpdate";
	}
	
	@GetMapping("/order")
	public String order() {
		return "mypage/myorder";
	}
	
	@GetMapping("/cart")
	public String cart() {
		return "mypage/mycart";
	}
	
	@GetMapping("/point")
	public String point() {
		return "mypage/mypoint";
	}
	
	
	
	
	
	
	
	
	
	
	
}



