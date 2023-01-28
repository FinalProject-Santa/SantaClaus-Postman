package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.KidFileDto;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.StickerDto;

public interface KidsBiz {
	List<KidsDto> selectAll();
	int add(KidsDto dto);
	int addmail(KidsDto dto);
	int addFile(KidFileDto file);
	int addFile2(KidFileDto file);
	int update(KidsDto dto);
	int fileModify(KidFileDto file);
	int delete(KidsDto dto);
	int delete(KidFileDto file);
	int deleteSticker(StickerDto sticker);
	List<StickerDto> sticker();
	
}
