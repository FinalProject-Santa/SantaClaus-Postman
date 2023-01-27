package com.boot.jdbc.model.biz;

import javax.servlet.http.HttpSession;

import com.boot.jdbc.model.dto.MemberDto;

public interface MemberBiz {
	public int signUp(MemberDto dto);
	public MemberDto login(String user_id, String password);
	public String idChk(String user_id);
	public String findId(MemberDto dto);
	public String findPw(MemberDto dto);
	public MemberDto infoUpdateform(String user_id);
	public int myinfoUpdate(MemberDto dto);
	public int delete(String user_id);
	public String pwChk(String user_id);
	public String phoneChk(String user_id);
	
	public void logout(HttpSession session);
}
