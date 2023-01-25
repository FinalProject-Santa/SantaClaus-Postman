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
import com.boot.jdbc.model.dto.PointDto;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private	OrderBiz orderBiz;
	@Autowired
	private PointBiz pointBiz;
	
	List<OptionDto> dtoList = new ArrayList<OptionDto>();
	LetterDto letter_dto;
	String user_id;
	String letterName;
	int myPoint;
	
	@PostMapping("/orderForm")
	public String orderForm(Model model, LetterDto letterDto, OptionDto optionDtoList, HttpServletRequest request) {
		// 리스트 초기화
		dtoList.clear();
		
		// 주문완료 후 보여주기 위하여 전역변수 dto에 담기
		letter_dto = letterDto;
		
		// 엽서 이름 전역변수 letterName에 담기
		letterName = letterDto.getLetter_name();
				
		// 옵션 상품을 구매할 경우
		if(optionDtoList.getOptionDtoList() != null) {
			for(int i=0; i<optionDtoList.getOptionDtoList().size(); i++) {
				dtoList.add(optionDtoList.getOptionDtoList().get(i));
			}
			model.addAttribute("dtoList", dtoList);
		}
		// 세션에 담긴 값 꺼내기
		HttpSession session = request.getSession();
    
		user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		myPoint = pointBiz.pointAll(user_id);
		System.out.println(myPoint);
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
		String optionNames="";
		
		if(dtoList.size()>0) {
			for(int i=0; i<dtoList.size(); i++) {
				optionNames += dtoList.get(i).getOption_name() + ",";
			}
			optionNames = optionNames.substring(0, optionNames.length()-1);
			orderDto.setOption_name(optionNames);
		}else {
			orderDto.setOption_name(" ");
		}
		orderDto.setLetter_name(letterName);
		orderDto.setUser_id(user_id);

		// 결제 DB 데이터 추가
		orderBiz.payment(orderDto);
		
		// 포인트 DB 데이터 추가
		PointDto pointDto = new PointDto();
		pointDto.setOrder_no(orderDto.getOrder_no());
		pointDto.setUser_id(user_id);
		
		// 사용할 포인트가 있을 경우
		if(orderDto.getUse_point() != 0) {
			// 총 포인트 - 사용 포인트
			myPoint = myPoint - orderDto.getUse_point();
			
			// 사용 포인트 DB 데이터 추가
			pointDto.setPoint(orderDto.getUse_point());
			pointDto.setPoint_all(myPoint);
			pointDto.setPoint_content("포인트 사용");
			pointDto.setPoint_purpose("사용");
			pointBiz.insertPoint(pointDto);
		}
		
		// 적립 포인트 DB 데이터 추가
		pointDto.setPoint(orderDto.getSave_point());
		pointDto.setPoint_all(myPoint + orderDto.getSave_point());
		pointDto.setPoint_content("상품 구매");
		pointDto.setPoint_purpose("적립");		
		pointBiz.insertPoint(pointDto);
		
		model.addAttribute("optionList", dtoList);
		model.addAttribute("orderDto",orderDto);
		model.addAttribute("letterDto", letter_dto);
		
		return "/order/order";
	}
}
