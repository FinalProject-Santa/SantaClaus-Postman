package com.boot.jdbc.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.boot.jdbc.model.biz.ReviewBiz;
import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.PageMaker;
import com.boot.jdbc.model.dto.ReviewDto;
import com.boot.jdbc.model.dto.rFileDto;
import com.boot.jdbc.model.dto.MemberDto;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewBiz reviewbiz;
	
	@Value("${file.upload.directory}")
	String uploadFileDir;
	
	@RequestMapping(value = "/reviewList")
	public ModelAndView openReviewList(Criteria cri) throws Exception {
		
		ModelAndView mav = new ModelAndView("/review/reviewList");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewbiz.countBoardListTotal());
		
		System.out.println(reviewbiz.countBoardListTotal());
		
		List<Map<String,Object>> list = reviewbiz.reviewList(cri); 
		
		System.out.println(list);
		System.out.println(pageMaker);
		
		mav.addObject("list", list);
		
		mav.addObject("pageMaker",pageMaker);
		
		return mav;
	}
	
	
	@RequestMapping("/reviewDetail/{review_no}")
	public String reviewDetail(Model model, @PathVariable int review_no) {
		
		//조회수 증가
		reviewbiz.reviewCountUpdate(review_no);
		
		int next = reviewbiz.boardNextNo(review_no);
		int prev = reviewbiz.boardPrevNo(review_no);
		System.out.println(prev);
		model.addAttribute("reviewdetail", reviewbiz.reviewDetail(review_no));
		model.addAttribute("files", reviewbiz.rfileDetail(review_no));
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		
		return "review/reviewDetail";
	}

	@GetMapping("/reviewinsertform")
	public String rinsertform() {

		return "review/reviewInsertForm";
		
	}
	
	@RequestMapping(value="/reviewinsert", method=RequestMethod.POST)
	public String reviewInsert(ReviewDto reviewdto, @RequestPart MultipartFile files, HttpServletRequest request) throws Exception{
        
		// 세션에 담긴 값 꺼내기
		HttpSession session = request.getSession();
		String user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		reviewdto.setUser_id(user_id);
		
		rFileDto file = new rFileDto();
		
		String sourceFileName = files.getOriginalFilename(); 
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
        File destinationFile; 
        String destinationFileName;
        //String fileUrl = "C:\\Users\\yg\\git\\SantaClaus-Postman\\src\\main\\resources\\static\\image\\uploadFiles\\";
 
        do { 
            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
            destinationFile = new File(uploadFileDir + destinationFileName); 
        } while (destinationFile.exists()); 
        
        destinationFile.getParentFile().mkdirs(); 
        files.transferTo(destinationFile); 
        
        reviewdto.setRimg(destinationFileName);
		reviewbiz.reviewInsert(reviewdto);
		
		 file.setReview_no(reviewdto.getReview_no());
         file.setRfile_name(destinationFileName);
         file.setRfile_oriname(sourceFileName);
         file.setRfile_url(uploadFileDir);
         reviewbiz.fileInsert(file); //file insert
         return "redirect:/review/reviewList";
    }
	
//	@RequestMapping(value="/reviewinsert", method=RequestMethod.POST)
//	public String reviewInsert(HttpServletRequest request) throws Exception{
//        
//        ReviewDto reviewdto = new ReviewDto();
//        
//        reviewdto.setUser_id(request.getParameter("user_id"));
//        reviewdto.setReview_title(request.getParameter("review_title"));
//        reviewdto.setReview_best(Integer.parseInt(request.getParameter("review_best")));
//        reviewdto.setReview_content(request.getParameter("review_content"));
//        reviewdto.setReview_count(Integer.parseInt(request.getParameter("review_count")));
//        
//		reviewbiz.reviewInsert(reviewdto);
//        return "redirect:/reviewList";
//    }
//	 review_no;
//	 user_id;
//	 review_title;
//	 review_best;
//	 review_content;
//	 review_count;
//	 review_date;
	
	 @RequestMapping("/reviewUpdate/{review_no}") //게시글 수정폼 호출  
	    private String boardUpdateForm(@PathVariable int review_no, Model model) throws Exception{
	        
	        model.addAttribute("reviewdetail", reviewbiz.reviewDetail(review_no));
	        model.addAttribute("rfiles", reviewbiz.rfileDetail(review_no));
	        return "review/reviewUpdateForm";
	    }
	
	@RequestMapping(value="/reviewUpdate", method=RequestMethod.POST)
    private String boardUpdate(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
		rFileDto file = new rFileDto();
		ReviewDto reviewdto = new ReviewDto();
		String uploadPath = "C:\\Users\\yg\\git\\SantaClaus-Postman\\src\\main\\resources\\static\\image\\uploadFiles\\";
		
		// 세션에 담긴 값 꺼내기
		HttpSession session = request.getSession();
		String user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		reviewdto.setUser_id(user_id);
		
		String sourcefileName = files.getOriginalFilename(); 
		String rimg = request.getParameter("rfile_name");
		// 사진이 원래 있던 게시글에서 사진을 수정할 때
		if(files.getOriginalFilename()!= null && !files.getOriginalFilename().equals("")) {
	
			new File(uploadPath + request.getParameter("rfileName")).delete();
			// new File(uploadPath + request.getParameter("rfileName")).renameTo(new File(uploadPath + "test.jpg"));
			
			
            String sourcefileNameExtension = FilenameUtils.getExtension(sourcefileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourcefileNameExtension; 
                destinationFile = new File(uploadFileDir + destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile);
            
            reviewdto.setRimg(destinationFileName);
            file.setRfile_oriname(sourcefileName);
            file.setRfile_name(destinationFileName);
		}else {  // 새로운 파일이 등록되지 않았다면
			  // 기존 이미지를 그대로 사용
			System.out.println("testtest");
			  file.setRfile_name(request.getParameter("rfile_name"));
			  file.setRfile_oriname(sourcefileName);
			  reviewdto.setRimg(rimg);
		}
		
		file.setReview_no(Integer.parseInt(request.getParameter("review_no")));
		reviewdto.setReview_title(request.getParameter("review_title"));
		reviewdto.setReview_content(request.getParameter("review_content"));
		reviewdto.setReview_best(Double.parseDouble(request.getParameter("review_best")));
        reviewdto.setReview_no(Integer.parseInt(request.getParameter("review_no")));
        
        
        reviewbiz.reviewUpdate(reviewdto);
        
        reviewbiz.rfileUpdate(file);
        
        
        return "redirect:/review/reviewDetail/"+request.getParameter("review_no"); 
    
}	
	
	@RequestMapping("/reviewDelete/{review_no}")
	private String boardDelete(@PathVariable int review_no) throws Exception {
		reviewbiz.reviewDelete(review_no);
		reviewbiz.rfileDelete(review_no);
	return "redirect:/review/reviewList";
	}
}