package com.boot.jdbc.model.dao;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;

@Mapper
public interface MemberMapper {
	@Insert("INSERT INTO MEMBER VALUES(#{user_id}, #{password}, #{name}, #{post_code}, #{default_addr},"
			+ " #{detail_addr}, #{phone}, #{email}, #{rfileName}, #{rfileOriName}, #{rfileUrl}) ")
	int signUp(MemberDto dto);
	
	@Select("SELECT RFILEURL FROM MEMBER WHERE USER_ID = #{user_id}")
	String selectParentProfile(String user_id);
	
	@Select("SELECT * FROM KIDS_SETTING WHERE USER_ID = #{user_id}")
	List<KidsDto> selectChildrenProfile(String user_id);

	@Select("SELECT * FROM MEMBER WHERE USER_ID = #{user_id} AND PASSWORD = #{password}")
	MemberDto login(String user_id, String password);
	
	@Select("SELECT USER_ID FROM MEMBER WHERE USER_ID = #{user_id}")
	String idChk(String user_id);

	@Select("SELECT USER_ID FROM MEMBER WHERE NAME = #{name} AND EMAIL = #{email}")
	String findId(MemberDto dto);
	
	@Select("SELECT PASSWORD FROM MEMBER WHERE USER_ID = #{userId}")
	String findPw(String userId);
	
	@Select(" SELECT * FROM MEMBER WHERE USER_ID = #{user_id} ")
	MemberDto infoUpdateform(String user_id);

	@Update("  UPDATE MEMBER SET \n"
			+ " PASSWORD=#{password}, POST_CODE=#{post_code}, DEFAULT_ADDR=#{default_addr}, DETAIL_ADDR=#{detail_addr}, EMAIL=#{email}, PHONE=#{phone}, "
			+ " RFILENAME=#{rfileName}, RFILEORINAME=#{rfileOriName}, RFILEURL=#{rfileUrl} \n"
			+ " WHERE USER_ID=#{user_id} ")
	int myinfoUpdate(MemberDto dto);

	@Delete(" DELETE FROM MEMBER WHERE USER_ID = #{user_id} ")
	int delete(String user_id);

	@Select(" SELECT PASSWORD FROM MEMBER WHERE USER_ID = #{user_id} ")
	String pwChk(String user_id);

	@Select(" SELECT PHONE FROM MEMBER WHERE USER_ID = #{user_id} ")
	String phoneChk(String user_id);

}
