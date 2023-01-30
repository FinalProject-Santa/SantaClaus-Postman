package com.boot.jdbc.model.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.boot.jdbc.model.dto.DiaryDto;

@Mapper
public interface StickerMapper {
	
	@Select("SELECT WRITE_DATE FROM DIARY WHERE KIDS_NO=#{kidsNo}")
	ArrayList<String> selectStickerDate(int kidsNo);
	
	@Select("SELECT COUNT(*) FROM DIARY WHERE KIDS_NO=#{kidsNo}")
	int selectDiary(int kidsNo);
	
	@Delete("DELETE FROM STICKER WHERE KIDS_NO=#{kidsNo}")
	int deleteSticker(int kidsNo);
	
	@Insert("INSERT INTO STICKER VALUES(#{kidsNo},#{stickerCount})")
	int insertSticker(int kidsNo, int stickerCount);
	
}

