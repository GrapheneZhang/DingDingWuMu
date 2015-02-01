package com.dingding.background.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingding.background.base.BaseController;
import com.dingding.background.domain.Words;
import com.dingding.background.service.WordsService;

/**
 * Words的Controller层接口
 * @author zcs
 * 2014-9-21
 */
@Controller
@RequestMapping(value="/wordsController")//此类全局路径
public class WordsController extends BaseController{

	@Resource
	public WordsService wordsService;
	
	//添加留言
	@RequestMapping(value="/add")
	public String add(){
		//获取留言信息
		Words words=new Words();
		//调用service层
		wordsService.add(words);
		System.out.println("添加数据成功");
		return "test/success";
	}
	
	//删除留言
	@RequestMapping(value="/delete")
	public String delete(){
		//获取留言id
		int id=9;
		//调用service层
		wordsService.delete(id);
		System.out.println("删除数据成功");
		return "test/success";
	}
	
}
