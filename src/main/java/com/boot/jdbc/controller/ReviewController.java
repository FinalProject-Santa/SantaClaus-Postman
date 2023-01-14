package com.boot.jdbc.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
	@GetMapping("/reviewinsertform")
	public String rinsertform() {
		return "review/reviewInsertForm";
				
	}
	
	@RequestMapping("/reviewDetail/{review_no}")
	public String reviewDetail(Model model, @PathVariable int review_no) {
		
		//조회수 증가
		reviewbiz.reviewCountUpdate(review_no);

		
		
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
        //String fileUrl = "C:\\Users\\yg\\git\\SantaClaus-Postman\\src\\main\\resources\\static\\image\\uploadFiles\\";
 
        do { 
            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
            destinationFile = new File(uploadFileDir + destinationFileName); 
        } while (destinationFile.exists()); 
        
        destinationFile.getParentFile().mkdirs(); 
        files.transferTo(destinationFile); 
        
		reviewbiz.reviewInsert(reviewdto);
		
		 file.setReview_no(reviewdto.getReview_no());
         file.setRfileName(destinationFileName);
         file.setRfileOriName(sourceFileName);
         file.setRfileUrl(uploadFileDir);
         
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
		
		if(files.getOriginalFilename()!= null && !files.getOriginalFilename().equals("")) {
			String sourcefileName = files.getOriginalFilename(); 
			System.out.println(request.getParameter("rfileName"));
			System.out.println(files.getName());
			System.out.println(files.getOriginalFilename());
			
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
            
            System.out.println(request.getParameter("review_no"));
            System.out.println(destinationFileName);
            System.out.println(sourcefileName);
            System.out.println(uploadFileDir);
            
            file.setRfileName(destinationFileName);
            file.setRfileOriName(sourcefileName);
		}else {  // 새로운 파일이 등록되지 않았다면
			  // 기존 이미지를 그대로 사용
			System.out.println("testtest");
			  file.setRfileName(request.getParameter("rfileName"));
		}
			  
		 file.setReview_no(Integer.parseInt(request.getParameter("review_no")));
         
         file.setRfileUrl(uploadFileDir);
		reviewdto.setReview_title(request.getParameter("review_title"));
		reviewdto.setReview_content(request.getParameter("review_content"));
		reviewdto.setReview_best(Integer.parseInt(request.getParameter("review_best")));
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