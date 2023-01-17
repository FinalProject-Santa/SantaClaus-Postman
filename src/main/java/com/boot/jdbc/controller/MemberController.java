package com.boot.jdbc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.jdbc.model.biz.MemberBiz;
import com.boot.jdbc.model.biz.SmsService;
import com.boot.jdbc.model.dto.MemberDto;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/main")
public class MemberController {
	
	@Autowired
	private MemberBiz biz;
	
	// 메인페이지
	@GetMapping("/main")
	public String mainPage() {
		return "main/mainPage";
	}
	
	@GetMapping("/signUpForm")
	public String signUp() {
		return "main/signUp";
	}
	
	@PostMapping("/signUp")
	public String signUp(MemberDto dto) {
		biz.signUp(dto);
		return "main/login";
	}
	
	// 문자 인증
	@GetMapping("/phoneAuth")
	public @ResponseBody String sendSMS(@RequestParam(value="to") String to) throws CoolsmsException {  	
		return SmsService.PhoneAuthentication(to);
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "main/login";
	}
	
	@PostMapping("/login")
	public String login(String user_id, String password, HttpSession session) {
		MemberDto member = biz.login(user_id, password);
		if(member!=null) {
			session.setAttribute("member", member);
			return "main/main"; //고치쇼 profile
		}else {
			System.out.println("로그인 실패");
			return "redirect:/main/loginForm";
		}
	}
	
	@PostMapping("/idChk")
	@ResponseBody
	public int idChk(String user_id) {
		String res = biz.idChk(user_id);
		if(res!=null) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "main/findId";
	}
	
	@PostMapping("/findId")
	@ResponseBody 
	public String findId(MemberDto dto) {
		String id = biz.findId(dto);
		return id;
	}
	
	@GetMapping("/findIdResult")
	public String findIdResult(String id, Model model) {
		if(id != null) {
			model.addAttribute("id", id);
			return "main/findIdResult";
		}else {
			return "redirect:/main/findIdForm";
		}
	}
	
	@GetMapping("/findPwForm")
	public String findPwForm() {
		return "main/findPw";
	}
	
	@PostMapping("/findPw")
	@ResponseBody 
	public String findPw(MemberDto dto) {
		String pw = biz.findPw(dto);
		System.out.println(pw);
		return pw;
	}
	
	@GetMapping("/findPwResult")
	public String findPwResult(String pw, Model model) {
		if(pw != null) {
			model.addAttribute("pw", pw);
			return "main/findPwResult";
		}else {
			return "redirect:/main/findPwForm";
		}
		
	}
	 

	//회원정보 수정
	@PostMapping("/myinfoUpdate")
	public String myinfoUpdate(MemberDto dto) {
		if(biz.myinfoUpdate(dto)>0) {
			System.out.println("회원정보 수정 완료");
			return "redirect:/mypage/mypage?user_id="+dto.getUser_id();
		}else {
			System.out.println("회원정보 수정 실패");
			return "redirect:/mypage/myinfoUpdate?user_id="+dto.getUser_id();
		}
	}
	@GetMapping("/delete")
	public String delete(String user_id) {
		if(biz.delete(user_id)>0){
			System.out.println("삭제되었습니다");
			return "index";
		}else {
			System.out.println("삭제 실패");
			return "mypage/myinfoUpdate";
		}
	}
	
	
	
	
}
