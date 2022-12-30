package com.boot.jdbc.model.dto;

import java.util.Date;

public class cartDto {
	private int cart_no;
	private String user_id;
	private int template_no;
	private int option_no;
	private int cart_amount;
	private int product_quantity;
	private String cart_status;
	private int discount;
	private int product_cost;
	
	public cartDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public cartDto(int cart_no, String user_id, int template_no, int option_no, int cart_amount, int product_quantity,
			String cart_status, int discount, int product_cost) {
		super();
		this.cart_no = cart_no;
		this.user_id = user_id;
		this.template_no = template_no;
		this.option_no = option_no;
		this.cart_amount = cart_amount;
		this.product_quantity = product_quantity;
		this.cart_status = cart_status;
		this.discount = discount;
		this.product_cost = product_cost;
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
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public String getCart_status() {
		return cart_status;
	}
	public void setCart_status(String cart_status) {
		this.cart_status = cart_status;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getProduct_cost() {
		return product_cost;
	}
	public void setProduct_cost(int product_cost) {
		this.product_cost = product_cost;
	}
	
	
	 
	
}
