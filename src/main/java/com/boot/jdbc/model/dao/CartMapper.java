package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.CartDto;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OptionDto;

@Mapper
public interface CartMapper {
	
	@Insert(" INSERT INTO CART VALUES(NULL, #{user_id}, #{letter_name}, #{option_name}) ")
	int cartInsert(CartDto cartDto);

	@Select("SELECT * FROM LETTER WHERE LETTER_NAME = #{letterName}")
	LetterDto letterInfo(String letterName);
	
	@Select("SELECT * FROM `OPTION` WHERE OPTION_NAME = #{optionName}")
	OptionDto optionInfo(String optionName);
	
	
	
	
	@Select(" SELECT * FROM CART WHERE USER_ID=#{user_id} ORDER BY CART_NO DESC ")
	List<CartDto> cartList(String user_id);

	
	@Select(" SELECT PRODUCT_QUANTITY FROM CART WHERE USER_ID = #{user_id} ")
	int QuantityChk(String user_id);
//	@Delete(" DELETE FROM CART WHERE USER_ID = #{user_id} AND CART_NO = #{cart_no} ")
//	int delete(String user_id, int cart_no);


}




//전체 내용 보여주기 (where user_id = #{user_id})



/*
	private int cart_no;
	private int letter_no;
	private int option_no;
	private int cart_amount;
	private String cart_status;
*/