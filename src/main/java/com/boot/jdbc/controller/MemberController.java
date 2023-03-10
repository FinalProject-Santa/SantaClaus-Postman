package com.boot.jdbc.controller;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.biz.MailHandler;
import com.boot.jdbc.model.biz.MemberBiz;
import com.boot.jdbc.model.biz.PointBiz;
import com.boot.jdbc.model.biz.SmsService;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/main")
public class MemberController {
	// 회원정보 dto
	MemberDto memberDto;
	// 아이들 정보 dto
	List<KidsDto> kidsDto;
	
	@Value("${file.upload.directory}")
	String fileUrl;
	
	@Autowired
	private MemberBiz biz;
	
	@Autowired
	private PointBiz pointBiz;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
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
	
	@PostMapping("/profile")
	public String profile(String user_id, String password, Model model) {
		memberDto = biz.login(user_id, password);
		// 기본 프로필없을경우 디폴트 사진 보여주기
		if(memberDto!=null) {
			// 아이 프로필이 있을 경우
			if((biz.selectChildrenProfile(user_id)).size() > 0){
				kidsDto = biz.selectChildrenProfile(user_id);
				model.addAttribute("kidsDto", kidsDto);
			}
			model.addAttribute("memberDto", memberDto);
			return "main/profile";
		}else {
			System.out.println("로그인 실패");
			return "redirect:/main/loginForm";
		}
	}
	
	@GetMapping("/login")
	public String login(String name, HttpSession session) {
		if(memberDto.getName().equals(name)) {
			session.setAttribute("member", memberDto);
			return "main/main"; 
		}else {
			for(int i=0; i<kidsDto.size(); i++) {
				if(kidsDto.get(i).getKids_nickname().equals(name)) {
					session.setAttribute("member", memberDto);
					session.setAttribute("kids", kidsDto.get(i));
					break;
				}
			}
			return "kids/main";
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
	
//	@PostMapping("/findPw")
//	@ResponseBody 
//	public String findPw(MemberDto dto) {
//		String pw = biz.findPw(dto);
//		System.out.println(pw);
//		return pw;
//	}
//	
////	@GetMapping("/findPwResult")
////	public String findPwResult(String pw, Model model) {
////		if(pw != null) {
////			model.addAttribute("pw", pw);
////			return "main/findPwResult";
////		}else {
////			return "redirect:/main/findPwForm";
////		}
////		
////	}
	 

	 @Autowired
	 PointBiz pointbiz;
	 
	@GetMapping("/delete")
	public String delete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		
		if(biz.delete(user_id)>0){
			biz.logout(session);
			System.out.println("삭제되었습니다");
			pointbiz.deletePoint(user_id);
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
		String phoneNum = biz.phoneChk(user_id);
		return phoneNum;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		biz.logout(session);
		
		return "/main/main";
	}
	
	
	@GetMapping("/main_profile")
	public String mainprofile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		String password = ((MemberDto)session.getAttribute("member")).getPassword();
		
		memberDto = biz.login(user_id, password);
		// 기본 프로필없을경우 디폴트 사진 보여주기
		if(memberDto!=null) {
			// 아이 프로필이 있을 경우
			if((biz.selectChildrenProfile(user_id)).size() > 0){
				kidsDto = biz.selectChildrenProfile(user_id);
				model.addAttribute("kidsDto", kidsDto);
			}
			model.addAttribute("memberDto", memberDto);
			return "main/profile";
		}else {
			System.out.println("로그인 실패");
			return "redirect:/main/loginForm";
		}
	}
	
	@GetMapping("/kidsprofile")
	public String Kidsprofile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		String password = ((MemberDto)session.getAttribute("member")).getPassword();
		
		memberDto = biz.login(user_id, password);
		// 기본 프로필없을경우 디폴트 사진 보여주기
		if(memberDto!=null) {
			// 아이 프로필이 있을 경우
			if((biz.selectChildrenProfile(user_id)).size() > 0){
				kidsDto = biz.selectChildrenProfile(user_id);
				model.addAttribute("kidsDto", kidsDto);
			}
			model.addAttribute("memberDto", memberDto);
			return "kids/kidsprofile";
		}else {
			System.out.println("로그인 실패");
			return "redirect:/main/loginForm";
		}
	}
	
	
	@PostMapping("/sendEmail")
	public String sendEmail(HttpServletRequest request, Model model) throws MessagingException {
		
		String userEmail = request.getParameter("email");
		String userId = request.getParameter("user_id");
		System.out.println(userId);
		
		 //인증 번호 생성기
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String tempkey = temp.toString();
        System.out.println(tempkey);
        
      
		MailHandler mailHandler = new MailHandler(mailSender);
		
		mailHandler.setFrom("jiyoun_908@naver.com");
		mailHandler.setTo(userEmail);
		mailHandler.setSubject("[Dear Santa] 인증번호 전송 이메일");
		mailHandler.setText(
				"안녕하세요 [Dear Santa] 인증 메일입니다."+
				"<br>오늘도 [Dear Santa]를 찾아주셔서 감사힙니다 :D"+
				"<br>아래 인증번호를 홈페이지에 입력해주세요."+
				"<br>인증번호 : "+temp
				,true);
		
		mailHandler.send();
		
		model.addAttribute("tempkey",tempkey);
		model.addAttribute("userId",userId);
		
		return "main/findPwResult";

	}
	
	@PostMapping("/findpw")
	public String findPw(HttpServletRequest request, Model model) {
		
		String number = request.getParameter("number");
		System.out.println(number);
		String tempkey = request.getParameter("temp");
		System.out.println(tempkey);
		String userId = request.getParameter("userId");
		System.out.println("아이디: "+userId);
		
		System.out.println("비즈: "+biz.findPw(userId));
		
		if(number.equals(tempkey)) {
			model.addAttribute("pw",biz.findPw(userId));
		}else {
			model.addAttribute("no","no");
		}
		
		return "main/findPwResult";
	}
	
	
}
