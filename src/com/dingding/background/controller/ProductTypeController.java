package com.dingding.background.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingding.background.base.BaseController;
import com.dingding.background.domain.ProductType;
import com.dingding.background.service.ProductTypeService;

/**
 * ProductType的Controller层接口
 * @author zcs
 * 2014-9-21
 */
@Controller
@RequestMapping(value="/proTypeController")//此类全局路径
public class ProductTypeController extends BaseController{

	@Resource
	public ProductTypeService productTypeService;
	
	//添加产品类别
	@RequestMapping(value="/add")
	public String add(){
				
				//获取产品类别信息
				ProductType productType=new ProductType();
				//调用service层
				productTypeService.add(productType);
				System.out.println("添加数据成功");
				return "test/success";
	}
	
	//删除产品类别
	@RequestMapping(value="/delete")
	public String delete(){
				
				//获取产品类别id
				int id=9;
				//调用service层
				productTypeService.delete(id);
				System.out.println("删除数据成功");
				return "test/success";
	}
	
	//更新产品类别
	@RequestMapping(value="/update")
	public String update(){
				
				//获取产品类别信息
				ProductType productType=new ProductType();

				productType.setId(1);
				//调用service层
				productTypeService.update(productType);
				System.out.println("更新数据成功");
				return "test/success";
	}
	
	//查询产品类别
	@RequestMapping(value="/selectAll")
	public String selectAll(){
				
				//获取产品类别数据,调用service层
		 		List<ProductType>productType=productTypeService.selectAll();
				
				System.out.println("获取数据成功");
				return "test/success";
	}
	
	//查询产品类别（根据类别）
		@RequestMapping(value="/selectType")
		public String selectType(){
					
					//获取产品类别父类的id
					int id=9;
					//获取产品类别数据,调用service层
			 		List<ProductType>productType=productTypeService.selectType(id);
					
					System.out.println("获取数据成功");
					return "test/success";
		}
}
