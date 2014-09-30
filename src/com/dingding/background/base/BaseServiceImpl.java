package com.dingding.background.base;

import javax.annotation.Resource;

import org.apache.commons.logging.*;

import com.dingding.background.dao.NewsDao;
import com.dingding.background.dao.OperateLogDao;
import com.dingding.background.dao.PictureDao;
import com.dingding.background.dao.ProductDao;
import com.dingding.background.dao.ProductTypeDao;
import com.dingding.background.dao.TechDao;
import com.dingding.background.dao.UserDao;
import com.dingding.background.dao.WordsDao;

/**
 * @author	 zcs
 * 
 * 目前该类的作用是加载所有Dao层接口的实现，以便后续使用，貌似也可以使用class<T>的方式，后期研究再看看吧
 * 
 * */
public abstract  class BaseServiceImpl {

			//日志信息类
			protected   static Log log = LogFactory.getLog(BaseServiceImpl.class);
			
			//dao层类
			protected	NewsDao newsDao;
			protected   OperateLogDao operateLogDao;
			protected	PictureDao pictureDao;
			protected	ProductDao productDao;
			protected	ProductTypeDao productTypeDao;
			protected	TechDao techDao;
			protected	UserDao userDao;
			protected	WordsDao wordsDao;
			
			@Resource
			public void setNewsDao(NewsDao newsDao) {
				this.newsDao = newsDao;
			}
			
			@Resource
			public void setOperateLogDao(OperateLogDao operateLogDao) {
				this.operateLogDao = operateLogDao;
			}
			
			@Resource
			public void setPictureDao(PictureDao pictureDao) {
				this.pictureDao = pictureDao;
			}
			
			@Resource
			public void setProductDao(ProductDao productDao) {
				this.productDao = productDao;
			}
			
			@Resource
			public void setProductTypeDao(ProductTypeDao productTypeDao) {
				this.productTypeDao = productTypeDao;
			}
			
			@Resource
			public void setTechDao(TechDao techDao) {
				this.techDao = techDao;
			}
			
			@Resource
			public void setUserDao(UserDao userDao) {
				System.out.println("实际证明实体类mapper确实找到了有实体类xml文件生产的实现类");
				this.userDao = userDao;
			}
			
			@Resource
			public void setWordsDao(WordsDao wordsDao) {
				this.wordsDao = wordsDao;
			}
		
}
