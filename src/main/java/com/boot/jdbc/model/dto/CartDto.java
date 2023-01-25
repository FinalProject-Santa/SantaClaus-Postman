package com.boot.jdbc.model.dto;

import java.util.List;

public class CartDto {
	private int cart_no;
	private String user_id;
	private int letter_no;
	private int option_no;
	private int cart_amount;
	private String cart_status;
	
	public CartDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartDto(int cart_no, String user_id, int letter_no, int option_no, int cart_amount, String cart_status) {
		super();
		this.cart_no = cart_no;
		this.user_id = user_id;
		this.letter_no = letter_no;
		this.option_no = option_no;
		this.cart_amount = cart_amount;
		this.cart_status = cart_status;
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

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

	public String getCart_status() {
		return cart_status;
	}

	public void setCart_status(String cart_status) {
		this.cart_status = cart_status;
	}
	
	
}
