package com.boot.jdbc.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.biz.KidsBiz;
import com.boot.jdbc.model.biz.MemberBiz;
import com.boot.jdbc.model.dto.KidFileDto;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;

@Controller
@RequestMapping("/kidsaccount")
public class KidsAcctontroller {
	
	HttpSession session;
	
	@Autowired
	private KidsBiz kidsbiz;
	
	@GetMapping("/main")
		public String kidsSet() {
		return "/kidsaccount/kidsSetting";
	}
		
	@GetMapping("/form")
	public String kidsForm() {
		return "/kidsaccount/kidsForm";
	}
	
	@GetMapping("/modify")
	public String kidsModify() {
		return "/kidsaccount/kidsModify";
	}
	
	
	@PostMapping("/AddProfile")
	public String kidsInsertProfile(KidsDto dto, String user_id, @RequestPart MultipartFile files, HttpServletRequest request)throws IllegalStateException, IOException {	
	
		user_id = (String) session.getAttribute("member");
		
		System.out.println("아이디:" + "member");
		
		dto.setUser_id(user_id);
		
		
		
		
		
		KidFileDto file = new KidFileDto();
		
		String uploadPath = "C:/Users/Home/git/SantaClaus-Postman/src/main/resources/static/files/";
		String sourceFileName = files.getOriginalFilename(); 
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
        File destinationFile; 
        String destinationFileName;
		
        
        do { 
            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
            destinationFile = new File(uploadPath + destinationFileName); 
        } while (destinationFile.exists()); 
        
        destinationFile.getParentFile().mkdirs(); 
        files.transferTo(destinationFile); 
        
		
		 file.setKids_no(dto.getKids_no());
         file.setFile_name(destinationFileName);
         file.setFile_oname(sourceFileName);
         file.setFile_path(uploadPath);
        
        
		kidsbiz.add(dto);
		kidsbiz.addFile(file);
		
		return "redirect:/kidsaccount/main";
	}

}
