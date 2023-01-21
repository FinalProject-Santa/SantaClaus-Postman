package com.boot.jdbc.model.biz;

import java.util.List;

import com.boot.jdbc.model.dto.KidFileDto;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.StickerDto;

public interface KidsBiz {
	List<KidsDto> selectAll();
	int add(KidsDto dto);
	int addFile(KidFileDto file);
	int modify(KidsDto dto);
	int fileModify(KidFileDto file);
	int delete(KidsDto dto);
	int delete(KidFileDto file);
	List<StickerDto> sticker();
	
	
}
