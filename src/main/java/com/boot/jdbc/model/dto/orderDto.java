package com.boot.jdbc.model.dto;

import java.util.Date;

public class orderDto {
	private String orderno;
	private String user_id;
	private Date order_date;
	private String review_status;
	private String delivery_status;
	private int product_quantity;
	private int product_cost;
	
	public orderDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public orderDto(String orderno, String user_id, Date order_date, String review_status, String delivery_status,
			int product_quantity, int product_cost) {
		super();
		this.orderno = orderno;
		this.user_id = user_id;
		this.order_date = order_date;
		this.review_status = review_status;
		this.delivery_status = delivery_status;
		this.product_quantity = product_quantity;
		this.product_cost = product_cost;
	}
	
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getReview_status() {
		return review_status;
	}
	public void setReview_status(String review_status) {
		this.review_status = review_status;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public int getProduct_cost() {
		return product_cost;
	}
	public void setProduct_cost(int product_cost) {
		this.product_cost = product_cost;
	}
	
	
	 
	
}
