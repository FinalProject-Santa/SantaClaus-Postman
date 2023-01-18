package com.boot.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tree")
public class TreeController {
	
	@GetMapping("/decotree")
	public String tree() {

			
		return "tree/decotree";
	}
	
}