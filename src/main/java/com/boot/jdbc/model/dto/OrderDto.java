package com.boot.jdbc.model.dto;

import java.util.Date;

public class OrderDto {
	private String order_no;
	private String user_id;
	private String letter_name;
	private String option_name;
	private Date order_date;
	private Integer total_price;
	private String receiver;
	private String email;
	private String post_code;
	private String default_addr;
	private String detail_addr;
	private String phone;
	private String delivery_message;
	private Integer use_point;
	private Integer save_point;

	public OrderDto() {
		super();
	}

	public OrderDto(String order_no, String user_id, String letter_name, String option_name, Date order_date,
			int total_price, String receiver, String email, String post_code, String default_addr, String detail_addr,
			String phone, String delivery_message, Integer use_point, Integer save_point) {
		super();
		this.order_no = order_no;
		this.user_id = user_id;
		this.letter_name = letter_name;
		this.option_name = option_name;
		this.order_date = order_date;
		this.total_price = total_price;
		this.receiver = receiver;
		this.email = email;
		this.post_code = post_code;
		this.default_addr = default_addr;
		this.detail_addr = detail_addr;
		this.phone = phone;
		this.delivery_message = delivery_message;
		this.use_point = use_point;
		this.save_point = save_point;
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

	public String getLetter_name() {
		return letter_name;
	}

	public void setLetter_name(String letter_name) {
		this.letter_name = letter_name;
	}

	public String getOption_name() {
		return option_name;
	}

	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
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

	public Integer getUse_point() {
		return use_point;
	}

	public void setUse_point(Integer use_point) {
		this.use_point = use_point;
	}

	public Integer getSave_point() {
		return save_point;
	}

	public void setSave_point(Integer save_point) {
		this.save_point = save_point;
	}

}
