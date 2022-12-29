package com.boot.jdbc.model.biz;

import com.boot.jdbc.model.dto.MemberDto;

public interface MemberBiz {
	public int signUp(MemberDto dto);
	public int login(String user_id);
	public int idChk(String user_id);
	public int findId(MemberDto dto);
	public int findPw(MemberDto dto);
}
