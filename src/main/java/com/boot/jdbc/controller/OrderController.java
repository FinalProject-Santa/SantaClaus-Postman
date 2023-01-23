package com.boot.jdbc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.OrderBiz;
import com.boot.jdbc.model.biz.PointBiz;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OptionDto;
import com.boot.jdbc.model.dto.OrderDto;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private	OrderBiz orderBiz;
	@Autowired
	private PointBiz pointBiz;
	
	List<OptionDto> dtoList = new ArrayList<OptionDto>();
	LetterDto letter_dto;
	
	@PostMapping("/orderForm")
	public String orderForm(Model model, LetterDto letterDto, OptionDto optionDtoList, HttpServletRequest request) {
		// 리스트 초기화
		dtoList.clear();
		
		// 주문완료 후 보여주기 위하여 전역변수 dto에 담기
		letter_dto = letterDto;
		
		// 옵션 상품을 구매할 경우
		if(optionDtoList.getOptionDtoList() != null) {
			for(int i=0; i<optionDtoList.getOptionDtoList().size(); i++) {
				dtoList.add(optionDtoList.getOptionDtoList().get(i));
			}
			model.addAttribute("dtoList", dtoList);
		}
		// 세션에 담긴 값 꺼내기
		HttpSession session = request.getSession();
		String user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		int myPoint = pointBiz.pointAll(user_id);

		// 회원 정보 가져오기
		MemberDto memberDto = orderBiz.memberInfo(user_id);
		model.addAttribute("memberDto", memberDto);
		
		// 최근 배송지 데이터 가져오기
		/* orderBiz.S */
		
		model.addAttribute("myPoint", myPoint);
		model.addAttribute("letterDto", letterDto);
		return "/order/orderForm";
	}
	
	@PostMapping("/order")
	public String order(Model model, OrderDto orderDto) {
		model.addAttribute("optionList", dtoList);
		model.addAttribute("orderDto", orderDto);
		model.addAttribute("letterDto", letter_dto);
		return "/order/order";
	}
}
