package com.boot.jdbc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.boot.jdbc.model.biz.CartBiz;
import com.boot.jdbc.model.biz.MemberBiz;
import com.boot.jdbc.model.biz.OrderBiz;
import com.boot.jdbc.model.biz.OrderInfoBiz;
import com.boot.jdbc.model.biz.PointBiz;
import com.boot.jdbc.model.dto.CartDto;
import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OptionDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.PageMaker;
import com.boot.jdbc.model.dto.PointDto;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MemberBiz memberBiz;

	@Value("${file.upload.directory}")
	String fileUrl;
	
	//장바구니 페이지 이동
	@Autowired
	private CartBiz cartBiz;
	
	//주문 biz
	@Autowired
	private OrderInfoBiz orderInfoBiz;
	
	List<CartDto> cartDtoList = new ArrayList<CartDto>();
	String user_id;
		
	//회원정보 수정
	@PostMapping("/main")
	public String myinfoUpdate(Model model, MemberDto dto,HttpSession session1, String user_id, HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {
		
		session1.setAttribute("member", dto);
		
		HttpSession session = request.getSession();
		MemberDto memberdto = ((MemberDto)session.getAttribute("member"));
		
		if(files.getOriginalFilename()!= null && !files.getOriginalFilename().equals("")) {
			String sourcefileName = files.getOriginalFilename(); 
			
			new File(fileUrl + request.getParameter("rfileName")).delete();
			// new File(uploadPath + request.getParameter("rfileName")).renameTo(new File(uploadPath + "test.jpg"));
			
            String sourcefileNameExtension = FilenameUtils.getExtension(sourcefileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourcefileNameExtension; 
                destinationFile = new File(fileUrl + destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile);
            
            dto.setRfileName(destinationFileName);
            dto.setRfileOriName(sourcefileName);
		}else {  // 새로운 파일이 등록되지 않았다면
			  // 기존 이미지를 그대로 사용
			dto.setRfileName(request.getParameter("rfileName"));
		}
			  
		dto.setUser_id(request.getParameter("user_id"));
         
		dto.setRfileUrl(fileUrl);
		dto.setPassword(request.getParameter("password"));
		dto.setName(request.getParameter("name"));
		dto.setPost_code(request.getParameter("post_code"));
		dto.setDefault_addr(request.getParameter("default_addr"));
		dto.setDetail_addr(request.getParameter("detail_addr"));
		dto.setPhone(request.getParameter("phone"));
		dto.setEmail(request.getParameter("email"));
		dto.setPhone(request.getParameter("phone"));
        
		memberBiz.myinfoUpdate(dto);
		model.addAttribute("memberdto",memberBiz.infoUpdateform(user_id));
		return "main/main";
	}
	@GetMapping("/main")
	public String mainpage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto memberdto = ((MemberDto) session.getAttribute("member"));
		String user_id = memberdto.getUser_id();
		System.out.println("zzzzzzzzzzzzzzzzz" +  user_id);
		System.out.println("test1 : " + memberBiz.infoUpdateform(user_id).getRfileName());
		System.out.println("test2 : " + memberBiz.infoUpdateform(user_id).getRfileUrl());
		model.addAttribute("memberdto", memberBiz.infoUpdateform(user_id));
		return "mypage/mypage";
	}

	// 회원 정보 수정 페이지
	@GetMapping("/infoUpdateform")
	public String infoUpdateForm(Model model,HttpSession session1, MemberDto memberDto, String user_id, HttpServletRequest request) {
//		session1.setAttribute("member", memberDto);
		HttpSession session = request.getSession();
		MemberDto memberdto = ((MemberDto) session.getAttribute("member"));
		if (memberdto != null) {
			model.addAttribute("memberdto", memberBiz.infoUpdateform(user_id));
			model.addAttribute("memberdto", memberdto);
			return "mypage/myinfoUpdate";
		} else {
			return "redirect:/main/loginForm";
		}
	}

	@GetMapping("/order")
	public String order(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_id = ((MemberDto) session.getAttribute("member")).getUser_id();
		List<OrderDto> orderDtoList =  orderInfoBiz.orderDtoList(user_id);
//		model.addAttribute("orderlist", orderBiz.orderList());
		return "mypage/myorder";
	}
//	@RequestMapping("/selectOrder")
//	public String selectOrder(Model model) {
//		model.addAttribute("orderlist",orderBiz.selectOrder());
//		return "mypage/myorder";
//	}

	// 마이포인트 페이지
	@Autowired
	private PointBiz pointBiz;

	@RequestMapping(value = "/point")
	public ModelAndView point(Criteria cri, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/mypage/mypoint");

		HttpSession session = request.getSession();
		MemberDto memberDto = ((MemberDto)session.getAttribute("member"));
//		PointDto pointDto = pointBiz.selectpoint(user_id);
//		model.addAttribute("list", pointDto );
		System.out.println(memberDto.getUser_id());

		mav.addObject("mypoint", pointBiz.pointAll(memberDto.getUser_id()));
		System.out.println("페이지:"+cri.getPageStart());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pointBiz.countBoardListTotal());
		List<PointDto> list = pointBiz.selectList(memberDto, cri);
//		model.addAttribute("list",list);

		System.out.println(list);

		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);

		return mav;
	}
	
	
	@GetMapping("/mycart")
	public String mycart(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto memberDto = ((MemberDto)session.getAttribute("member"));
		user_id = memberDto.getUser_id();
		
		cartDtoList = cartBiz.cartList(user_id);
		
		List<LetterDto> cart_letterList = new ArrayList<LetterDto>();
		List<OptionDto> cart_optionList = new ArrayList<OptionDto>();
		LetterDto cart_letterDto = new LetterDto();
		OptionDto cart_optionDto = new OptionDto();
		
		String cart_letterNames = "";
		String cart_optionNames = "";
		
		for(int i=0; i<cartDtoList.size(); i++){
//			cart_letterDto.setLetter_name(cartDtoList.get(i).getLetter_name() + ",");
//			cart_optionDto.setOption_name(cartDtoList.get(i).getOption_name() + "/");
//			cart_optionList.add(cart_optionDto);
			
			cart_letterNames += cartDtoList.get(i).getLetter_name() + ",";
			
			if(cartDtoList.get(i).getOption_name()!=null) {
				cart_optionNames += cartDtoList.get(i).getOption_name() + "/";
			}
		}
		System.out.println("장바구니 엽서 : " + cart_letterNames);
		System.out.println("장바구니 옵션 : " + cart_optionNames);
		
		String[] letterNameArr =  cart_letterNames.split(",");
		for(int i=0; i<letterNameArr.length; i++) {
			// 엽서 테이블에서 엽서 상품명을 기준으로 데이터 가져오기
			cart_letterDto = cartBiz.letterInfo(letterNameArr[i]);
			cart_letterList.add(cart_letterDto);
		}
		
		if(cart_optionNames.length()>2) {
			
		String[] optionNameArr =  cart_optionNames.split("/");
		String[] arr = null;
		String optionName = "";
		String[] quantity;
		System.out.println(cart_optionNames);
			
		
			for(int i=0; i<optionNameArr.length; i++) {
				arr = optionNameArr[i].split(",");
				if(arr.length>0) {
					for(int j=0; j<arr.length; j++) {
						quantity = arr[j].split("-");
						System.out.println("옵션 테이블에서 가져올 옵션상품명 : " + quantity[0]);
						System.out.println("옵션 테이블에서 가져올 옵션 수량 : " + quantity[1]);
						// 옵션 테이블에서 옵션 상품명을 기준으로 데이터 가져오기
						cart_optionDto = cartBiz.optionInfo(quantity[0]);
						cart_optionDto.setoption_quantity(Integer.parseInt(quantity[1]));
						cart_optionList.add(cart_optionDto);
					}
					model.addAttribute("optionList", cart_optionList);
				}
			}
		}
		
		model.addAttribute("letterList", cart_letterList);
		
		System.out.println("끝");
		return "/mypage/mycart";
	}
	
	
	
	
	
	
	
	

}
