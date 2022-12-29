package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.MemberDto;

@Mapper
public interface MemberMapper {
	@Insert("INSERT INTO MEMBER VALUES(#{user_id}, #{password}, #{name}, #{post_code}, #{default_addr}, #{detail_addr}, #{phone}, #{email})")
	int signUp(MemberDto dto);

	@Select("SELECT * FROM MEMBER WHERE USER_ID = #{user_id}")
	int login(String user_id);
	
	@Select("SELECT * FROM MEMBER WHERE USER_ID = #{USER_ID}")
	int idChk(String user_id);

	@Select("SELECT * FROM MEMBER WHERE NAME = #{name} AND EMAIL = #{email}")
	int findId(MemberDto dto);
	
	@Select("SELECT * FROM MEMBER WHERE USER_ID = #{user_id} AND NAME = #{name} AND EMAIL = #{email}")
	int findPw(MemberDto dto);
}
