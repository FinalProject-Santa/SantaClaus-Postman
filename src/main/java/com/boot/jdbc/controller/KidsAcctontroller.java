package com.boot.jdbc.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.biz.KidsBiz;
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
	public String kidsSet(HttpServletRequest request, Model model) {
		
		//셀렉트해서 뿌리기
		model.addAttribute("list",kidsbiz.selectAll());
		
		//상단에 유저 이름 표시 코드
		session = request.getSession();
		String name = ((MemberDto) session.getAttribute("member")).getName();
		model.addAttribute("name",name);
		
		return "/kidsaccount/kidsSetting";
	}

	@GetMapping("/form")
	public String kidsForm() {
		return "/kidsaccount/kidsForm";
	}

	@GetMapping("/modify")
	public String kidsModify(Model model, HttpServletRequest request,KidsDto dto) {
		
		model.addAttribute("list",kidsbiz.selectAll());
		model.addAttribute("sticker",kidsbiz.sticker());
		int i = Integer.parseInt(request.getParameter("no"));
		request.setAttribute("no", i);
		 
		//kidsbiz.modify(dto);
		
		return "/kidsaccount/kidsModify";
	}

	
	@PostMapping("/ProfileModify")
	public String KidsModifyProfile(KidsDto dto, @RequestPart MultipartFile files,HttpServletRequest request) {
		kidsbiz.modify(dto);
		//kidsbiz.fileModify(dto);
		
		return "redirect:/kidsaccount/main";
	
	}
	
	
	@PostMapping("/AddProfile")
	public String kidsInsertProfile(KidsDto dto, @RequestPart MultipartFile files, HttpServletRequest request)throws IllegalStateException, IOException {

		  session = request.getSession();
		  String user_id = ((MemberDto) session.getAttribute("member")).getUser_id();
		  dto.setUser_id(user_id);
	
		  
		  KidFileDto file = new KidFileDto();
		  
		  String uploadPath ="C:/Users/Home/git/SantaClaus-Postman/src/main/resources/static/files/";
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
		  
		  if(!files.isEmpty()){
		  dto.setKids_thumbnail(destinationFileName);}
		  
		  kidsbiz.add(dto); //파일을 DB에 넣기 전에 키즈DB가 먼저 완성이 되어있어야 한다 -> 부모테이블이라서
		  
		  
		  file.setKids_no(dto.getKids_no()); 
		  if(!files.isEmpty()) {
		  file.setFile_name(destinationFileName);
		  file.setFile_oname(sourceFileName); 
		  file.setFile_path(uploadPath);}
		  	 
		  kidsbiz.addFile(file);
		  
		  session.setAttribute("kids", dto);
		  
		return "redirect:/kidsaccount/main";
	}
	
	
	@PostMapping("/AddSantamail")
	public String kidsInsertSantamail(KidsDto dto, @RequestPart MultipartFile files, HttpServletRequest request) throws IllegalStateException, IOException {
			
		  session = request.getSession();
		  String user_id = ((MemberDto) session.getAttribute("member")).getUser_id();
		  dto.setUser_id(user_id);
		 
		  int kids_no = dto.getKids_no();
		  dto.setKids_no(kids_no);
		  System.out.println(dto); 
		  
		  KidFileDto file = new KidFileDto();
		  
		  String uploadPath ="C:/Users/USER/git/SantaClaus-Postman/src/main/resources/static/files/";
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
		  
		  if(!files.isEmpty()){
		  dto.setKids_letter_img(destinationFileName);}
		  System.out.println(dto);
		  
		  kidsbiz.addmail(dto);
		  
		  
		  file.setKids_no(dto.getKids_no()); 
		  if(!files.isEmpty()) {
		  file.setFile_name(destinationFileName);
		  file.setFile_oname(sourceFileName); 
		  file.setFile_path(uploadPath);}
		  	 
		  kidsbiz.addFile(file);
		
		
		return "redirect:/kidsaccount/kidsModify";
	}
	
	
	@GetMapping("/profileDelete/{kids_no}")
	private String profileDelete(KidsDto dto, KidFileDto file, Integer kids_no) throws Exception {
		kidsbiz.delete(file);
		kidsbiz.delete(dto);
		
	return "redirect:/kidsaccount/main";
	}
	
}
