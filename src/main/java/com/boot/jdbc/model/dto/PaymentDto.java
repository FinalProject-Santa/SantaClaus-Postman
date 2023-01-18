package com.boot.jdbc.model.dto;

import java.util.Date;

public class PaymentDto {
	private int order_no;
	private String user_id;
	private int letter_no;
	private int option_no;
	private Date order_date;
	private String receiver;
	private String email;
	private String post_code;
	private String default_addr;
	private String detail_addr;
	private String phone;
	private String delivery_message;
	private Date delivery_date;
	private int point;
	
	public PaymentDto() {
		super();
	}

	public PaymentDto(int order_no, String user_id, int letter_no, int option_no, Date order_date, String receiver,
			String email, String post_code, String default_addr, String detail_addr, String phone,
			String delivery_message, Date delivery_date, int point) {
		super();
		this.order_no = order_no;
		this.user_id = user_id;
		this.letter_no = letter_no;
		this.option_no = option_no;
		this.order_date = order_date;
		this.receiver = receiver;
		this.email = email;
		this.post_code = post_code;
		this.default_addr = default_addr;
		this.detail_addr = detail_addr;
		this.phone = phone;
		this.delivery_message = delivery_message;
		this.delivery_date = delivery_date;
		this.point = point;
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

	public int getLetter_no() {
		return letter_no;
	}

	public void setLetter_no(int letter_no) {
		this.letter_no = letter_no;
	}

	public int getOption_no() {
		return option_no;
	}

	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
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

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getDefault_addr() {
		return default_addr;
	}

	public void setDefault_addr(String default_addr) {
		this.default_addr = default_addr;
	}

	public String getDetail_addr() {
		return detail_addr;
	}

	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDelivery_message() {
		return delivery_message;
	}

	public void setDelivery_message(String delivery_message) {
		this.delivery_message = delivery_message;
	}

	public Date getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
}
