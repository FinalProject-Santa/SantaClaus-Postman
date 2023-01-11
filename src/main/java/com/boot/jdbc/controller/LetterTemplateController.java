package com.boot.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/letter")
public class LetterTemplateController {
	@GetMapping("/template")
	public String letterTemplate() {
		return "letter/letterTemplate";
	}
	
}
