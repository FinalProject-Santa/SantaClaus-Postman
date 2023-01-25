package com.boot.jdbc.model.biz;

import java.time.LocalDate;

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
	public int saveDiary(String userId, int kidsNo, String filePath, String userEmail) {
		
		return diaryMapper.saveDiary(userId,kidsNo,filePath,userEmail);
	}
	
	@Override
	public int fillDiary(String userId, int kidsNo, String filePath, LocalDate localdate, String userEmail) {
		
		return diaryMapper.fillDiary(userId,kidsNo,filePath,localdate,userEmail);
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


	//게임포인트
	@Override
	public int insertPoint(int kidsNo) {
		
		return diaryMapper.insertPoint(kidsNo);
	}

	
	
	
	
	
	
}
