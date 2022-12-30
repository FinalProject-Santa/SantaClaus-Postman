package com.boot.jdbc.model.dto;

import java.util.Date;

public class ArticleDto {
	private int no;
	private String writer;
	private String title;
	private String content;	
	private Date regdate;
	
	public ArticleDto(int no, String writer, String title, String content, Date regdate) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.regdate = regdate;
		this.content = content;
		
	}

	public int getNo() {
		return no;
	}

	public String getWriter() {
		return writer;
	}

	public String getTitle() {
		return title;
	}
	
	public String getContent() {
		return content;
	}
	
	public Date getRegdate() {
		return regdate;
	}



}
