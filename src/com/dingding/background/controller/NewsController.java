package com.dingding.background.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dingding.background.base.BaseController;
import com.dingding.background.domain.News;
import com.dingding.background.domain.User;
import com.dingding.background.service.NewsService;
import com.dingding.utils.Constants;
import com.dingding.utils.page.PageHelper;
import com.dingding.utils.page.PageInfo;

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
	public ModelAndView mav;//模型视图
	
	
	/*****************ProcessingStart******************/
	
	/**1
	 * Describe:条件查询
	 * Parameters:
	 * @return:ModelAndView
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(HttpServletRequest req,News news){
		mav=new ModelAndView("background/news/newslist");
		try {
			String str_pageNum = req.getParameter("pageNum")==null?"1":req.getParameter("pageNum");
			String str_pageSize = req.getParameter("pageSize")==null?"10":req.getParameter("pageSize");
			int pageNum = 0,pageSize = 0;
			pageNum = Integer.parseInt(str_pageNum);
			pageSize = Integer.parseInt(str_pageSize);
			// 分页:页码，每页显示数量
			PageHelper.startPage(pageNum, pageSize);
			
			//条件
			Map<String,Object> map=new HashMap<String,Object>();
			if(StringUtils.isNotBlank(news.getTitle()))
				map.put("title", news.getTitle());
			if(StringUtils.isNotBlank(news.getContent()))
				map.put("content", news.getContent());
			if(StringUtils.isNotBlank(news.getAuthorName()))
				map.put("authorName", news.getAuthorName());
			if(StringUtils.isNotBlank(news.getCreateTimeStart()))
				map.put("createTimeStart", news.getCreateTimeStart());
			if(StringUtils.isNotBlank(news.getCreateTimeEnd()))
				map.put("createTimeEnd", news.getCreateTimeEnd());
			
			//操作
			List<News> newsList=newsService.list(map);
			
			PageInfo<News> page = new PageInfo<News>(newsList);
			mav.addObject("newsList", newsList);
			mav.addObject("news", news);//条件查询
			mav.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	/**1
	 * Describe:条件查询
	 * Parameters:
	 * @return:ModelAndView
	
	@RequestMapping(value="/list")
	public ModelAndView list(HttpServletRequest req,News news){
		mav=new ModelAndView("background/news/newslist");
		try {
			String str_pageNum = req.getParameter("pageNum")==null?"1":req.getParameter("pageNum");
			String str_pageSize = req.getParameter("pageSize")==null?"10":req.getParameter("pageSize");
			
			int pageNum = 0,pageSize = 0;
			
			pageNum = Integer.parseInt(str_pageNum);
			pageSize = Integer.parseInt(str_pageSize);
			// 分页:页码，每页显示数量
			PageHelper.startPage(pageNum, pageSize);
			
			//操作
			List<News> newsList=newsService.list(news);
			
			PageInfo<News> page = new PageInfo<News>(newsList);
			mav.addObject("newsList", newsList);
			mav.addObject("news", news);//条件查询
			mav.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	 */
	
	/**2.1
	 * Describe:新增页面
	 * Parameters:
	 * @return:ModelAndView
	 */
	@RequestMapping(value="/addUI")
	public String addUI(){
		return "background/news/newsadd";
	}
	/**2.2
	 * Describe:新增
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/add")
	public String add(News news,
			HttpServletRequest request){
		try {
			User user=(User)request.getSession().getAttribute(Constants.SESSION_KEY_CURRENT_USER);
			news.setAuthorId(user.getId());
			newsService.add(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/news/list";
	}
	
	/**3
	 * Describe:删除
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/delete")
	public String delete(int id){
		try {
			newsService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/news/list";
	}
	
	/**4.1
	 * Describe:修改页面
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/updateUI")
	public ModelAndView updateUI(int id){
		mav=new ModelAndView("background/news/newsupdate");
		try {
			News news=newsService.getById(id);
			mav.addObject("news", news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	/**4.2
	 * Describe:修改
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/update")
	public String update(HttpServletResponse response,News news){
		try {
			newsService.update(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/news/list";
	}
}