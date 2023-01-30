package com.boot.jdbc.model.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boot.jdbc.model.dto.CartDto;
import com.boot.jdbc.model.dto.LetterDto;
import com.boot.jdbc.model.dto.OptionDto;

public interface CartBiz {

	List<CartDto> cartList(String user_id);
	int cartInsert(CartDto cartDto);
	OptionDto optionInfo(String optionName);
	LetterDto letterInfo(String letterName);
//	int delete(String user_id, int cart_no);
	
}
