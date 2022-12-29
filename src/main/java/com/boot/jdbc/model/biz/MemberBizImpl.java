package com.boot.jdbc.model.biz;

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
	public int login(String user_id) {
		return memberMapper.login(user_id);
	}

	@Override
	public int idChk(String user_id) {
		return memberMapper.idChk(user_id);
	}
	
	@Override
	public int findId(MemberDto dto) {
		return memberMapper.findId(dto);
	}

	@Override
	public int findPw(MemberDto dto) {
		return memberMapper.findPw(dto);
	}
}
