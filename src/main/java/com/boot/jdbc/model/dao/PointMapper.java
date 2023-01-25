package com.boot.jdbc.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.PointDto;

@Mapper
public interface PointMapper {
	@Select(" SELECT POINT FROM POINT WHERE USER_ID=#{user_id}")
	int pointAll(String user_id);

//	@Select(" SELECT * FROM POINT ORDER BY ORDER_NO DESC ")
//	List<PointDto> selectList();

	@Select(" SELECT SUM(POINT_) FROM POINT WHERE USER_ID = #{user_id} ")
	int pointAlll(String user_id);

	@Select("SELECT COUNT(*) FROM POINT")
	int countBoardList();

	@Select("SELECT * FROM POINT ORDER BY ORDER_NO DESC LIMIT #{pageStart}, #{perPageNum}")
	List<PointDto> selectList(Criteria cri);

	@Insert("INSERT INTO POINT VALUES(ORDER_NO, USER_ID, POINT, NOW(), POINT_CONTENT, POINT_PURPOSE)")
	int insertPoint(PointDto pointDto);
}
