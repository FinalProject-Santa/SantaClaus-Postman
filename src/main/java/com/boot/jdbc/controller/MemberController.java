package com.boot.jdbc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.biz.MemberBiz;
import com.boot.jdbc.model.biz.PointBiz;
import com.boot.jdbc.model.biz.SmsService;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.ReviewDto;
import com.boot.jdbc.model.dto.rFileDto;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/main")
public class MemberController {
	
	@Autowired
	private MemberBiz biz;
	
	@Autowired
	private PointBiz pointBiz;
	
	// 메인페이지
	@GetMapping("/main")
	public String mainPage() {
		return "main/main";
	}
	
	@GetMapping("/signUpForm")
	public String signUp() {
		return "main/signUp";
	}
	
	@PostMapping("/signUp")
	public String signUp(MemberDto dto, @RequestPart MultipartFile files) throws Exception {
		
		String sourceFileName = files.getOriginalFilename(); 
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
        File destinationFile; 
        String destinationFileName;
        String fileUrl = "C:\\Users\\parkjiyoung\\git\\SantaClaus-Postman\\src\\main\\resources\\static\\image\\member-account\\";
        
        do { 
            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
            destinationFile = new File(fileUrl + destinationFileName); 
        } while (destinationFile.exists()); 
        
        destinationFile.getParentFile().mkdirs(); 
        files.transferTo(destinationFile); 
		
        dto.setRfileName(destinationFileName);
        dto.setRfileOriName(sourceFileName);
        dto.setRfileUrl(fileUrl);
        
        biz.signUp(dto);
        
        pointBiz.signUpPoint(dto.getUser_id());
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
	
//	@PostMapping("/login")
//	public String login(String user_id, String password, Model model) {
//		MemberDto memberDto = biz.login(user_id, password);
//		
//		if(memberDto!=null) {
//			// 아이 프로필이 있을 경우
//			if((biz.selectChildrenProfile(user_id)).size() > 0){
//				List<KidsDto> kidsDto = biz.selectChildrenProfile(user_id);
//				model.addAttribute("kidsDto", kidsDto);
//			}
//			model.addAttribute("memberDto", memberDto);
//			System.out.println("여기까지");
//			return "main/profile";
//		}else {
//			System.out.println("로그인 실패");
//			return "redirect:/main/loginForm";
//		}
//	}
	
	@PostMapping("/login")
	public String login(String user_id, String password, HttpSession session) {
		MemberDto member = biz.login(user_id, password);
		if(member!=null) {
			session.setAttribute("member", member);
			return "main/main"; 
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
	public String myinfoUpdate(Model model, MemberDto dto, String user_id, HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {
		HttpSession session = request.getSession();
		MemberDto memberdto = ((MemberDto)session.getAttribute("member"));
		
		String uploadPath = "C:\\workspace\\finalproject\\SantaClaus-Postman\\src\\main\\resources\\static\\image\\profile\\";
		
		if(files.getOriginalFilename()!= null && !files.getOriginalFilename().equals("")) {
			String sourcefileName = files.getOriginalFilename(); 
			
			new File(uploadPath + request.getParameter("rfileName")).delete();
			// new File(uploadPath + request.getParameter("rfileName")).renameTo(new File(uploadPath + "test.jpg"));
			
            String sourcefileNameExtension = FilenameUtils.getExtension(sourcefileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourcefileNameExtension; 
                destinationFile = new File(uploadPath + destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile);
            
            dto.setRfileName(destinationFileName);
            dto.setRfileOriName(sourcefileName);
		}else {  // 새로운 파일이 등록되지 않았다면
			  // 기존 이미지를 그대로 사용
			dto.setRfileName(request.getParameter("rfileName"));
		}
			  
		dto.setUser_id(request.getParameter("user_id"));
         
		dto.setRfileUrl(uploadPath);
		dto.setPassword(request.getParameter("password"));
		dto.setName(request.getParameter("name"));
		dto.setPost_code(request.getParameter("post_code"));
		dto.setDefault_addr(request.getParameter("default_addr"));
		dto.setDetail_addr(request.getParameter("detail_addr"));
		dto.setPhone(request.getParameter("phone"));
		dto.setEmail(request.getParameter("email"));
		dto.setPhone(request.getParameter("phone"));
        
		model.addAttribute("memberdto",biz.infoUpdateform(user_id));
		model.addAttribute("memberdto",memberdto);
		
		if(biz.myinfoUpdate(dto)>0) {
			System.out.println("회원정보 수정 완료");
			return "mypage/mypage";
		}else {
			System.out.println("회원정보 수정 실패");
			return "redirect:/mypage/myinfoUpdate/"+request.getParameter("user_id");
		}
	}
	@GetMapping("/delete")
	public String delete(String user_id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto memberdto = ((MemberDto)session.getAttribute("member"));
		
		if(biz.delete(user_id)>0){
			System.out.println("삭제되었습니다");
			return "main/main";
		}else {
			System.out.println("삭제 실패");
			return "mypage/myinfoUpdate";
		}
	}
	@PostMapping("/pwChk")
	@ResponseBody
	public String pwChk(String user_id) {
		
		String res = biz.pwChk(user_id);
		System.out.println(res);
		return res;
	}
	@PostMapping("/phoneChk")
	@ResponseBody
	public String phoneChk(String user_id) {
		
		String phone = biz.phoneChk(user_id);
		System.out.println(phone);
		return phone;
	}
	
	
	/*
	$("#update").click(function() {
		$.ajax({
			url: "/main/phoneChk",
			type: 'POST',
			data: {
				"user_id" : id,
				"phone" : phone
			},
			success: function(phone){
				
			}
			});
	
	*/
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		biz.logout(session);
		
		return "/main/main";
	}
	
	
	
	
	
	
	
	
	
	
	
}
