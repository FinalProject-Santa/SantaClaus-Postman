package com.boot.jdbc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.MemberMapper;
import com.boot.jdbc.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz{
	
	@Autowired
	private MemberMapper memberMapper;
 
	@Override
	public int signUp(MemberDto dto) {
		return memberMapper.signUp(dto);
	}

	@Override
	public MemberDto login(String user_id, String password) {
		return memberMapper.login(user_id, password);
	}

	@Override
	public String idChk(String user_id) {
		return memberMapper.idChk(user_id);
	}
	
	@Override
	public String findId(MemberDto dto) {
		return memberMapper.findId(dto);
	}

	@Override
	public String findPw(MemberDto dto) {
		return memberMapper.findPw(dto);
	}

	@Override
	public MemberDto infoUpdateform(String user_id) {
		return memberMapper.infoUpdateform(user_id);
	}

	@Override
	public int myinfoUpdate(MemberDto dto) {
		return memberMapper.myinfoUpdate(dto);
	}

	@Override
	public int delete(String user_id) {
		System.out.println(user_id);
		return memberMapper.delete(user_id);
	}

	@Override
	public String pwChk(String user_id) {
		return memberMapper.pwChk(user_id);
	}

	@Override
	public String phoneChk(String user_id) {
		return memberMapper.phoneChk(user_id);
	}

}
