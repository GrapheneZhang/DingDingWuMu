package com.dingding.background.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingding.background.base.BaseServiceImpl;
import com.dingding.background.domain.Product;
import com.dingding.background.service.ProductService;

@Service
public class ProductServiceImpl  extends BaseServiceImpl implements ProductService{

			//@Override
			public void add(Product product) {
						productDao.add(product);
			}
		
			//@Override
			public void delete(int id) {
						productDao.delete(id);	
			}
		
			//@Override
			public void update(Product product) {
						productDao.update(product);
			}
		
			//@Override
			public List<Product> selectAll() {
						List<Product> proLsit=productDao.selectAll();
						return proLsit;
			}
		
			//@Override
			public List<Product> selectType(String proTypeName) {
						List<Product> proLsit=productDao.selectType(proTypeName);
						return proLsit;
			}
		
			//@Override
			public List<Product> selectName(String proName) {
						List<Product> proLsit=productDao.selectName(proName);
						return proLsit;
			}

}
