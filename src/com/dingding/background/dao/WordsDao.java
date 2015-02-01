package com.dingding.background.dao;
import java.util.List;
import java.util.Map;

import com.dingding.background.domain.Words;

public interface WordsDao{
	public List<Words> list(Map<String,Object> map);//1 条件查询
	
	public Words getById(int id);//2 获取：通过Id
	
	public Integer add(Words words);//3 添加
	public Integer delete(int id);//4 删除
	//public Integer update(Words words);//5 修改管理员属性，当然是不能修改权限的
}
