package com.boot.jdbc.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.jdbc.model.dao.TreeMapper;
import com.boot.jdbc.model.dto.OrnaDto;

@Service
public class TreeBizImpl implements TreeBiz{
	
	@Autowired
	private TreeMapper treeMapper;

	@Override
	public OrnaDto selectOne(String or_id) {
		// TODO Auto-generated method stub
		return treeMapper.selectOne(or_id);
	}

}
