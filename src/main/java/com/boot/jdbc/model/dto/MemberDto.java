package com.boot.jdbc.model.dto;

public class MemberDto {
	private String user_id;
	private String password;
	private String name;
	private String post_code;
	private String default_addr;
	private String detail_addr;
	private String phone;
	private String email;
	
	private String rfileName;
	private String rfileOriName;
	private String rfileUrl;
	
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String user_id, String password, String name, String post_code, String default_addr,
			String detail_addr, String phone, String email, String rfileName, String rfileOriName, String rfileUrl) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.name = name;
		this.post_code = post_code;
		this.default_addr = default_addr;
		this.detail_addr = detail_addr;
		this.phone = phone;
		this.email = email;
		this.rfileName = rfileName;
		this.rfileOriName = rfileOriName;
		this.rfileUrl = rfileUrl;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRfileName() {
		return rfileName;
	}

	public void setRfileName(String rfileName) {
		this.rfileName = rfileName;
	}

	public String getRfileOriName() {
		return rfileOriName;
	}

	public void setRfileOriName(String rfileOriName) {
		this.rfileOriName = rfileOriName;
	}

	public String getRfileUrl() {
		return rfileUrl;
	}

	public void setRfileUrl(String rfileUrl) {
		this.rfileUrl = rfileUrl;
	}


	
	
}
