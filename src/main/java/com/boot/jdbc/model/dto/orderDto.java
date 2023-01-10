package com.boot.jdbc.model.dto;

import java.util.Date;

public class orderDto {
	private int order_no;
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
	public orderDto(int order_no, String user_id, Date order_date, String review_status, String delivery_status,
			int product_quantity, int product_cost) {
		super();
		this.order_no = order_no;
		this.user_id = user_id;
		this.order_date = order_date;
		this.review_status = review_status;
		this.delivery_status = delivery_status;
		this.product_quantity = product_quantity;
		this.product_cost = product_cost;
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
	@Override
	public String toString() {
		return "orderDto [order_no=" + order_no + ", user_id=" + user_id + ", order_date=" + order_date
				+ ", review_status=" + review_status + ", delivery_status=" + delivery_status + ", product_quantity="
				+ product_quantity + ", product_cost=" + product_cost + "]";
	}
	
	
	 
	
}
