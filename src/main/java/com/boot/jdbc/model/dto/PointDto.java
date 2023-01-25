package com.boot.jdbc.model.dto;

import java.util.Date;

public class PointDto {
	private int point_no;
	private String order_no;
	private String user_id;
	private int point;
	private Date point_date;
	private String point_content;
	private String point_purpose;
	private int point_all;
	
	public PointDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PointDto(int point_no, String order_no, String user_id, int point, Date point_date, String point_content,
			String point_purpose, int point_all) {
		super();
		this.point_no = point_no;
		this.order_no = order_no;
		this.user_id = user_id;
		this.point = point;
		this.point_date = point_date;
		this.point_content = point_content;
		this.point_purpose = point_purpose;
		this.point_all = point_all;
	}

	public int getPoint_no() {
		return point_no;
	}

	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getPoint_date() {
		return point_date;
	}

	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}

	public String getPoint_content() {
		return point_content;
	}

	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}

	public String getPoint_purpose() {
		return point_purpose;
	}

	public void setPoint_purpose(String point_purpose) {
		this.point_purpose = point_purpose;
	}

	public int getPoint_all() {
		return point_all;
	}

	public void setPoint_all(int point_all) {
		this.point_all = point_all;
	}
	
}
