package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	@Insert("INSERT INTO REVIEW VALUES (NULL, 'USER2', 'ㅇㅇ', '4', '5', 'GOODGOOD','1', NOW(), 'IMGIMG','PATH')")
	int insert(ReviewDto dto);
	
	@Select("SELECT * FROM REVIEW ORDER BY REVIEW_NO DESC")
	List<ReviewDto> rselectList();
	
	@Select("SELECT * FROM REVIEW WHERE REVIEW_NO=#{REVIEW_no}")
	ReviewDto rselectOne(int review_no);
}
