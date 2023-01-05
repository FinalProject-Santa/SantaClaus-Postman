package com.boot.jdbc.model.dto;

import java.util.Date;

public class DiaryDto {
	private int diary_no;
	private String user_id;
	private int kids_no;
	private String diary_content;
	private Date write_date;
	private String phone;
	
	public DiaryDto() {
		super();
	}
	public DiaryDto(int diary_no, String user_id, int kids_no, String diary_content, Date write_date, String phone) {
		super();
		this.diary_no = diary_no;
		this.user_id = user_id;
		this.kids_no = kids_no;
		this.diary_content = diary_content;
		this.write_date = write_date;
		this.phone = phone;
	}
	public int getDiary_no() {
		return diary_no;
	}
	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getKids_no() {
		return kids_no;
	}
	public void setKids_no(int kids_no) {
		this.kids_no = kids_no;
	}
	public String getDiary_content() {
		return diary_content;
	}
	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}

