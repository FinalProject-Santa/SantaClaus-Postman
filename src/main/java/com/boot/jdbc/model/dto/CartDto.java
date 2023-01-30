package com.boot.jdbc.model.dto;

import java.util.List;

public class CartDto {
	private int cart_no;
	private String user_id;
	private String letter_name;
	private String option_name;
	
	public CartDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartDto(int cart_no, String user_id, String letter_name, String option_name) {
		super();
		this.cart_no = cart_no;
		this.user_id = user_id;
		this.letter_name = letter_name;
		this.option_name = option_name;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
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





	
	
	
	
}
