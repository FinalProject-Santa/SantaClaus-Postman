package com.boot.jdbc.model.dto;

import java.util.Date;

public class paymentDto {
	private int orderno;
	private String user_id;
	private int template_no;
	private int option_no;
	private String receiver;
	private String email;
	private String addr;
	private String phone;
	private Date deliverydate;
	private int point;

	
	public paymentDto() {
		super();
	}
	public paymentDto(int orderno, String user_id, int template_no, int option_no, String receiver, String email,
			String addr, String phone, Date deliverydate, int point) {
		super();
		this.orderno = orderno;
		this.user_id = user_id;
		this.template_no = template_no;
		this.option_no = option_no;
		this.receiver = receiver;
		this.email = email;
		this.addr = addr;
		this.phone = phone;
		this.deliverydate = deliverydate;
		this.point = point;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTemplate_no() {
		return template_no;
	}
	public void setTemplate_no(int template_no) {
		this.template_no = template_no;
	}
	public int getOption_no() {
		return option_no;
	}
	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getDeliverydate() {
		return deliverydate;
	}
	public void setDeliverydate(Date deliverydate) {
		this.deliverydate = deliverydate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
	 
	
}
