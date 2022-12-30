package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.boot.jdbc.model.dto.QnaDto;

@Mapper
public interface QnaMapper {
	@Insert("쿼리문넣을예정")
	int insert(QnaDto dto);
	

}
