package com.boot.jdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.jdbc.model.biz.MemberBiz;
import com.boot.jdbc.model.dto.MemberDto;

@Controller
@RequestMapping("/main")
public class MemberController {
	
	@Autowired
	private MemberBiz biz;
	
	@GetMapping("/signUpForm")
	public String signUp() {
		return "main/signUp";
	}
	
	@PostMapping("/signUp")
	public String signUp(MemberDto dto) {
		biz.signUp(dto);
		return "main/login";
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "main/login";
	}
	
	@PostMapping("/login")
	public String login(String user_id, String password) {
		String res = biz.login(user_id, password);
		System.out.println(res);
		if(res!=null) {
			System.out.println("로그인 성공");
			return "index";
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
}
