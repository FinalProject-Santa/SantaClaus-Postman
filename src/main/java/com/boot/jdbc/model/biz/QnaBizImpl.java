package com.boot.jdbc.model.biz;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boot.jdbc.model.dao.QnaMapper;
import com.boot.jdbc.model.dto.QnaDto;
import com.boot.jdbc.model.dto.QnaFileDto;

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
	public int insertFile(QnaFileDto file) {
		return qnaMapper.insertFile(file);
	}

	@Override
	public QnaFileDto selectFile(Integer qna_no) {
		return qnaMapper.selectFile(qna_no);
	}


	@Override
	public int insertReply(QnaDto dto) {
		return qnaMapper.insertReply(dto);
	}

	
	
	
	
	
}
