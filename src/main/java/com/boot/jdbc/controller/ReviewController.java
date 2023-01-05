package com.boot.jdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.ReviewBiz;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewBiz reviewbiz;
	
	@GetMapping("/reviewList")
	public String reviewList(Model model) {
		model.addAttribute("reviewlist", reviewbiz.rselectList());
			
		return "review/reviewList";
	}
	
	@GetMapping("/reviewinsertform")
	public String rinsertform() {
		return "review/reviewInsertForm";
				
	}
	
	@GetMapping("/reviewInsert")
	public String reviewInsert() {

			
		return "review/reviewInsert";
	}
	
	@GetMapping("/reviewDetail")
	public String reviewDetail(Model model, int review_no) {
		model.addAttribute("reviewdetail", reviewbiz.rselectOne(review_no));
		return "review/reviewDetail";
	}
}