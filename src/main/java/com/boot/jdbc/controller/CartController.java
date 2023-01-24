package com.boot.jdbc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.CartBiz;
import com.boot.jdbc.model.dto.CartDto;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OptionDto;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	//장바구니 페이지 이동
	@Autowired
	private CartBiz cartBiz;
	@PostMapping("/cartpage")
	public String cartpage(Model model, LetterDto letterDto, OptionDto optionDto, CartDto cartDto, HttpServletRequest request) {
		List<OptionDto> optiondtoList = new ArrayList<OptionDto>();
		String option_no = "";
		
		if(optionDto.getOptionDtoList()!= null) {
			for(int i=0; i<optionDto.getOptionDtoList().size(); i++) {
				optiondtoList.add(optionDto.getOptionDtoList().get(i));
				option_no += optionDto.getOptionDtoList().get(i).getOption_no() + ",";
			}
			model.addAttribute("optiondtoList", optiondtoList);
		}
		
		int letter_no = letterDto.getLetter_no();
		
		HttpSession session = request.getSession();
		String user_id = ((MemberDto)session.getAttribute("member")).getUser_id();

		
//		List<CartDto> cartDto1 = cartBiz.cartList(user_id, letter_no, option_no);
		
		//model.addAttribute("cartDto", cartBiz.cartList(user_id));
		model.addAttribute("letterDto", letterDto);
		return "/mypage/mycart";
		
		
		
		/*
		 * 
		
		List<CartDto> cartList = new ArrayList<CartDto>();
		HttpSession session = request.getSession();	
		String user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		model.addAttribute("cartDto", cartList);
		return "mypage/mycart";
	
		if(user_id != null) {
			model.addAttribute("letterDto", letterDto);
			model.addAttribute("optionDto", optionDto);
			
			return "mypage/mycart";
		}else {
			System.out.println("로그인 해라");
			return "redirect:/main/loginForm";
		}
		*/
	}
	
	@GetMapping("/delete")
	public String delete(String user_id, int cart_no) {
		if(cartBiz.delete(user_id, cart_no)>0) {
			System.out.println("삭제 성공");
			return "cart/cartpage";
		}else {
			System.out.println("삭제 실패"); 
			return "cart/cartpage";
		}
	}

	
	/* 장바구니 결제하기, 쇼핑 계속하기 페이지 이동 버튼
	@GetMapping("/pay")
	public String pay() {
		return "/payment";
	}
	@GetMapping("/keepShopo.option_price) * 0.1 }" />p</td>
                                    <td>
										<c:choose>ping")
	public String keepShopping() {
		return "/templateList";
	}
	*/
		
		



}
