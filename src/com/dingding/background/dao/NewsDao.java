package com.dingding.background.dao;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dingding.background.domain.News;

/**
 * News的dao层接口
 * @author zcs
 * 2014-9-17
 */
public interface NewsDao{
	
	public List<News> list(News news);//1 条件查询
	
	public News getById(int id);//2 获取：通过Id
	
	public Integer add(News news);//3 添加
	public Integer delete(int id);//4 删除
	public Integer update(News news);//5 修改管理员属性，当然是不能修改权限的
	
	public List<News> selectAllTitle();//查询所有新闻标题
	public List<News> selectDateTitle(Map<String, Date> map);//查询根据发布日期查询新闻标题
}
