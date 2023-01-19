package com.boot.jdbc.model.biz;


import com.boot.jdbc.model.dto.OrnaDto;

public interface TreeBiz {
	OrnaDto selectOne(String or_id);
}
