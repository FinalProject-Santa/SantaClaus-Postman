package com.boot.jdbc.controller;


import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.biz.ArticleBiz;
import com.boot.jdbc.model.biz.QnaBiz;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.QnaDto;
import com.boot.jdbc.model.dto.QnaFileDto;



@Controller
@RequestMapping("/customer")
public class CustomerController {
	

	HttpSession session;
	int origin_no;
	String qna_type;
	String secret;

	@Autowired
	private ArticleBiz articlebiz;
	@Autowired
	private QnaBiz qnabiz;
	
	@Value("${file.upload.directory}")
	String uploadFileDir;
	
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
	public String qnaList(Model model, HttpServletRequest request) {
	
		session = request.getSession();
		String user_id = ((MemberDto) session.getAttribute("member")).getUser_id();
		
		model.addAttribute("user_id",user_id);
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
	public String Insert(QnaDto dto, @RequestPart MultipartFile files,HttpServletRequest request) throws Exception{
		
		session = request.getSession();
		String user_id = ((MemberDto) session.getAttribute("member")).getUser_id();
		dto.setUser_id(user_id);
		
		
		QnaFileDto file = new QnaFileDto();
		
		//String uploadPath = "C:/Users/Home/git/SantaClaus-Postman/src/main/resources/static/files/";
		String sourceFileName = files.getOriginalFilename(); 
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
        File destinationFile; 
        String destinationFileName;
        
        
        
        do { 
            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
            destinationFile = new File(uploadFileDir + destinationFileName); 
        } while (destinationFile.exists()); 
        
        destinationFile.getParentFile().mkdirs(); 
        files.transferTo(destinationFile); 
        
		 qnabiz.insert(dto);
		
		 if(!files.isEmpty()) {
		 file.setQna_no(dto.getQna_no());
         file.setFile_name(destinationFileName);
         file.setFile_oname(sourceFileName);
         file.setFile_path(uploadFileDir);
         qnabiz.insertFile(file); 
		 }
         
         return "redirect:/customer/qnalist";
    }
	

	@GetMapping("/qnadetail")
	public String qnadetail(Model model,Integer qna_no) {
		
		String user_id = ((MemberDto) session.getAttribute("member")).getUser_id();
		model.addAttribute("user_id",user_id);
		model.addAttribute("dto",qnabiz.selectOne(qna_no)); //쿼리문 실행한 결과를 "dto"에 담는다
		model.addAttribute("files",qnabiz.selectFile(qna_no)); // 파일경로
		return "customer/qnadetail";
				
	}
	
	//답글달기 눌러서 qnaReplyform으로 url 들어오면 세션에 원글 번호를 origin_no로 저장해서 qnaReply 리턴
	@GetMapping("/qnaReply")
	public String qnaReply(HttpServletRequest request) {
		
		origin_no = Integer.parseInt(request.getParameter("qna_no"));
		qna_type = request.getParameter("qna_type");
		secret = request.getParameter("secret");
		
		session = request.getSession(); //세션생성
		session.setAttribute("origin_no",origin_no);//origin_no = qna_no로 세션에 저장
		session.setAttribute("qna_type",qna_type);  
		session.setAttribute("secret", secret);
		
		return "/customer/qnaReply";
		
	}
	
	//답변form에서 넘어와서 데이터에 입력하는 컨트롤러
	@PostMapping("/qnainsertReply")
	public String qnainsertReply(HttpServletRequest request, QnaDto dto) throws IOException{
		
		origin_no = (Integer)session.getAttribute("origin_no");
		qna_type = session.getAttribute("qna_type").toString();
		secret = session.getAttribute("secret").toString();

		//전달할 dto에 set한다.
		dto.setOrigin_no(origin_no);
		dto.setQna_type(qna_type);
		dto.setSecret(secret);

		qnabiz.insertReply(dto);
		
		return "redirect:/customer/qnalist";
	}
	
	@GetMapping("/qnaDelete/{qna_no}")
	public String qnaDelete(@PathVariable int qna_no) {
		qnabiz.deleteQnafile(qna_no);
		qnabiz.deleteQna(qna_no);
		return"redirect:/customer/qnalist";
	}
	
	@GetMapping("/qnaUpdateform")
	public String qnaUpdateform(int qna_no,HttpServletRequest request,Model model) {
		model.addAttribute("fileDto",qnabiz.selectFile(qna_no));
		model.addAttribute("dto",qnabiz.selectOne(qna_no));
		qna_no = Integer.parseInt(request.getParameter("qna_no"));
		return "/customer/qnaupdate";
	}
	
	
	@PostMapping("/qnaUpdate")
	public String qnaUpdate(String qna_title, String qna_content,String secret, int qna_no,@RequestPart MultipartFile files, HttpServletRequest request) throws IllegalStateException, IOException {
		qnabiz.updateQna(qna_title,qna_content,secret,qna_no);

		String sourceFileName = files.getOriginalFilename(); 
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
        File destinationFile; 
        String destinationFileName;
		
	
		QnaFileDto file = new QnaFileDto();

		//사진이 없었던 글에 사진넣기
        if(request.getParameter("file_name").isEmpty()){
        	
        	 do { 
 	            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
 	            destinationFile = new File(uploadFileDir + destinationFileName); 
 	        } while (destinationFile.exists()); 
 		  
 		  destinationFile.getParentFile().mkdirs(); 
 		  files.transferTo(destinationFile); 
        	
			 file.setQna_no(qna_no);
	         file.setFile_name(destinationFileName);
	         file.setFile_oname(sourceFileName);
	         file.setFile_path(uploadFileDir);
	         qnabiz.insertFile(file); 
		
	       //사진이 원래 있던 게시글에서 사진을 수정할때
		 }else if(files.getOriginalFilename()!= null && !files.getOriginalFilename().equals("")){
		  new File(uploadFileDir + request.getParameter("file_name")).delete();
		  System.out.println(request.getParameter("file_name"));
		
      	 do { 
	           destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
	           destinationFile = new File(uploadFileDir + destinationFileName); 
	        } while (destinationFile.exists()); 
		  
		  destinationFile.getParentFile().mkdirs(); 
		  files.transferTo(destinationFile); 
		  file.setQna_no(qna_no); 
		  file.setFile_name(destinationFileName);
		  file.setFile_oname(sourceFileName); 
		  file.setFile_path(uploadFileDir);
		  qnabiz.updateQnafile(file);
		  
		 }
		
         //사진 수정 안할때 원래 사진 유지
		  else { 
	      file.setFile_name(request.getParameter("file_name")); 
		   }
		 
		return "redirect:/customer/qnalist";
	}
	
	
}
	
	
	
	



	
	




	
			
	

		
