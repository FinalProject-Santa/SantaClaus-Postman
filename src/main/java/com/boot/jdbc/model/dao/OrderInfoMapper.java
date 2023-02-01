package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.OptionDto;
import com.boot.jdbc.model.dto.OrderDto;
import com.boot.jdbc.model.dto.OrderInfoDto;
import com.boot.jdbc.model.dto.ReviewDto;


@Mapper
public interface OrderInfoMapper {
//	@Select(" SELECT * FROM `ORDER` WHERE USER_ID= #{user_id} AND ORDER_DATE BETWEEN #{startdate} AND #{enddate} ORDER BY ORDER_DATE DESC ")
//	List<OrderDto> orderList(@Param("user_id")String user_id, @Param("startdate")String startdate, @Param("enddate")String enddate);

	@Select(" SELECT * FROM `ORDER` WHERE USER_ID= #{user_id} AND ORDER_DATE BETWEEN #{startdate} AND #{enddate} ORDER BY ORDER_DATE DESC ")
	List<OrderDto> orderList(String user_id, String startdate, String enddate);
	
	@Select(" SELECT * FROM `ORDER` WHERE USER_ID=#{user_id} ORDER BY ORDER_DATE DESC ")
	List<OrderDto> orderDtoList(String user_id);
	
	@Select(" SELECT * FROM `ORDER` WHERE USER_ID=#{user_id} ORDER BY ORDER_DATE DESC ")
	OrderDto orderdto(String user_id);
	
//	@Select(" SELECT * FROM ORDER WHERE ORDER_DATE BETWEEN #{ORDER_DATE ")
//	List<OrderDto> selectOrder();
	
	@Select(" SELECT REVIEW_NO FROM REVIEW WHERE ORDER_NO=#{order_no} ")
	ReviewDto selectReview(String order_no);

	@Select(" SELECT OPTION_IMG FROM OPTION WHERE OPTION_NAME=#{option_name} ")
	List<OrderInfoDto> selectOption(String option_name);

	@Select(" SELECT LETTER_IMG FROM LETTER WHERE LETTER_NAME=#{letter_name} ")
	LetterDto selectLetter(String letter_name);




//	@Select(" SELECT * FROM OPTION WHERE OPTION_NO=#{option_no} ")
//	OptionDto optionDetail(int template_no);
	
	
	
	
	
	
//	private int order_no;
//	private String user_id;
//	private Date order_date;
//	private String review_status;
//	private String delivery_status;
//	private int product_quantity;
//	private int product_cost;
	
	
	
	
}
