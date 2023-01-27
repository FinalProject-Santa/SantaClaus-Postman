package com.boot.jdbc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boot.jdbc.model.biz.LetterBiz;
import com.boot.jdbc.model.dto.Criteria_Letter;
import com.boot.jdbc.model.dto.PageMaker;

@Controller
@RequestMapping("/letter")
public class LetterController {
	
	@Autowired
	private LetterBiz biz;
	
	// 메인화면의 엽서
	@ResponseBody
	@GetMapping("/mainLetter")
	public List<String> mainLetter() {
		return biz.mainList();
	}
	
	// 엽서 목록
	@RequestMapping(value = "/letterList")
	public ModelAndView letterList(Criteria_Letter cri) throws Exception {
		ModelAndView mav = new ModelAndView("/letter/letterList");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriLetter(cri);
		pageMaker.setTotalLetterCount(biz.countLetterListTotal());
		
		List<Map<String,Object>> list = biz.letterList(cri);
		
		mav.addObject("letterList", list);
		mav.addObject("pageMaker",pageMaker);
		
		return mav;
	}
	
	// 엽서 상세
	@RequestMapping("/detail/{letterNo}")
	public String letterDetail(Model model, String letterName, String letterPrice, String letterImg) {
		model.addAttribute("letterName", letterName);
		model.addAttribute("letterImg", letterImg);
		model.addAttribute("letterPrice", letterPrice);
		model.addAttribute("optionList", biz.optionList());
		return "letter/letterDetail";
	}
}
