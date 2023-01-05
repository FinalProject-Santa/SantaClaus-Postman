package com.boot.jdbc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.ReviewMapper;
import com.boot.jdbc.model.dto.ReviewDto;

@Service
public class ReviewBizImpl implements ReviewBiz{

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewDto> rselectList() {
		// TODO Auto-generated method stub
		return reviewMapper.rselectList();
	}

	@Override
	public int insert(ReviewDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewDto rselectOne(int Review_no) {
		// TODO Auto-generated method stub
		return reviewMapper.rselectOne(Review_no);
	}

}
