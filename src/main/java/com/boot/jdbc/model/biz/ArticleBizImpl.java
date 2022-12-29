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





















/**
 	private int total;
	private int currentPage;
	private List<ArticleDto> content;
	private int totalPages;
	private int startPage;
	private int endPage;

	public ArticleBizImpl(int total, int currentPage, int size, List<ArticleDto> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
			if (total % size > 0) {
				totalPages++;
			}
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if (modVal == 0) startPage -= 5;
			
			endPage = startPage + 4;
			if (endPage > totalPages) endPage = totalPages;
		}
	}

	public int getTotal() {
		return total;
	}

	public boolean hasNoArticles() {
		return total == 0;
	}

	public boolean hasArticles() {
		return total > 0;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public List<ArticleDto> getContent() {
		return content;
	}

	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	**/
 