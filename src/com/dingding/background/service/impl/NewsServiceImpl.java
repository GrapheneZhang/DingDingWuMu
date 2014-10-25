package com.dingding.background.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dingding.background.base.BaseServiceImpl;
import com.dingding.background.domain.News;
import com.dingding.background.service.NewsService;

/**
 * Describe:
 * @author ZhangYaxu
 * 2014年9月30日
 */
@Service
public class NewsServiceImpl extends BaseServiceImpl implements NewsService{

	/**1
	public List<News> list(News news) {
		return newsDao.list(news);
	}*/
	/**1
	 * Describe:条件查询
	 * Parameters:
	 * @return:ModelAndView
	 */
	public List<News> list(Map<String,Object> map) {
		return newsDao.list(map);
	}

	/**2.1
	 * Describe:getById
	 * Parameters:
	 * @return:User
	 */
	public News getById(int id) {
		return newsDao.getById(id);
	}

	/**3
	 * Describe:新增
	 * Parameters:
	 * @return:Integer
	 */
	public boolean add(News news) {
		boolean result=false;
		try {
			Integer rows=newsDao.add(news);
			if(rows>0)
				result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**4
	 * Describe:删除
	 * Parameters:
	 * @return:
	 */
	public boolean delete(int id) {
		boolean result=false;
		try {
			Integer rows=newsDao.delete(id);
			if(rows>0)
				result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**5
	 * Describe:修改
	 * Parameters:
	 * @return:ModelAndView
	 */
	public boolean update(News news) {
		boolean result=false;
		try {
			Integer rows=newsDao.update(news);
			if(rows>0)
				result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<News> selectAllTitle() {
		return null;
	}

	public List<News> selectDateTitle(Map<String, Date> map) {
		return null;
	}
}
