package com.boot.jdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String login(String user_id) {
		biz.login(user_id);
		return "index";
	}
	
	@PostMapping("/idChk")
	@ResponseBody
	public void idChk(String user_id) {
		System.out.println(user_id);
		biz.idChk(user_id);
	}
	
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "main/findId";
	}
	
	@PostMapping("/findId")
	public void findId(MemberDto dto) {
		biz.findId(dto);
	}
	
	@GetMapping("/findIdResult")
	public String findIdResult() {
		return "main/findIdResult";
	}
	
	@GetMapping("/findPwForm")
	public String findPwForm() {
		return "main/findPw";
	}
	
	@PostMapping("/findPw")
	public void findPw(MemberDto dto) {
		biz.findPw(dto);
	}
	
	@GetMapping("/findPwResult")
	public String findPwResult() {
		return "main/findPwResult";
	}
}
