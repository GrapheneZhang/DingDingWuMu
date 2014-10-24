package com.dingding.background.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.dingding.background.domain.Words;

public interface WordsService {

	
			/**
			 * Words的service层接口
			 * @author zcs
			 * 2014-9-17
			 */
		
			/**
			 * 添加留言
			 * @param Words对象
			 */
			public void add(Words words);
			
			/**
			 * 删除留言
			 * @param id 留言的id
			 */
			public void delete(int id);
			
			/**
			 * 修改留言（暂时不用）
			 * @param id 留言的id
			 */
			//public void update(int id);
			
			/**
			 * 查询所有留言
			 */
			public List<Words> selectAll();
			
			/**
			 * 查询根据日期查询留言
			 */
			public List<Words> selectDate(Map<String, Date> map);
}
