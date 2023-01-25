package com.boot.jdbc.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.KidsMapper;
import com.boot.jdbc.model.dto.KidFileDto;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;
import com.boot.jdbc.model.dto.StickerDto;


@Service
public class KidsBizImpl implements KidsBiz {

	@Autowired KidsMapper kidsmapper;
	
	
	@Override
	public List<KidsDto> selectAll() {
		return kidsmapper.allKids();
	}

	@Override
	public int add(KidsDto dto) {
		return kidsmapper.add(dto);
	}

	@Override
	public int addFile(KidFileDto file) {
		return kidsmapper.addFile(file);
	}

	@Override
	public int modify(KidsDto dto) {
		return kidsmapper.modify(dto);
	}

	@Override
	public int fileModify(KidFileDto file) {
		return kidsmapper.addFile(file);
	}

	@Override
	public int delete(KidsDto dto) {
		return kidsmapper.delete(dto);
	}

	@Override
	public int delete(KidFileDto file) {
		return kidsmapper.deletefile(file);
	}

	@Override
	public List<StickerDto> sticker() {
		return kidsmapper.sticker();
	}

	@Override
	public int addmail(KidsDto dto) {
		return kidsmapper.addmail(dto);
	}


}
