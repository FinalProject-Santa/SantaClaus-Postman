package com.boot.jdbc.model.dto;

import java.util.List;

public class OrnaDto {
	private String or_id;
	private int or_price;
	private String or_img;
	private String or_name;
	public List<OrnaDto> ornaDtoList;
	
	public OrnaDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrnaDto(String or_id, int or_price, String or_img, String or_name) {
		super();
		this.or_id = or_id;
		this.or_price = or_price;
		this.or_img = or_img;
		this.or_name = or_name;
	}
	public String getOr_id() {
		return or_id;
	}
	public void setOr_id(String or_id) {
		this.or_id = or_id;
	}
	public int getOr_price() {
		return or_price;
	}
	public void setOr_price(int or_price) {
		this.or_price = or_price;
	}
	public String getOr_img() {
		return or_img;
	}
	public void setOr_img(String or_img) {
		this.or_img = or_img;
	}
	public String getOr_name() {
		return or_name;
	}
	public void setOr_name(String or_name) {
		this.or_name = or_name;
	}
	public List<OrnaDto> getOrnaDtoList() {
		return ornaDtoList;
	}
	public void setOrnaDtoList(List<OrnaDto> ornaDtoList) {
		this.ornaDtoList = ornaDtoList;
	}

}
