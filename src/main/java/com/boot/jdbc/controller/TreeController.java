package com.boot.jdbc.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.jdbc.model.biz.OrderBiz;
import com.boot.jdbc.model.biz.PointBiz;
import com.boot.jdbc.model.biz.TreeBiz;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OrnaDto;
import com.boot.jdbc.model.dto.PointDto;
import com.boot.jdbc.model.dto.TreeOrderDto;

@Controller
@RequestMapping("/tree")
public class TreeController {

	List<OrnaDto> dtoList = new ArrayList<OrnaDto>();
	String user_id;
	int myPoint;
	// 트리꾸민 이미지
	String myimg;
	
	@Autowired
	private	OrderBiz orderBiz;
	@Autowired
	private PointBiz pointBiz;
	@Autowired
	private TreeBiz treeBiz;
	
	
	
	@GetMapping("/decotree")
	public String decotree() {	
		return "tree/decotree";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = {"TreeSave"}, method = RequestMethod.POST) public
	 * String TreeSave(Model model, @RequestParam("myImg") String myImg) throws
	 * Exception { System.out.println("통신중f"); System.out.println(myImg);
	 * model.addAttribute("myimg",myImg); System.out.println(model);
	 * System.out.println("f"); // String binarydata =
	 * request.getParameter("myImg"); //
	 * System.out.println(request.getParameter("myImg")); //
	 * System.out.println(request.getAttribute("myImg")); //
	 * System.out.println(binarydata); return "tree/treeOrder" ;
	 * 
	 * }
	 */
	
	@PostMapping("/treeOrderForm")
	public String treeorderform(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
	    
		user_id = ((MemberDto)session.getAttribute("member")).getUser_id();
		myPoint = pointBiz.pointAll(user_id);
		System.out.println(myPoint);
		// 회원 정보 가져오기
		MemberDto memberDto = orderBiz.memberInfo(user_id);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("myPoint", myPoint);
		
		
		HashSet<String> set = new HashSet<String>();
		
		
		String[] ornameArray = request.getParameterValues("or_name");
		
		myimg = request.getParameter("myimg");
		
		for(int i=0; i<ornameArray.length; i++) {
			set.add(ornameArray[i]);
		}
		
	
		
		Iterator<String> iter = set.iterator();
		while(iter.hasNext()) {
			dtoList.add(treeBiz.selectOne(iter.next()));
		}
		
		
		
//		for(int i=0; i<ornameArray.length; i++) {
//			
//			dtoList.add(treeBiz.selectOne(ornameArray[i]));
//		}
		model.addAttribute("dtolist",dtoList);
		
		System.out.println(dtoList);
		return "tree/treeOrderForm";
	}
	
	@PostMapping("/treeOrder")
	public String treeOrder(Model model, TreeOrderDto orderDto) {
		
		String optionNames="";
		model.addAttribute("dtolist",dtoList);
		orderDto.setUser_id(user_id);
		
		
		for(int i=0; i<dtoList.size(); i++) {
			optionNames += dtoList.get(i).getOr_name() + ",";
		}
		optionNames = optionNames.substring(0, optionNames.length()-1);
		orderDto.setOr_name(optionNames);
		
		// 결제 DB 데이터 추가
		orderBiz.treePayment(orderDto);
		
		// 포인트 DB 데이터 추가
		PointDto pointDto = new PointDto();
		pointDto.setOrder_no(orderDto.getOrder_no());
		pointDto.setUser_id(user_id);
		
		// 사용할 포인트가 있을 경우
		if(orderDto.getUse_point() != 0) {
			// 총 포인트 - 사용 포인트
			myPoint = myPoint - orderDto.getUse_point();
			
			// 사용 포인트 DB 데이터 추가
			pointDto.setPoint(orderDto.getUse_point());
			pointDto.setPoint_all(myPoint);
			pointDto.setPoint_content("포인트 사용");
			pointDto.setPoint_purpose("사용");
			pointBiz.insertPoint(pointDto);
		}
		
		// 적립 포인트 DB 데이터 추가
		pointDto.setPoint(orderDto.getSave_point());
		pointDto.setPoint_all(myPoint + orderDto.getSave_point());
		pointDto.setPoint_content("상품 구매");
		pointDto.setPoint_purpose("적립");		
		pointBiz.insertPoint(pointDto);
		model.addAttribute("myimg", myimg);
		model.addAttribute("dtolist", dtoList);
		model.addAttribute("orderDto",orderDto);
		
		return "/tree/treeOrder";
	}
	
}