package com.dingding.background.service;

import java.util.List;

import com.dingding.background.domain.Picture;

public interface PictureService {

	
			/**
			 * Picture的service层接口
			 * @author zcs
			 * 2014-9-17
			 */
		
			/**
			 * 添加图片到素材库，在Picture表中存放的是图片在服务器上的地址
			 * @param Picture对象
			 */
			public void add(Picture picture);
			
			/**
			 * 删除图片
			 * @param id 日志的id
			 */
			public void delete(int id);
			
			/**
			 * 修改图片
			 * @param Picture对象
			 */
			public void update(Picture picture);
			
			/**
			 * 查询所有图片
			 */
			public List<Picture> selectAll();
			
			/**
			 * 查询所有图片(根据类别)
			 * @param proTypeName 类别名
			 */
			public List<Picture> selectType(String proTypeName);
}
