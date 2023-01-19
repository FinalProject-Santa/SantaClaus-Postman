package com.boot.jdbc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.OrderInfoBiz;
import com.boot.jdbc.model.biz.PointBiz;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OptionDto;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderInfoBiz orderBiz;
	@Autowired
	private PointBiz pointBiz;
	
	@PostMapping("/orderForm")
	public String test(Model model, LetterDto letterDto, OptionDto optionDtoList, HttpServletRequest request) {
		List<OptionDto> dtoList = new ArrayList<OptionDto>();
		
		// 옵션 상품을 구매할 경우
		if(optionDtoList.getOptionDtoList() != null) {
			for(int i=0; i<optionDtoList.getOptionDtoList().size(); i++) {
				dtoList.add(optionDtoList.getOptionDtoList().get(i));
			}
			model.addAttribute("dtoList", dtoList);
		}
		HttpSession session = request.getSession();
		String user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		int myPoint = pointBiz.pointAll(user_id);
		model.addAttribute("myPoint", myPoint);
		model.addAttribute("letterDto", letterDto);
		return "/order/orderForm";
	}
}
