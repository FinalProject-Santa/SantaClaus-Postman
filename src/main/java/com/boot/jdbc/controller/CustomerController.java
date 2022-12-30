package com.boot.jdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.ArticleBiz;
import com.boot.jdbc.model.biz.QnaBiz;
import com.boot.jdbc.model.dto.QnaDto;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private ArticleBiz articlebiz;
	
	@GetMapping("/faq")
	public String faq() {
		
		return "customer/faq";
	}
	
	@GetMapping("/notice")
	public String selectList(Model model) {
		model.addAttribute("list", articlebiz.selectList());
		return "customer/notice";
	}
	
	@GetMapping("/notice_detail")
	public String selectOne(Model model, int no) {
		model.addAttribute("dto",articlebiz.selectOne(no));
		return "customer/notice_detail";
	}
	
	
	@GetMapping("/floatingMenu")
	public String floatingMenu() {
		return "customer/floatingMenu";
	}
	
	@GetMapping("/qna")
	public String customer() {
		return "customer/qna";
	}
	
	
	/**
	@PostMapping("/qna_insert")
	public String customer_qna(QnaDto dto){
		if(QnaBiz.insert(dto)>0) {
			return "customer/qna";		
	}
}

**/
	
	
}