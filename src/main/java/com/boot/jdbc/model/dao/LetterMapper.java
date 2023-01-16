package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OptionDto;

@Mapper
public interface LetterMapper {
	@Select("SELECT * FROM LETTER ORDER BY LETTER_NO")
	List<LetterDto> mainList();
	
	@Select("SELECT * FROM LETTER ORDER BY LETTER_NO")
	List<LetterDto> letterList();
	
	@Select("SELECT * FROM `OPTION` ORDER BY OPTION_NO")
	List<OptionDto> optionList();
}
