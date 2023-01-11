package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface CartMapper {
	@Select(" SELECT PRODUCT_QUANTITY FROM CART WHERE USER_ID = #{user_id} ")
	int QuantityChk(String user_id);
	
	@Delete(" DELETE FROM CART WHERE USER_ID = ${user_id} ")
	int delete(String user_id);
}
