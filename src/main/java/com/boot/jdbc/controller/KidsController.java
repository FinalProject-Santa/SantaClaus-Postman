package com.boot.jdbc.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.jdbc.model.biz.DiaryBiz;
import com.boot.jdbc.model.biz.MailHandler;
import com.boot.jdbc.model.dto.DiaryDto;

@Controller
@RequestMapping("/kids")
public class KidsController {
	
	//private static final Logger logger = LoggerFactory.getLogger(kidsController.class);
	
	@Autowired
	private DiaryBiz biz;
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/main")
	public String main() {
		
		return "kids/main";
	}
	
	@GetMapping("/puzzle")
	public String puzzle() {
		
		return "kids/puzzle";
	}
	
	@GetMapping("/onelevel")
	public String puzzle_onelevel() {
		
		return "kids/puzzle_1level";
	}
	
	@GetMapping("/twolevel")
	public String puzzle_twolevel() {
		
		return "kids/puzzle_2level";
	}
	
	@GetMapping("/diary")
	public String diary() {
		
		return "kids/diary";
	}
	
	@PostMapping("/insert")
	public String diaryInsert(DiaryDto dto) {
		
		if(biz.insert(dto)>0) {
			return "redirect:/kids/main";
		}else {
			return "redirect:/kids/diary";
		}
	}
	
	@GetMapping("/sticker")
	public String sticker() {
		
		return "/kids/sticker";
	}
	
	@GetMapping("/snow")
	public String snow() {
		
		return "kids/snow";
	}
	
	@ResponseBody
	@RequestMapping(value = {"selectDate"}, method = RequestMethod.POST)
	public String selectDate(HttpServletRequest request) {
		
		String userId = request.getParameter("userID");
		LocalDate now = LocalDate.now();
		
		String today = biz.selectDate(userId,now); 
		System.out.println("select: "+biz.selectDate(userId,now));
		
		return today;
	};
	
	
	@ResponseBody
	@RequestMapping(value = {"ImgSaveTest"}, method = RequestMethod.POST)
	public ModelMap ImgSaveTest(@RequestParam Map<Object, Object> param, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		ModelMap Map = new ModelMap();
		String binaryData = request.getParameter("imgSrc");
		String userId = request.getParameter("userID");
		FileOutputStream stream = null;
		
		try {
		System.out.println("binary file " + binaryData);
		if(binaryData == null || binaryData.trim().equals("")) {
			throw new Exception();
		}
		binaryData = binaryData.replaceAll("data:image/png;base64,","");
		byte[]file = Base64.decodeBase64(binaryData);
		String fileName = UUID.randomUUID().toString();
		
		stream = new FileOutputStream("C:\\image\\"+fileName+".png");
		String filePath = "C:\\image\\"+fileName+".png";
		param.put("filePath", filePath);
		biz.saveImg(param);
		System.out.println(filePath);
		System.out.println(userId);
		stream.write(file);
		stream.close();
		System.out.println("저장 완료");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("에러 발생");
		}finally {
			if(stream != null) {
				stream.close();
			}
		}
		Map.addAttribute("resultMap","");
		
		return Map;
	};
	
	//@PostMapping("/selectPath")
	public void select(String user_id,String userEmail) {
		
		System.out.println(user_id);
		biz.selectPath(user_id);
		
		String filePath = biz.selectPath(user_id);
		System.out.println(filePath);
		
		biz.sendMail(userEmail,filePath);
		
	}
	
	@ResponseBody
	@RequestMapping(value = {"sendEmail"}, method = RequestMethod.POST)
	public void sendMailWithFiles(@RequestParam Map<Object, Object> param, final HttpServletRequest request, final HttpServletResponse response) throws MessagingException, IOException {
		
		String path = request.getParameter("imgSrc");
		System.out.println(path);
		String userEmail = request.getParameter("userEmail");
		System.out.println(userEmail);
		MailHandler mailHandler = new MailHandler(mailSender);
		
		mailHandler.setFrom("jiyoun_908@naver.com");
		mailHandler.setTo(userEmail);
		mailHandler.setSubject("제목");
		
		String htmlContent = "<img src='data:image/png;base64,"+path+"'>";
		mailHandler.setText(htmlContent,true);
		//mailHandler.setInline("img1","classpath:resources/image/kids/img1.png");
		mailHandler.send();
	}
	
	
	
	
	
	
	
	
}
