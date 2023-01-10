package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.pointDto;

@Mapper
public interface pointMapper {
//	@Select(" SELECT POINT_ALL FROM POINT ")
//	int pointAll(String user_id);

	@Select(" SELECT * FROM POINT ORDER BY ORDER_NO DESC ")
	List<pointDto> selectList();
	
	


}
