package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.CartDto;

@Mapper
public interface CartMapper {
	
	@Insert("INSERT INTO CART VALUES(NULL, #{user_id}, #{letterNo}, #{optinoNo}, #{cart_amount}, #{cart_status}) ")
	List<CartDto> cartList(String user_id, int letterNo, String optionNo);

	@Select(" SELECT PRODUCT_QUANTITY FROM CART WHERE USER_ID = #{user_id} ")
	int QuantityChk(String user_id);
	
	@Delete(" DELETE FROM CART WHERE USER_ID = #{user_id} AND CART_NO = #{cart_no} ")
	int delete(String user_id, int cart_no);


}




//전체 내용 보여주기 (where user_id = #{user_id})



/*
	private int cart_no;
	private int letter_no;
	private int option_no;
	private int cart_amount;
	private String cart_status;
*/