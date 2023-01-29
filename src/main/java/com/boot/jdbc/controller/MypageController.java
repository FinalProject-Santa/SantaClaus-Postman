package com.boot.jdbc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.boot.jdbc.model.biz.MemberBiz;
import com.boot.jdbc.model.biz.OrderInfoBiz;
import com.boot.jdbc.model.biz.PointBiz;
import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.PageMaker;
import com.boot.jdbc.model.dto.PointDto;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MemberBiz memberBiz;

	@GetMapping("/main")
	public String mainpage(Model model, MemberDto memberDto, String user_id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto memberdto = ((MemberDto) session.getAttribute("member"));
		if (memberdto != null) {
			model.addAttribute("memberdto", memberBiz.infoUpdateform(user_id));
			model.addAttribute("memberdto", memberdto);
			return "mypage/mypage";
		} else {
			return "redirect:/main/loginForm";
		}
	}

	// 회원 정보 수정 페이지
	@GetMapping("/infoUpdateform")
	public String infoUpdateForm(Model model, MemberDto memberDto, String user_id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto memberdto = ((MemberDto) session.getAttribute("member"));
		if (memberdto != null) {
			model.addAttribute("memberdto", memberBiz.infoUpdateform(user_id));
			model.addAttribute("memberdto", memberdto);
			return "mypage/myinfoUpdate";
		} else {
			return "redirect:/main/loginForm";
		}
	}

	// 주문 조회 페이지
	@Autowired
	private OrderInfoBiz orderBiz;

	@GetMapping("/order")
	public String order(Model model) {
		model.addAttribute("orderlist", orderBiz.orderList());
		return "mypage/myorder";
	}
//	@RequestMapping("/selectOrder")
//	public String selectOrder(Model model) {
//		model.addAttribute("orderlist",orderBiz.selectOrder());
//		return "mypage/myorder";
//	}

	// 마이포인트 페이지
	@Autowired
	private PointBiz pointBiz;

	@RequestMapping(value = "/point")
	public ModelAndView point(Criteria cri, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/mypage/mypoint");

		HttpSession session = request.getSession();
		MemberDto memberDto = ((MemberDto)session.getAttribute("member"));
//		PointDto pointDto = pointBiz.selectpoint(user_id);
//		model.addAttribute("list", pointDto );
		System.out.println(memberDto.getUser_id());

		mav.addObject("mypoint", pointBiz.pointAll(memberDto.getUser_id()));
		System.out.println("페이지:"+cri.getPageStart());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pointBiz.countBoardListTotal());
		List<PointDto> list = pointBiz.selectList(memberDto, cri);
//		model.addAttribute("list",list);

		System.out.println(list);

		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);

		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	

}
