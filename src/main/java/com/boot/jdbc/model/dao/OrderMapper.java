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
	
	@Insert("INSERT INTO ORDER VALUES(ORDER_NO, USER_ID, LETTER_NAME, OPTION_NAME, NOW(), TOTAL_PRICE, RECEIVER, EMAIL, POST_CODE, DEFAULT_ADDR, DETAIL_ADDR, PHONE, DELIVERY_MESSAGE, POINT)")
	int payment(OrderDto orderDto);
}
