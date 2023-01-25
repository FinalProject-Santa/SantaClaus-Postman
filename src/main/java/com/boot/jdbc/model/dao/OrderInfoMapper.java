package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OrderInfoDto;


@Mapper
public interface OrderInfoMapper {
	@Select(" SELECT * FROM `ORDER_INFO` ORDER BY ORDER_NO DESC ")
	List<OrderInfoDto> orderList();

//	@Select(" SELECT * FROM ORDER WHERE ORDER_DATE BETWEEN #{ORDER_DATE ")
//	List<OrderDto> selectOrder();

	
//	@Select(" SELECT * FROM TEMPLATE WHERE TEMPLATE_NO=#{template_no} ")
//	LetterTemplateDto templateDetail(int template_no);

//	@Select(" SELECT * FROM OPTION WHERE OPTION_NO=#{option_no} ")
//	OptionDto optionDetail(int template_no);
	
	
	
//	@Insert(" INSERT INTO ORDER VALUES(#{order_no}, #{user_id}, NOW(), #{review_status}, #{delivery_status}, #{product_quantity}, #{product_cost}) ")
//	int orderInsert(OrderDto orderdto);
	
	
	
	
//	private int order_no;
//	private String user_id;
//	private Date order_date;
//	private String review_status;
//	private String delivery_status;
//	private int product_quantity;
//	private int product_cost;
	
	
	
	
}
