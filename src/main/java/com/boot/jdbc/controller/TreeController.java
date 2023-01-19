package com.boot.jdbc.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@PostMapping("/treeOrder")
	public String treeorder(Model model, HttpServletRequest request) {
		List<OrnaDto> dtoList = new ArrayList<OrnaDto>();
		
		HashSet<String> set = new HashSet<String>();
		
		
		String[] ornameArray = request.getParameterValues("or_name");
		
	
		
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
		return "tree/test";
	}
	
	
}