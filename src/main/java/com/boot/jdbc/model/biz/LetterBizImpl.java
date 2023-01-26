package com.boot.jdbc.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.LetterMapper;
import com.boot.jdbc.model.dto.Criteria_Letter;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OptionDto;

@Service
public class LetterBizImpl implements LetterBiz{

	@Autowired
	private LetterMapper mapper;
	
	@Override
	public List<String> mainList() {
		return mapper.mainList();
	}
	
	@Override
	public int countLetterListTotal() {
		return mapper.countLetterListTotal();
	}

	@Override
	public List<Map<String, Object>> letterList(Criteria_Letter cri) {
		return mapper.letterList(cri);
	}

	@Override
	public List<OptionDto> optionList() {
		return mapper.optionList();
	}
}
