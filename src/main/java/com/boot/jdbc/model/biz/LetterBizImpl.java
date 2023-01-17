package com.boot.jdbc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.LetterMapper;
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
	public List<LetterDto> letterList() {
		return mapper.letterList();
	}

	@Override
	public List<OptionDto> optionList() {
		return mapper.optionList();
	}


}
