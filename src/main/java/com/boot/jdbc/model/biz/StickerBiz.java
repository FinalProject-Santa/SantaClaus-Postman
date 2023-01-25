package com.boot.jdbc.model.biz;

import java.util.ArrayList;

public interface StickerBiz {

		//칭찬스티커
		public ArrayList<String> selectStickerDate(String userId);
		public int selectDiary(int kidsNo);
		public int deleteSticker(int kidsNo);
		public int insertSticker(int kidsNo, int stickerCount);
}
