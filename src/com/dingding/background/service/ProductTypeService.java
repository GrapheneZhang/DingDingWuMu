package com.dingding.background.service;

import java.util.List;

import com.dingding.background.domin.ProductType;

public interface ProductTypeService {

	
			/**
			 * ProductType的service层接口
			 * @author zcs
			 * 2014-9-17
			 */
		
			/**
			 * 添加产品类别
			 * @param ProductType对象
			 */
			public void add(ProductType  productType);
			
			/**
			 * 删除该产品类别（内部会将该产品类型的状态改为0不显示，那么就会级联到产品和图片）
			 * @param id 产品的id
			 */
			public void delete(int id);
			
			/**
			 * 修改产品
			 * @param ProductType对象
			 */
			public void update(ProductType productType);
			
			/**
			 * 查询所有产品类型
			 */
			public List<ProductType> selectAll();
			
			/**
			 * 查询产品(产出父类别下的所有子类别，查询到的是一个子类别的list集合)
			 * @param id 父类别id
			 */
			public List<ProductType> selectType(int  id);
}
