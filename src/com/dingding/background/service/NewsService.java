package com.dingding.background.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dingding.background.domin.News;
/**
 * News的service层接口
 * @author zcs
 * 2014-9-17
 */
public interface NewsService {

	public List<News> list(News news);//1 条件查询
	
	public News getById(int id);//2 获取：通过Id
	
	public boolean add(News news);//3 添加
	public boolean delete(int id);//4 删除
	public boolean update(News news);//5 修改标题和内容
	
	public List<News> selectAllTitle();//查询所有新闻标题
	public List<News> selectDateTitle(Map<String, Date> map);//查询根据发布日期查询新闻标题
}
