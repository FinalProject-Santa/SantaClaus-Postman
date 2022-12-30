package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.pointDto;

@Mapper
public interface pointMapper {
	@Select(" SELECT POINT_ALL FROM POINT WHERE USER_ID = #{user_id} ")
	int pointAll(String user_id);

	@Select(" SELECT POINT_PURPOSE, POINT_DATE, POINT_SAVE, ORDERNO, POINT_CONTENT "
			+ " FROM MEMBER WHERE USER_ID = #{USER_ID} AND POINT_PURPOSE = '적립' ")
	pointDto pointsave(pointDto dto);

	@Select(" SELECT POINT_PURPOSE, POINT_DATE, POINT_USE, ORDERNO, POINT_CONTENT "
			+ " FROM MEMBER WHERE USER_ID = #{USER_ID} AND POINT_PURPOSE = '사용' ")
	pointDto pointUse(pointDto dto);
	


}
