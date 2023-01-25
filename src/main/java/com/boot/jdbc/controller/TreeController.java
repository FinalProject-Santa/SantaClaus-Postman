package com.boot.jdbc.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.jdbc.model.biz.TreeBiz;
import com.boot.jdbc.model.dto.OrnaDto;

@Controller
@RequestMapping("/tree")
public class TreeController {
	
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
	
	@PostMapping("/treeOrder")
	public String treeorder(Model model, HttpServletRequest request) {
		
		List<OrnaDto> dtoList = new ArrayList<OrnaDto>();
		
		HashSet<String> set = new HashSet<String>();
		
		
		String[] ornameArray = request.getParameterValues("or_name");
		
		String myimg = request.getParameter("myimg");
		
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
		model.addAttribute("myimg", myimg);
		System.out.println(dtoList);
		return "tree/treeOrder";
	}
	
	
}