package com.boot.jdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.MemberBiz;
import com.boot.jdbc.model.biz.OrderInfoBiz;
import com.boot.jdbc.model.biz.PointBiz;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@GetMapping("/main")
	public String mainpage() {
		return "mypage/mypage";
	}
	
	//회원 정보 수정 페이지
	@Autowired
	private MemberBiz memberBiz;
	
	@GetMapping("/infoUpdateform")
	public String infoUpdateForm(Model model, String User_id) {
		model.addAttribute("memberdto",memberBiz.infoUpdateform(User_id));
		return "mypage/myinfoUpdate";
	}
	
	
	
	//주문 조회 페이지
	@Autowired
	private OrderInfoBiz orderBiz;
	
	@GetMapping("/order")
	public String order(Model model) {
		model.addAttribute("orderlist",orderBiz.orderList());
		return "mypage/myorder";
	}
//	@RequestMapping("/selectOrder")
//	public String selectOrder(Model model) {
//		model.addAttribute("orderlist",orderBiz.selectOrder());
//		return "mypage/myorder";
//	}
	
	
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



