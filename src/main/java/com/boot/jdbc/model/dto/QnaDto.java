package com.boot.jdbc.model.dto;

import java.util.Date;

public class QnaDto {
	private int no;
	private String category;
	private String title;
	private Date regdate;
	private Boolean reply;
	
	public QnaDto(int no, String category, String title, Date regdate, Boolean reply) {
		super();
		this.no = no;
		this.category = category;
		this.title = title;
		this.regdate = regdate;
		this.reply = reply;
	}

	public int getNo() {
		return no;
	}

	public String getCategory() {
		return category;
	}

	public String getTitle() {
		return title;
	}

	public Date getRegdate() {
		return regdate;
	}

	public Boolean getReply() {
		return reply;
	}
	
	


}
