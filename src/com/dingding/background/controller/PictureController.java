package com.dingding.background.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingding.background.base.BaseController;
import com.dingding.background.domin.Picture;
import com.dingding.background.service.PictureService;

/**
 * Picture的Controller层接口
 * @author zcs
 * 2014-9-21
 */
@Controller
@RequestMapping(value="/pictureController")//此类全局路径
public class PictureController  extends BaseController{

	@Resource
	public PictureService pictureService;
	
	//添加图片
	@RequestMapping(value="/add")
	public String add(){
				
				//获取图片信息
				Picture Picture=new Picture();
				//调用service层
				pictureService.add(Picture);
				System.out.println("添加数据成功");
				return "test/success";
	}
	
	//删除图片
	@RequestMapping(value="/delete")
	public String delete(){
				
				//获取图片id
				int id=9;
				//调用service层
				pictureService.delete(id);
				System.out.println("删除数据成功");
				return "test/success";
	}
	
	//更新图片
	@RequestMapping(value="/update")
	public String update(){
				
				//获取图片信息
				Picture picture=new Picture();

				picture.setId(1);
				//调用service层
				pictureService.update(picture);
				System.out.println("更新数据成功");
				return "test/success";
	}
	
	//查询图片
	@RequestMapping(value="/selectAll")
	public String selectAll(){
				
				//获取图片数据,调用service层
		 		List<Picture>picture=pictureService.selectAll();
				
				System.out.println("获取数据成功");
				return "test/success";
	}
	
	//查询图片（根据类别）
		@RequestMapping(value="/selectType")
		public String selectType(){
					
					//获取图片类别
					String typeName=null;
					//获取图片数据,调用service层
			 		List<Picture>picture=pictureService.selectType(typeName);
					
					System.out.println("获取数据成功");
					return "test/success";
		}
}
