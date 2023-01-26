package com.boot.jdbc.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.Criteria_Letter;
import com.boot.jdbc.model.dto.OptionDto;

@Mapper
public interface LetterMapper {
	// 메인화면에 뿌려 줄 엽서 이미지들
	@Select("SELECT LETTER_IMG FROM LETTER ORDER BY LETTER_NO LIMIT 8")
	List<String> mainList();
	
	// 엽서 목록
	@Select("SELECT * FROM LETTER ORDER BY LETTER_NO DESC LIMIT #{pageStart}, #{perPageNum}")
	List<Map<String, Object>> letterList(Criteria_Letter cri);
	
	// 엽서 총 갯수
	@Select("SELECT COUNT(*) FROM LETTER")
	int countLetterListTotal();
	
	// 옵션 상품 목록
	@Select("SELECT * FROM `OPTION` ORDER BY OPTION_NO")
	List<OptionDto> optionList();
}
