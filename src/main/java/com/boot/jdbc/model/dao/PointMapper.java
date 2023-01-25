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
	// 회원가입 축하 포인트 적립
	@Insert("INSERT INTO POINT VALUES(NULL, '', #{user_id}, 0, NOW(), '회원가입 축하 포인트','적립', 2000)")
	int signUpPoint(String user_id);
	
	// 현재 포인트 가져오기
	@Select("SELECT POINT_ALL FROM `POINT` WHERE USER_ID=#{user_id} ORDER BY POINT_NO DESC limit 1")
	int pointAll(String user_id);

//	@Select(" SELECT * FROM POINT ORDER BY ORDER_NO DESC ")
//	List<PointDto> selectList();


	@Select("SELECT COUNT(*) FROM POINT")
	int countBoardList();

	@Select("SELECT * FROM POINT ORDER BY ORDER_NO DESC LIMIT #{pageStart}, #{perPageNum}")
	List<PointDto> selectList(Criteria cri);

	@Insert("INSERT INTO POINT VALUES(NULL, #{order_no}, #{user_id}, #{point}, NOW(), #{point_content}, #{point_purpose}, #{point_all})")
	int insertPoint(PointDto pointDto);
}
