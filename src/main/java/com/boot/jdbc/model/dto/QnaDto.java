package com.boot.jdbc.model.dto;

import java.util.Date;

public class QnaDto {
	private Integer qna_no;
	private String user_id;
	private String qna_type;
	private String qna_title;
	private Date qna_date;
	private String qna_content;
	
	
	public QnaDto(Integer qna_no, String user_id, String qna_type, String qna_title, Date qna_date, String qna_content) {
		super();
		this.qna_no = qna_no;
		this.user_id = user_id;
		this.qna_type = qna_type;
		this.qna_title = qna_title;
		this.qna_date = qna_date;
		this.qna_content = qna_content;
	}
	public Integer getQna_no() {
		return qna_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getQna_type() {
		return qna_type;
	}
	public String getQna_title() {
		return qna_title;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public String getQna_content() {
		return qna_content;
	}
	
	public void setQna_no(Integer qna_no) {
		this.qna_no = qna_no;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;

	}
	
	


}
