package com.boot.jdbc.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.boot.jdbc.model.biz.ReviewBiz;
import com.boot.jdbc.model.dto.ReviewDto;
import com.boot.jdbc.model.dto.rFileDto;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewBiz reviewbiz;
	
	@GetMapping("/reviewList")
	public String reviewList(Model model) {
		model.addAttribute("reviewlist", reviewbiz.reviewList());
			
		return "review/reviewList";
	}
	
	@GetMapping("/reviewinsertform")
	public String rinsertform() {
		return "review/reviewInsertForm";
				
	}
	
	@RequestMapping("/reviewDetail/{review_no}")
	public String reviewDetail(Model model, @PathVariable int review_no) {
		model.addAttribute("reviewdetail", reviewbiz.reviewDetail(review_no));
		model.addAttribute("files", reviewbiz.rfileDetail(review_no));
		return "review/reviewDetail";
	}
	
	@RequestMapping(value="/reviewinsert", method=RequestMethod.POST)
	public String reviewInsert(ReviewDto reviewdto, @RequestPart MultipartFile files) throws Exception{
        
		rFileDto file = new rFileDto();
		
		String sourceFileName = files.getOriginalFilename(); 
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
        File destinationFile; 
        String destinationFileName;
        String fileUrl = "C:\\Users\\yg\\git\\SantaClaus-Postman\\src\\main\\resources\\static\\image\\uploadFiles\\";
 
        
        do { 
            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
            destinationFile = new File(fileUrl + destinationFileName); 
        } while (destinationFile.exists()); 
        
        destinationFile.getParentFile().mkdirs(); 
        files.transferTo(destinationFile); 
        
		System.out.println(reviewdto.getReview_no());
		reviewbiz.reviewInsert(reviewdto);
		
		 file.setReview_no(reviewdto.getReview_no());
         file.setRfileName(destinationFileName);
         file.setRfileOriName(sourceFileName);
         file.setRfileUrl(fileUrl);
         
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
	        
	        return "review/reviewUpdateForm";
	    }
	
	@RequestMapping("/reviewUpdate")
    private String boardUpdate(HttpServletRequest request) throws Exception{
		ReviewDto reviewdto = new ReviewDto();
		reviewdto.setReview_title(request.getParameter("review_title"));
		reviewdto.setReview_content(request.getParameter("review_content"));
		reviewdto.setReview_best(Integer.parseInt(request.getParameter("review_best")));
        reviewdto.setReview_no(Integer.parseInt(request.getParameter("review_no")));
        
        reviewbiz.reviewUpdate(reviewdto);
        
        return "redirect:/review/reviewDetail/"+request.getParameter("review_no"); 
    }

}