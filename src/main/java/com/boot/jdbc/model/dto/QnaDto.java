package com.boot.jdbc.model.dto;

import java.util.Date;


public class QnaDto {
	private Integer qna_no;
	private String user_id;
	private String qna_type;
	private String qna_title;
	private Date qna_date;
	private String qna_content;
	//계층형 게시판에 필요한 필드 추가
	private Integer origin_no; //qna_no와 동일
	private int groupOrd; //원글+답변글 묶어서 정리할 int
	private int dep; //레이어설정에 필요한 필드
	private String secret; //비밀글 설정에 필요한 필드 
	
	public QnaDto() {}

	public QnaDto(Integer qna_no, String user_id, String qna_type, String qna_title, Date qna_date, String qna_content,
			Integer origin_no, int groupOrd, int dep, String secret) {
		super();
		this.qna_no = qna_no;
		this.user_id = user_id;
		this.qna_type = qna_type;
		this.qna_title = qna_title;
		this.qna_date = qna_date;
		this.qna_content = qna_content;
		this.origin_no = origin_no;
		this.groupOrd = groupOrd;
		this.dep = dep;
		this.secret = secret;
	}

	public Integer getQna_no() {
		return qna_no;
	}

	public void setQna_no(Integer qna_no) {
		this.qna_no = qna_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQna_type() {
		return qna_type;
	}

	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Integer getOrigin_no() {
		return origin_no;
	}

	public void setOrigin_no(Integer origin_no) {
		this.origin_no = origin_no;
	}

	public int getGroupOrd() {
		return groupOrd;
	}

	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}

	public int getDep() {
		return dep;
	}

	public void setDep(int dep) {
		this.dep = dep;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}


	
}
