package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.TreeOrderDto;

@Mapper
public interface OrderMapper {
	//회원정보 가져오기
	@Select("SELECT * FROM MEMBER WHERE USER_ID = #{user_id}")
	MemberDto memberInfo(String user_id);
	//엽서, 옵션 구매
	@Insert("INSERT INTO `ORDER` VALUES(#{order_no}, #{user_id}, #{letter_name}, #{option_name}, NULL, NOW(), #{total_price}, #{receiver}, #{email}, #{post_code}, #{default_addr}, #{detail_addr}, #{phone}, #{delivery_message}, #{use_point}, #{save_point})")
	int payment(OrderDto orderDto);
	//트리, 장식품 구매
	@Insert("INSERT INTO `ORDER` VALUES(#{order_no}, #{user_id}, '크리스마스 트리', NULL, #{or_name}, NOW(), #{total_price}, #{receiver}, #{email}, #{post_code}, #{default_addr}, #{detail_addr}, #{phone}, #{delivery_message}, #{use_point}, #{save_point})")
	int treePayment(TreeOrderDto orderDto);
}
