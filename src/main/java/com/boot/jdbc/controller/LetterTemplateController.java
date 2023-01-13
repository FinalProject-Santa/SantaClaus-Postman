package com.boot.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/letter")
public class LetterTemplateController {
	// 엽서 목록
	@GetMapping("/template")
	public String letterTemplate() {
		return "letter/letterTemplate";
	}
	
	// 엽서 상세
	@RequestMapping("/detail/{letterNo}")
	public String letterDetail(Model model, @PathVariable int letterNo) {
		model.addAttribute("letterNo", letterNo);
		return "letter/letterDetail";
	}
	
}
