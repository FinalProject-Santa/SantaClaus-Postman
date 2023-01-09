package com.boot.jdbc.controller;


import java.io.File;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.biz.ArticleBiz;
import com.boot.jdbc.model.biz.QnaBiz;
import com.boot.jdbc.model.dto.QnaDto;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	//String uploadPath = "C:\\Users\\Home\\git\\SantaClaus-Postman\\src\\main\\resources\\static\\files";
	
	private static Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private ArticleBiz articlebiz;
	@Autowired
	private QnaBiz qnabiz;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	@GetMapping("/faq")
	public String faq() {
		return "customer/faq";
	}
	
	@GetMapping("/notice")
	public String selectList(Model model) {
		model.addAttribute("list", articlebiz.selectList());
		return "customer/notice";
	}
	
	@GetMapping("/notice_detail")
	public String selectOne(Model model, int no) {
		model.addAttribute("dto",articlebiz.selectOne(no));
		return "customer/notice_detail";
	}
	
	
	@GetMapping("/floatingMenu")
	public String floatingMenu() {
		return "customer/floatingMenu";
	}

	
	//QNA
	
	@GetMapping("/qnalist")
	public String qnaList(Model model) {
		model.addAttribute("qnalist",qnabiz.selectList());
		return "customer/qnalist";
	}

	//에러나면 파라미터 확인
	@GetMapping("/qnainsertform")
	public String qna(Model model) {
		model.addAttribute(new QnaDto());
		return "customer/qnainsert";
	}
	
	@PostMapping("/qnainsert")
	public String insert(QnaDto dto, Model model) throws Exception{
		//보내진 파일 file 변수에 받아주기
		MultipartFile file = dto.getQna_file();
		model.addAttribute("dto", dto);
		
		logger.info("OriginalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType" + file.getContentType());
		
		//uploadFile 메소드 이용해서 중복되지않는 파일이름과, 바인딩, 지정된 폴더로 카피까지 처리
		String createdFileName = uploadFile(file.getOriginalFilename(),file.getBytes());
		dto.setQna_filepath(createdFileName);
		
			if(qnabiz.insert(dto)>0) {
				return "redirect:/customer/qnalist";
			}else {
				return "redirect:/customer/qnainsert";
			}
		} 
		
	

	@GetMapping("/qnadetail")
	public String qnadetail(Model model, Integer qna_no) {
		model.addAttribute("dto",qnabiz.selectOne(qna_no));
		return "customer/qnadetail";
				
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		//중복되지 않는 난수 구하기
		UUID uid = UUID.randomUUID();
		//업로드 된 파일명에 uid붙여서 중복되지 않게 새로운 이름 만들어주기
		String createdFileName = uid.toString() + "_" + originalName;
		//File(빈파일)타입 target에 에 업로드될 디렉토리와 저장된 파일명 저장해서
		File target = new File(uploadPath,createdFileName);
		//fileDate로 바인딩 한 후, 지정된 폴더로 카피하기 ->다운로드 요청이 오면 이 정보로 저장된 파일을 읽는다.
		FileCopyUtils.copy(fileData, target);
		return createdFileName;
		}
	
}


	
	




	
			
	

		
