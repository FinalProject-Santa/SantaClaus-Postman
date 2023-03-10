package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.ArticleDto;

@Mapper	
public interface ArticleMapper {
	
	@Select("SELECT * FROM BOARD_ARTICLE order by article_no desc")
	List <ArticleDto> selectList();
	
	@Select("SELECT * FROM BOARD_ARTICLE where article_no=#{article_no}")
	ArticleDto selectOne(int no);


}
