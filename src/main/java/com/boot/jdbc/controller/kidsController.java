package com.boot.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/kids")
public class kidsController {
	
	@GetMapping("/main")
	public String main() {
		
		return "kids/main";
	}
	
}
