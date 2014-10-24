package com.dingding.background.service;

import java.util.List;

import com.dingding.background.domain.Tech;

public interface TechService {

	
			/**
			 * Tech的service层接口
			 * @author zcs
			 * 2014-9-17
			 */
		
			/**
			 * 添加知识库
			 * @param Tech对象
			 */
			public void add(Tech  tech);
			
			/**
			 * 删除知识库
			 * @param id 知识库的id
			 */
			public void delete(int id);
			
			/**
			 * 修改产品
			 * @param Tech对象
			 */
			public void update(Tech tech);
			
			/**
			 * 查询所有知识库
			 */
			public List<Tech> selectAll();
}
