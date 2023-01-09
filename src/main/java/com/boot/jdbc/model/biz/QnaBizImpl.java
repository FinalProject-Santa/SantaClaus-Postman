package com.boot.jdbc.model.biz;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boot.jdbc.model.dao.QnaMapper;
import com.boot.jdbc.model.dto.QnaDto;

@Service
public class QnaBizImpl implements QnaBiz {
	
	@Autowired QnaMapper qnaMapper;
	
	@Override
	public int insert(QnaDto dto){
		return qnaMapper.insert(dto);
	}

	@Override
	public List<QnaDto> selectList() {
		return qnaMapper.selectList();
	}

	@Override
	public QnaDto selectOne(Integer qna_no) {
		return qnaMapper.selectOne(qna_no);
	}

	@Override
	public String getPicture(Integer qna_no) {
		return qnaMapper.getPicture(qna_no);
	}
	
	
	
	
	
	
	
}
