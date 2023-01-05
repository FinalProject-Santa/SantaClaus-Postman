package com.boot.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/newyear")
public class NyController {
	
	@GetMapping("/ny")
	public String ny() {

			
		return "newyear/ny";
	}
	
}