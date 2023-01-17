package com.boot.jdbc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.OrderBiz;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OptionDto;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderBiz biz;
	
	@PostMapping("/orderForm")
	public String test(Model model, LetterDto letterDto, OptionDto optionDtoList) {
		List<OptionDto> dtoList = new ArrayList<OptionDto>();
		for(int i=0; i<optionDtoList.getOptionDtoList().size(); i++) {
			dtoList.add(optionDtoList.getOptionDtoList().get(i));
		}
		model.addAttribute("letterDto", letterDto);
		model.addAttribute("dtoList", dtoList);
		
		return "/order/orderForm";
	}
}
