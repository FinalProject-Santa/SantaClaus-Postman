package com.boot.jdbc.controller;


import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.biz.ArticleBiz;
import com.boot.jdbc.model.biz.QnaBiz;
import com.boot.jdbc.model.dto.QnaDto;
import com.boot.jdbc.model.dto.QnaFileDto;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	

	HttpSession session;
	//private static Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private ArticleBiz articlebiz;
	@Autowired
	private QnaBiz qnabiz;
	
//	@Value("${upload.path}")
//	private String uploadPath;
	
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
	public String Insert(QnaDto dto, @RequestPart MultipartFile files) throws Exception{
		
		QnaFileDto file = new QnaFileDto();
		
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
        
		qnabiz.insert(dto);
		System.out.println(dto.getQna_no());
		
		 file.setQna_no(dto.getQna_no());
         file.setFile_name(destinationFileName);
         file.setFile_oname(sourceFileName);
         file.setFile_path(uploadPath);
         
         qnabiz.insertFile(file); 
         return "redirect:/customer/qnalist";
    }
	
	

	@GetMapping("/qnadetail")
	public String qnadetail(Model model,Integer qna_no) {
		model.addAttribute("dto",qnabiz.selectOne(qna_no));
		model.addAttribute("files",qnabiz.selectFile(qna_no)); // 파일경로
		return "customer/qnadetail";
				
	}
	
	//답글달기 눌러서 qnaReplyform으로 url 들어오면 세션에 원글 번호를 origin_no로 저장해서 qnaReply 리턴
	@GetMapping("/qnaReply")
	public String qnaReply(HttpServletRequest request, String origin_no){
		origin_no = request.getParameter("qna_no"); //답글에 대한 부모글 번호를 저장
		System.out.println(origin_no);
		//session = request.getSession(); //세션생성
		//session.setAttribute("origin_no",origin_no);//origin_no = qna_no로 세션에 저장
		return "/customer/qnaReply";
		
	}
	
	//답변내용 form 데이터에서 qnainsertReply로 다시 요청.
	@PostMapping("/qnainsertReply")
	public String qnainsertReply(HttpServletRequest request, Integer origin_no, QnaDto dto){
		session = request.getSession();
		origin_no = (Integer) session.getAttribute("origin_no");
		qnabiz.insertReply(dto);
		return "/customer/qnalist";
	}
	
}
	
	
	
	



	
	




	
			
	

		
