package com.boot.jdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.DiaryBiz;

@Controller
@RequestMapping("/kids")
public class kidsController {
	
	@Autowired
	private DiaryBiz biz;
	
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
	
	@GetMapping("/sticker")
	public String sticker() {
		
		return "/kids/sticker";
	}
	
	@GetMapping("/snow")
	public String snow() {
		
		return "kids/snow";
	}
}
