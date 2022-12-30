package com.boot.jdbc.model.biz;

import com.boot.jdbc.model.dto.MemberDto;

public interface MemberBiz {
	public int signUp(MemberDto dto);
	public String login(String user_id, String password);
	public String idChk(String user_id);
	public String findId(MemberDto dto);
	public String findPw(MemberDto dto);
}
