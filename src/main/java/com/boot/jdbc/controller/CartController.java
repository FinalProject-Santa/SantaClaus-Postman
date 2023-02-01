package com.boot.jdbc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.GenericTypeAwareAutowireCandidateResolver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	String user_id;
	List<CartDto> cartDtoList = new ArrayList<CartDto>();
	
	
	@PostMapping("/cartpage")
	public String cartpage(Model model, LetterDto letterDto, OptionDto optionDtoList, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto memberDto = ((MemberDto)session.getAttribute("member"));
		user_id = memberDto.getUser_id();
		CartDto cartDto = new CartDto();
		String letterName = letterDto.getLetter_name();
		String optionNames = "";

		// 옵션 상품을 구매할 경우
		if(optionDtoList.getOptionDtoList() != null) {
			for(int i=0; i<optionDtoList.getOptionDtoList().size(); i++) {
				// 예) 옵션3-1 : 옵션3 수량1 개
				optionNames += optionDtoList.getOptionDtoList().get(i).getOption_name() + "-" + optionDtoList.getOptionDtoList().get(i).getoption_quantity() + ",";
			}
			optionNames = optionNames.substring(0, optionNames.length()-1);
			cartDto.setOption_name(optionNames);
		}
		cartDto.setLetter_name(letterName);
		cartDto.setUser_id(user_id);
		
		System.out.println("선택한 엽서 : " + letterName);
		System.out.println("선택한 옵션 : " +optionNames);
		cartBiz.cartInsert(cartDto);
		cartDtoList = cartBiz.cartList(user_id);
		
		List<LetterDto> cart_letterList = new ArrayList<LetterDto>();
		List<OptionDto> cart_optionList = new ArrayList<OptionDto>();
		LetterDto cart_letterDto = new LetterDto();
		OptionDto cart_optionDto = new OptionDto();
		
		String cart_letterNames = "";
		String cart_optionNames = "";
		
		for(int i=0; i<cartDtoList.size(); i++){
//			cart_letterDto.setLetter_name(cartDtoList.get(i).getLetter_name() + ",");
//			cart_optionDto.setOption_name(cartDtoList.get(i).getOption_name() + "/");
//			cart_optionList.add(cart_optionDto);
			
			cart_letterNames += cartDtoList.get(i).getLetter_name() + ",";
			
			if(cartDtoList.get(i).getOption_name()!=null) {
				cart_optionNames += cartDtoList.get(i).getOption_name() + "/";
			}
		}
		System.out.println("장바구니 엽서 : " + cart_letterNames);
		System.out.println("장바구니 옵션 : " + cart_optionNames);
		
		String[] letterNameArr =  cart_letterNames.split(",");
		for(int i=0; i<letterNameArr.length; i++) {
			// 엽서 테이블에서 엽서 상품명을 기준으로 데이터 가져오기
			cart_letterDto = cartBiz.letterInfo(letterNameArr[i]);
			cart_letterList.add(cart_letterDto);
		}
		
		if(cart_optionNames.length()>2) {
			
		String[] optionNameArr =  cart_optionNames.split("/");
		String[] arr = null;
		String optionName = "";
		String[] quantity;
		System.out.println(cart_optionNames);
			
		
			for(int i=0; i<optionNameArr.length; i++) {
				arr = optionNameArr[i].split(",");
				if(arr.length>0) {
					for(int j=0; j<arr.length; j++) {
						quantity = arr[j].split("-");
						System.out.println("옵션 테이블에서 가져올 옵션상품명 : " + quantity[0]);
						System.out.println("옵션 테이블에서 가져올 옵션 수량 : " + quantity[1]);
						// 옵션 테이블에서 옵션 상품명을 기준으로 데이터 가져오기
						cart_optionDto = cartBiz.optionInfo(quantity[0]);
						cart_optionDto.setoption_quantity(Integer.parseInt(quantity[1]));
						cart_optionList.add(cart_optionDto);
					}
					model.addAttribute("optionList", cart_optionList);
				}
			}
		}
		
		model.addAttribute("letterList", cart_letterList);
		
		System.out.println("끝");
		return "/mypage/mycart";
	}
	
	@GetMapping("/mycart")
	public String mycart(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto memberDto = ((MemberDto)session.getAttribute("member"));
		user_id = memberDto.getUser_id();
		
		cartDtoList = cartBiz.cartList(user_id);
		
		List<LetterDto> cart_letterList = new ArrayList<LetterDto>();
		List<OptionDto> cart_optionList = new ArrayList<OptionDto>();
		LetterDto cart_letterDto = new LetterDto();
		OptionDto cart_optionDto = new OptionDto();
		
		String cart_letterNames = "";
		String cart_optionNames = "";
		if(cartDtoList.size()>0) {
			
		
		for(int i=0; i<cartDtoList.size(); i++){
//			cart_letterDto.setLetter_name(cartDtoList.get(i).getLetter_name() + ",");
//			cart_optionDto.setOption_name(cartDtoList.get(i).getOption_name() + "/");
//			cart_optionList.add(cart_optionDto);
			
			cart_letterNames += cartDtoList.get(i).getLetter_name() + ",";
			
			if(cartDtoList.get(i).getOption_name()!=null) {
				cart_optionNames += cartDtoList.get(i).getOption_name() + "/";
			}
		}
		System.out.println("장바구니 엽서 : " + cart_letterNames);
		System.out.println("장바구니 옵션 : " + cart_optionNames);
		
		String[] letterNameArr =  cart_letterNames.split(",");
		for(int i=0; i<letterNameArr.length; i++) {
			// 엽서 테이블에서 엽서 상품명을 기준으로 데이터 가져오기
			cart_letterDto = cartBiz.letterInfo(letterNameArr[i]);
			cart_letterList.add(cart_letterDto);
		}
		
		if(cart_optionNames.length()>2) {
			
		String[] optionNameArr =  cart_optionNames.split("/");
		String[] arr = null;
		String optionName = "";
		String[] quantity;
		System.out.println(cart_optionNames);
			
		
			for(int i=0; i<optionNameArr.length; i++) {
				arr = optionNameArr[i].split(",");
				if(arr.length>0) {
					for(int j=0; j<arr.length; j++) {
						quantity = arr[j].split("-");
						System.out.println("옵션 테이블에서 가져올 옵션상품명 : " + quantity[0]);
						System.out.println("옵션 테이블에서 가져올 옵션 수량 : " + quantity[1]);
						// 옵션 테이블에서 옵션 상품명을 기준으로 데이터 가져오기
						cart_optionDto = cartBiz.optionInfo(quantity[0]);
						cart_optionDto.setoption_quantity(Integer.parseInt(quantity[1]));
						cart_optionList.add(cart_optionDto);
					}
					model.addAttribute("optionList", cart_optionList);
				}
			}
		}
		
		model.addAttribute("letterList", cart_letterList);
		}
		System.out.println("끝");
		return "/mypage/mycart";
	}
	
	
	
	
	@GetMapping("/delete")
	@ResponseBody
	public String delete(String itemName) {
//		cartBiz.delete(user_id, itemName);
		return "";
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
