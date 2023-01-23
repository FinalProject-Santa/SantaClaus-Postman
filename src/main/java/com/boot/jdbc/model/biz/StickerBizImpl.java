package com.boot.jdbc.model.biz;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.boot.jdbc.model.dao.StickerMapper;

public class StickerBizImpl implements StickerBiz{

	@Autowired
	private StickerMapper StickerMapper;
	
	@Override
	public ArrayList<String> selectStickerDate(String userId) {
		
		return StickerMapper.selectStickerDate(userId);
	}

	@Override
	public int selectDiary(int kidsNo) {
		
		return StickerMapper.selectDiary(kidsNo);
	}
	
	@Override
	public int deleteSticker(int kidsNo) {
		
		return StickerMapper.deleteSticker(kidsNo);
	}

	@Override
	public int insertSticker(int kidsNo, int stickerCount) {
		
		return StickerMapper.insertSticker(kidsNo, stickerCount);
	}

	
}
