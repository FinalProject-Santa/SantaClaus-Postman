package com.boot.jdbc.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.boot.jdbc.model.dto.KidFileDto;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;

@Mapper
public interface KidsMapper {

	@Insert("INSERT INTO KIDS_SETTING VALUES(#{user_id},0,#{kids_nickname},#{kids_thumbnail},#{kids_letter_img},#{user_id})")
	@Options(useGeneratedKeys = true, keyProperty = "kids_no")
	int add(KidsDto dto);
	
	
	@Insert("INSERT INTO KIDS_FILE VALUES(null,#{file_path},#{file_oname},#{file_name},#{kids_no})")
	@Options(useGeneratedKeys = true, keyProperty = "file_id")
	int addFile(KidFileDto file);


}