package com.boot.jdbc.model.dao;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.boot.jdbc.model.dto.MemberDto;

@Mapper
public interface MemberMapper {
	@Insert("INSERT INTO MEMBER VALUES(#{user_id}, #{password}, #{name}, #{post_code}, #{default_addr}, #{detail_addr}, #{phone}, #{email})")
	int signUp(MemberDto dto);

	@Select("SELECT * FROM MEMBER WHERE USER_ID = #{user_id} AND PASSWORD = #{password}")
	MemberDto login(String user_id, String password);
	
	@Select("SELECT USER_ID FROM MEMBER WHERE USER_ID = #{user_id}")
	String idChk(String user_id);

	@Select("SELECT USER_ID FROM MEMBER WHERE NAME = #{name} AND EMAIL = #{email}")
	String findId(MemberDto dto);
	
	@Select("SELECT PASSWORD FROM MEMBER WHERE USER_ID = #{user_id} AND EMAIL = #{email}")
	String findPw(MemberDto dto);
	
	//회원정보 수정 (로그인 세션 연결되면 조건 변경하기)
	@Select(" SELECT * FROM MEMBER WHERE USER_ID = 'user01' ")
	MemberDto infoUpdateform(String user_id);

	@Update("  UPDATE MEMBER SET \n"
			+ " PASSWORD=#{password}, POST_CODE=#{post_code}, DEFAULT_ADDR=#{default_addr}, DETAIL_ADDR=#{detail_addr}, EMAIL=#{email}, PHONE=#{phone} \n"
			+ " WHERE USER_ID=#{user_id} ")
	int myinfoUpdate(MemberDto dto);

	@Delete(" DELETE FROM MEMBER WHERE USER_ID = 'user01' ")
	int delete(String user_id);

}
