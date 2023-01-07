package com.boot.jdbc.model.biz;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public int insert(Map<String, Object> param, MultipartFile mFile, QnaDto dto) {
		Map<String,Object> bizMap = new HashMap<>();
		
		if( !mFile.isEmpty()) {
			String file_oname = mFile.getOriginalFilename();
			try {
				mFile.transferTo(new File("C:\\Temp"+file_oname));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			bizMap.put("file_oname", file_oname);
		}
		
		return qnaMapper.insert(param,mFile,dto);
	}

	@Override
	public List<QnaDto> selectList() {
		return qnaMapper.selectList();
	}

	@Override
	public QnaDto selectOne(Integer qna_no) {
		return qnaMapper.selectOne(qna_no);
	}
	
	
	
	
}
