package com.boot.jdbc.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.ReviewMapper;
import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.ReviewDto;
import com.boot.jdbc.model.dto.rFileDto;

@Service
public class ReviewBizImpl implements ReviewBiz{

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<Map<String, Object>> reviewList(Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewList(cri);
	}

	@Override
	public int countBoardListTotal() {
		// TODO Auto-generated method stub
		return reviewMapper.countBoardList();
	}

	@Override
	public ReviewDto reviewDetail(int review_no) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewDetail(review_no);
	}

	@Override
	public int reviewInsert(ReviewDto reviewdto) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewInsert(reviewdto);
	}

	@Override
	public int reviewUpdate(ReviewDto reviewdto) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewUpdate(reviewdto);
	}

	@Override
	public int rfileUpdate(rFileDto rfiledto) {
		// TODO Auto-generated method stub
		return reviewMapper.rfileUpdate(rfiledto);
	}
	
	@Override
	public int reviewCountUpdate(int review_no) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewCountUpdate(review_no);
	}

	@Override
	public int reviewDelete(int review_no) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewDelete(review_no);
	}
	@Override
	public int rfileDelete(int review_no) {
		// TODO Auto-generated method stub
		return reviewMapper.rfileDelete(review_no);
	}

	@Override
	public int fileInsert(rFileDto file) {
		// TODO Auto-generated method stub
		return reviewMapper.fileInsert(file);
	}

	@Override
	public rFileDto rfileDetail(int review_no) {
		// TODO Auto-generated method stub
		return reviewMapper.rfileDetail(review_no);
	}







}
