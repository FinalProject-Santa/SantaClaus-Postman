package com.boot.jdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.OrderBiz;
import com.boot.jdbc.model.dto.OptionDto;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderBiz biz;
	
	@PostMapping("/orderForm")
	public String test(Model model, String child_name, String address, String ps, String[] option_img, String[] option_name, String[] option_price) {
		System.out.println(model.addAttribute("child_name", child_name));
		System.out.println(model.addAttribute("address", address));
		System.out.println(model.addAttribute("ps", ps));
		System.out.println(model.addAttribute("img", option_img));
		System.out.println(model.addAttribute("name", option_name));
		System.out.println(model.addAttribute("price", option_price));
		
		return "/order/orderForm";
	}
}
