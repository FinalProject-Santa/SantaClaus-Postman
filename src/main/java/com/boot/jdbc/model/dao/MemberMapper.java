package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.MemberDto;

@Mapper
public interface MemberMapper {
	@Insert("INSERT INTO MEMBER VALUES(#{user_id}, #{password}, #{name}, #{post_code}, #{default_addr}, #{detail_addr}, #{phone}, #{email})")
	int signUp(MemberDto dto);

	@Select("SELECT * FROM MEMBER WHERE USER_ID = #{user_id} AND PASSWORD = #{password}")
	String login(String user_id, String password);
	
	@Select("SELECT USER_ID FROM MEMBER WHERE USER_ID = #{user_id}")
	String idChk(String user_id);

	@Select("SELECT USER_ID FROM MEMBER WHERE NAME = #{name} AND EMAIL = #{email}")
	String findId(MemberDto dto);
	
	@Select("SELECT PASSWORD FROM MEMBER WHERE USER_ID = #{user_id} AND EMAIL = #{email}")
	String findPw(MemberDto dto);
}
