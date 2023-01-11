package com.boot.jdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.PointBiz;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@GetMapping("/main")
	public String mainpage() {
		return "mypage/mypage";
	}
	
	@GetMapping("/infoUpdateform")
	public String infoUpdateForm() {
		return "mypage/myinfoUpdate";
	}
	
	//주문 조회 페이지
	@GetMapping("/order")
	public String order() {
		return "mypage/myorder";
	}
	
	//장바구니 페이지
	@GetMapping("/cart")
	public String cart() {
		return "mypage/mycart";
	}
	@GetMapping("/pay")
	public String pay() {
		return "/payment";
	}
	@GetMapping("/keepShopping")
	public String keepShopping() {
		return "/templateList";
	}
	
	//마이포인트 페이지
	@Autowired
	private PointBiz pointBiz;
	
	@GetMapping("/point")
	public String point(Model model, String order_no) {
		model.addAttribute("list",pointBiz.selectList());
//		model.addAttribute("dto",pointBiz.pointAll(order_no));
		return "mypage/mypoint";
	}
	
	
	
	
	
	
	
	
	
	
	
}



