package com.boot.jdbc.model.dao;



import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.OrnaDto;

@Mapper
public interface TreeMapper{ 

	@Select("SELECT * FROM ORNAMENT WHERE OR_ID=#{or_id}")
	OrnaDto selectOne(String or_id);
	
}
