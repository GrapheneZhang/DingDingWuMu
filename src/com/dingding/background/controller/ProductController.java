package com.dingding.background.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingding.background.base.BaseController;
import com.dingding.background.domin.Product;
import com.dingding.background.service.ProductService;

/**
 * Product的Controller层接口
 * @author zcs
 * 2014-9-21
 */
@Controller
@RequestMapping(value="/productController")//此类全局路径
public class ProductController extends BaseController{

	@Resource
	public ProductService productService;
	
	//添加产品
	@RequestMapping(value="/add")
	public String add(){
				
				//获取产品信息
				Product product=new Product();
				//调用service层
				productService.add(product);
				System.out.println("添加数据成功");
				return "test/success";
	}
	
	//删除产品
	@RequestMapping(value="/delete")
	public String delete(){
				
				//获取产品id
				int id=9;
				//调用service层
				productService.delete(id);
				System.out.println("删除数据成功");
				return "test/success";
	}
	
	//更新产品
	@RequestMapping(value="/update")
	public String update(){
				
				//获取产品信息
				Product product=new Product();

				product.setId(1);
				//调用service层
				productService.update(product);
				System.out.println("更新数据成功");
				return "test/success";
	}
	
	//查询产品
	@RequestMapping(value="/selectAll")
	public String selectAll(){
				
				//获取产品数据,调用service层
		 		List<Product>product=productService.selectAll();
				
				System.out.println("获取数据成功");
				return "test/success";
	}
	
	//查询产品（根据类别）
		@RequestMapping(value="/selectType")
		public String selectType(){
					
					//获取产品类别
					String typeName=null;
					//获取产品数据,调用service层
			 		List<Product>product=productService.selectType(typeName);
					
					System.out.println("获取数据成功");
					return "test/success";
		}
		
				//查询产品（根据产品名）
				@RequestMapping(value="/selectName")
				public String selectName(){
							
							//获取产品产品名
							String name=null;
							//获取产品数据,调用service层
					 		List<Product>product=productService.selectName(name);
							
							System.out.println("获取数据成功");
							return "test/success";
				}
}
