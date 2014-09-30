package com.dingding.background.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingding.background.base.BaseController;
import com.dingding.background.domin.News;
import com.dingding.background.service.NewsService;

/**
 * News的Controller层接口
 * @author zcs
 * 2014-9-21
 */
@Controller
@RequestMapping(value="/news")//此类全局路径
public class NewsController extends BaseController{

	@Resource
	public NewsService newsService;
	
	//添加新闻
	@RequestMapping(value="/add")
	public String add(){
		//获取新闻信息
		News news=new News();
		news.setAuthorName("张春生");
		news.setAuthorId(3);
		news.setContent("这是一个测试日期查询的例子");
		news.setTitle("日期查询测试");
		//获取当前时间
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String date=dateFormat.format(new java.util.Date());
		log.debug("当前日期为："+date);
		
		try {
					news.setCreateTime(dateFormat.parse(date));
		} catch (ParseException e) {
					e.printStackTrace();
		}			
		//调用service层
		newsService.add(news);
		System.out.println("添加数据成功");
		return "test/success";
	}
	
	//删除新闻
	@RequestMapping(value="/delete")
	public String delete(){
				
		//获取新闻id
		int id=4;
		//调用service层
		newsService.delete(id);
		System.out.println("删除数据成功");
		return "test/success";
	}
	
	//更新新闻
	@RequestMapping(value="/update")
	public String update(){
				
		//获取新闻信息
		News news=new News();
		news.setId(4);
		//调用service层
		newsService.update(news);
		System.out.println("更新数据成功");
		return "test/success";
	}
	
	//查询新闻
	@RequestMapping(value="/selectAllTitle")
	public String selectAllTitle(){
				
		//获取新闻数据,调用service层
 		List<News> news=newsService.selectAllTitle();
		log.debug("selectAllTitle获取的数据信息：");

		for (News oddNews : news){
			
					log.debug("新闻标题:"+oddNews.getTitle());
					Date date=oddNews.getCreateTime();
					log.debug("创建时间："+date);
		}
		System.out.println("获取数据成功");
		return "test/success";
	}
	
		//查询新闻(根据日期)
		@RequestMapping(value="/selectDateTitle")
		public String selectDateTitle(){
					
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
			//获取日期数据
			Map<String, Date> map=new HashMap();
			try {
						//获取开始和结束时间
						Date begin=dateFormat.parse("2014-09-23");
						log.debug("begin-----------------"+begin);
						Date end=dateFormat.parse("2014-09-24");
						log.debug("end-----------------"+end);
						
						map.put("begin", begin);
						map.put("end", end);
						log.debug("放入map数据");
			} catch (ParseException e) {
				e.printStackTrace();
			}
				
			//调用service层
			log.debug("调用service");
	 		List<News> news=newsService.selectDateTitle(map);
			
	 		log.debug("selectDateTitle获取的数据信息：");

			for (News oddNews : news){
				
						log.debug("新闻标题:"+oddNews.getTitle());
						Date date=oddNews.getCreateTime();
						log.debug("创建时间："+date);
			}
			System.out.println("获取数据成功");
			return "test/success";
		}
		
		/*//查询新闻(根据日期)
		@RequestMapping(value="/selectOddDetail")
		public String selectOddDetail(){
					
			//获取(新闻id)
			int id=9;
			//调用service层
	 		News news=newsService.selectOddDetail(id);
			
			System.out.println("获取数据成功");
			return "test/success";
		}*/
}
