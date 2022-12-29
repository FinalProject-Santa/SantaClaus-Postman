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
	
	@GetMapping("/puzzle")
	public String puzzle() {
		
		return "kids/puzzle";
	}
	
	@GetMapping("/onelevel")
	public String puzzle_onelevel() {
		
		return "kids/puzzle_1level";
	}
	
	@GetMapping("/twolevel")
	public String puzzle_twolevel() {
		
		return "kids/puzzle_2level";
	}
	
	@GetMapping("/diary")
	public String diary() {
		
		return "kids/diary";
	}
	
}
