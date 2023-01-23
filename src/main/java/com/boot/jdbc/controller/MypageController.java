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
		MemberDto memberdto = ((MemberDto)session.getAttribute("member"));
		if(memberdto!=null) {
			model.addAttribute("memberdto",memberBiz.infoUpdateform(user_id));
			model.addAttribute("memberdto",memberdto);
			return "mypage/mypage";
		}else {
			return "redirect:/main/loginForm";
		}
	}
	
	//회원 정보 수정 페이지
	@GetMapping("/infoUpdateform")
	public String infoUpdateForm(Model model, MemberDto memberDto, String user_id, HttpServletRequest request) {
		HttpSession session = request.getSession();	
		MemberDto memberdto = ((MemberDto)session.getAttribute("member"));
		if(memberdto!=null) {
			model.addAttribute("memberdto",memberBiz.infoUpdateform(user_id));
			model.addAttribute("memberdto",memberdto);
			return "mypage/myinfoUpdate";
		}else {
			return "redirect:/main/loginForm";
		}
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
	
	
	
	//마이포인트 페이지
	@Autowired
	private PointBiz pointBiz;
	
	@RequestMapping(value = "/point")
	public ModelAndView point(Model model, Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView("/mypage/mypoint");
		
		model.addAttribute("list",pointBiz.selectList(cri));
		
		String user_id = "tmdwpckd"; //세션 연결
		model.addAttribute("mypoint", pointBiz.pointAlll(user_id));
		
		System.out.println(pointBiz.pointAlll(user_id));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pointBiz.countBoardListTotal());
		List<PointDto> list = pointBiz.selectList(cri);
		
		mav.addObject("list", list);
		
		mav.addObject("pageMaker",pageMaker);
		
//		model.addAttribute("myPoint",pointBiz.pointAlll(user_id));
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
}



