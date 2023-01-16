package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OptionDto;

public interface LetterBiz {
	public List<LetterDto> mainList();
	public List<LetterDto> letterList();
	public List<OptionDto> optionList();
}
