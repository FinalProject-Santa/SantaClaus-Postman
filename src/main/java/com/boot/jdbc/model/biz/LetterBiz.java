package com.boot.jdbc.model.biz;

import java.util.List;
import java.util.Map;

import com.boot.jdbc.model.dto.Criteria_Letter;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OptionDto;

public interface LetterBiz {
	public List<String> mainList();
	List<Map<String, Object>> letterList(Criteria_Letter cri);
	int countLetterListTotal();
	public List<OptionDto> optionList();
}
