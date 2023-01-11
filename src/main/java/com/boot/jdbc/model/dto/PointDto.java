package com.boot.jdbc.model.dto;

import java.util.Date;

public class PointDto {
	private int order_no;
	private String user_id;
	private int point_save;
	private Date point_date;
	private String point_content;
	private int point_use;
	private int point_all;
	private String point_purpose;
	
	public PointDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PointDto(int order_no, String user_id, int point_save, Date point_date, String point_content,
			int point_use, int point_all, String point_purpose) {
		super();
		this.order_no = order_no;
		this.user_id = user_id;
		this.point_save = point_save;
		this.point_date = point_date;
		this.point_content = point_content;
		this.point_use = point_use;
		this.point_all = point_all;
		this.point_purpose = point_purpose;
	}
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPoint_save() {
		return point_save;
	}
	public void setPoint_save(int point_save) {
		this.point_save = point_save;
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
	public int getPoint_use() {
		return point_use;
	}
	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}
	public int getPoint_all() {
		return point_all;
	}
	public void setPoint_all(int point_all) {
		this.point_all = point_all;
	}
	public String getPoint_purpose() {
		return point_purpose;
	}
	public void setPoint_purpose(String point_purpose) {
		this.point_purpose = point_purpose;
	}
	@Override
	public String toString() {
		return "pointDto [order_no=" + order_no + ", user_id=" + user_id + ", point_save=" + point_save
				+ ", point_date=" + point_date + ", point_content=" + point_content + ", point_use=" + point_use
				+ ", point_all=" + point_all + ", point_purpose=" + point_purpose + "]";
	}
	
	
	
	 
	
}
