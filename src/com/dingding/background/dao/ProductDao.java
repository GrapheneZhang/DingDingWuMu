package com.dingding.background.dao;

import java.util.List;

import com.dingding.background.domin.Product;

public interface ProductDao {

		
			/**
			 * Product的dao层接口
			 * @author zcs
			 * 2014-9-17
			 */
		
			/**
			 * 添加产品
			 * @param Product对象
			 */
			public void add(Product  picture);
			
			/**
			 * 删除产品，仅仅是将该产品的状态进行改变为0不显示
			 * @param id 日志的id
			 */
			public void delete(int id);
			
			/**
			 * 修改产品
			 * @param Product对象
			 */
			public void update(Product product);
			
			/**
			 * 查询所有产品
			 */
			public List<Product> selectAll();
			
			/**
			 * 查询产品(根据类别)
			 * @param proTypeName 类别名
			 */
			public List<Product> selectType(String proTypeName);
			
			/**
			 * 查询产品(根据产品名)
			 * @param proName 产品名
			 */
			public List<Product> selectName(String proName);
}
