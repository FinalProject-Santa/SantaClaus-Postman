package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.ArticleDto;

public interface ArticleBiz {
public List <ArticleDto> selectList();
public ArticleDto selectOne(int no);
	
}
