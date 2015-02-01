package com.dingding.background.service;

import java.util.List;
import java.util.Map;

import com.dingding.background.domain.Words;

public interface WordsService {

	public List<Words> list(Map<String,Object> map);//1 条件查询
	
	public Words getById(int id);//2 获取：通过Id
	
	public boolean add(Words words);//3 添加
	public boolean delete(int id);//4 删除
}
