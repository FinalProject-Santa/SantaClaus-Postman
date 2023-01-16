package com.boot.jdbc.model.biz;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.DiaryMapper;
import com.boot.jdbc.model.dto.DiaryDto;

@Service
public class DiaryBizImpl implements DiaryBiz{
	
	@Autowired
	private DiaryMapper diaryMapper;
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public int insert(DiaryDto dto) {
		
		return diaryMapper.insert(dto);
	}

	@Override
	public int saveDiary(Map<Object, Object> param) {
		
		return diaryMapper.saveDiary(param);
	}
	
	@Override
	public int fillDiary(Map<Object, Object> param) {
		
		return diaryMapper.fillDiary(param);
	}

	@Override
	public String selectPath(String user_id) {
		
		return diaryMapper.selectPath(user_id);
	}

	@Override
	public void sendMail(String userEmail, String filePath) {
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(userEmail);
		message.setFrom("jiyoun_908@naver.com");
		message.setSubject("제목");
		message.setText(filePath);
		
		mailSender.send(message);
		
	}

	@Override
	public String selectDate(String userId, LocalDate now) {
		
		return diaryMapper.selectDate(userId, now);
	}
	

	@Override
	public String fillDate(String userId, LocalDate localdate) {
		
		return diaryMapper.fillDate(userId, localdate);
	}

	@Override
	public ArrayList<String> selectStickerDate(String userId) {
		
		return diaryMapper.selectStickerDate(userId);
	}

	@Override
	public int selectDiary(String userId) {
		
		return diaryMapper.selectDiary(userId);
	}
	
	@Override
	public int deleteSticker(String userId) {
		
		return diaryMapper.deleteSticker(userId);
	}

	@Override
	public int insertSticker(String userId, int stickerCount) {
		
		return diaryMapper.insertSticker(userId, stickerCount);
	}

	
	
	
	
	
	
}
