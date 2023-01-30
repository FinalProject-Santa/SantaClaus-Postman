package com.boot.jdbc.model.biz;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;

public interface MemberBiz {
	// 회원가입
	public int signUp(MemberDto dto);
	// 아이 프로필 가져오기
	public List<KidsDto> selectChildrenProfile(String user_id);
	// 로그인
	public MemberDto login(String user_id, String password);
	// 아이디 중복 체크
	public String idChk(String user_id);
	// 아이디 찾기
	public String findId(MemberDto dto);
	// 비밀번호 찾기
	public String findPw(MemberDto dto);
	// 회원정보 수정 페이지 회원정보 가져오기
	public MemberDto infoUpdateform(String user_id);
	// 회원정보 수정
	public int myinfoUpdate(MemberDto dto);
	// 계정 삭제
	public int delete(String user_id);
	// 비밀번호 동일 확인
	public String pwChk(String user_id);
	// 핸드폰번호 동일 확인
	public String phoneChk(String user_id);
	
	public void logout(HttpSession session);
}
