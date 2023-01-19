package com.boot.jdbc.model.dto;

public class KidsDto {

	private int kids_no;
	private int kids_point;
	private String kids_nickname;
	private String kids_thumbnail;
	private String kids_letter_img;
	private String user_id;
	
	
	public KidsDto() {}
	public KidsDto(int kids_no, int kids_point, String kids_nickname, String kids_thumbnail, String kids_letter_img,
			String user_id) {
		super();
		this.kids_no = kids_no;
		this.kids_point = kids_point;
		this.kids_nickname = kids_nickname;
		this.kids_thumbnail = kids_thumbnail;
		this.kids_letter_img = kids_letter_img;
		this.user_id = user_id;
	}
	public int getKids_no() {
		return kids_no;
	}
	public void setKids_no(int kids_no) {
		this.kids_no = kids_no;
	}
	public int getKids_point() {
		return kids_point;
	}
	public void setKids_point(int kids_point) {
		this.kids_point = kids_point;
	}
	public String getKids_nickname() {
		return kids_nickname;
	}
	public void setKids_nickname(String kids_nickname) {
		this.kids_nickname = kids_nickname;
	}
	public String getKids_thumbnail() {
		return kids_thumbnail;
	}
	public void setKids_thumbnail(String kids_thumbnail) {
		this.kids_thumbnail = kids_thumbnail;
	}
	public String getKids_letter_img() {
		return kids_letter_img;
	}
	public void setKids_letter_img(String kids_letter_img) {
		this.kids_letter_img = kids_letter_img;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
}
