package com.boot.jdbc.model.biz;

import java.util.List;
import java.util.Map;

import com.boot.jdbc.model.dto.Criteria;
import com.boot.jdbc.model.dto.ReviewDto;
import com.boot.jdbc.model.dto.rFileDto;

public interface ReviewBiz {
	public List<Map<String, Object>> reviewList(Criteria cri);
	public ReviewDto reviewDetail(int review_no);
	public rFileDto rfileDetail(int review_no);
	public int reviewInsert(ReviewDto reviewdto);
	public int fileInsert(rFileDto file);
	public int reviewUpdate(ReviewDto reviewdto);
	public int rfileUpdate(rFileDto rfiledto);
	public int reviewCountUpdate(int review_no);
	public int reviewDelete(int review_no);
	public int rfileDelete(int review_no);
}
