package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.MemberDto;

@Mapper
public interface OrderMapper {
	@Select("SELECT * FROM MEMBER WHERE USER_ID = #{user_id}")
	MemberDto memberInfo(String user_id);

}
