package com.boot.jdbc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.ArticleMapper;
import com.boot.jdbc.model.dto.ArticleDto;

@Service
public class ArticleBizImpl implements ArticleBiz {
	
	@Autowired
	private ArticleMapper articleMapper;

	@Override
	public List<ArticleDto> selectList() {
		return articleMapper.selectList();
	}

	@Override
	public ArticleDto selectOne(int no) {
		return articleMapper.selectOne(no);
	}

	

}

