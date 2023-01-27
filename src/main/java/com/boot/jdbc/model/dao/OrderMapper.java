package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OrderDto;

@Mapper
public interface OrderMapper {
	@Select("SELECT * FROM MEMBER WHERE USER_ID = #{user_id}")
	MemberDto memberInfo(String user_id);
	
	@Insert("INSERT INTO `ORDER` VALUES(#{order_no}, #{user_id}, #{letter_name}, #{option_name}, NOW(), #{total_price}, #{receiver}, #{email}, #{post_code}, #{default_addr}, #{detail_addr}, #{phone}, #{delivery_message}, #{use_point}, #{save_point})")
	int payment(OrderDto orderDto);
}
