package com.boot.jdbc.controller;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.jdbc.model.biz.DiaryBiz;
import com.boot.jdbc.model.dto.DiaryDto;

@Controller
@RequestMapping("/kids")
public class kidsController {
	
	private static final Logger logger = LoggerFactory.getLogger(kidsController.class);
	
	@Autowired
	private DiaryBiz biz;
	
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
	@RequestMapping(value = {"ImgSaveTest"}, method = RequestMethod.POST)
	public ModelMap ImgSaveTest(@RequestParam HashMap<Object, Object> param, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		ModelMap map = new ModelMap();
		
		String binaryData = request.getParameter("imgSrc");
		FileOutputStream stream = null;
		try {
		System.out.println("binary file " + binaryData);
		if(binaryData == null || binaryData.trim().equals("")) {
			throw new Exception();
		}
		binaryData = binaryData.replaceAll("data:image/png;base64,","");
		byte[]file = Base64.decodeBase64(binaryData);
		String fileName = UUID.randomUUID().toString();
		
		stream = new FileOutputStream("C:\\Users\\82105\\git\\SantaClaus-Postman\\src\\main\\resources\\static\\image\\kids\\"+fileName+".png");
		System.out.println("C:\\Users\\82105\\git\\SantaClaus-Postman\\src\\main\\resources\\static\\image\\kids\\"+fileName+".png"); //변경 C:/image/
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
		map.addAttribute("resultMap","");
		return map;
	};
	
	
	
	
	
	
	
	
	
	
	
	
}
