package com.dingding.background.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingding.background.base.BaseServiceImpl;
import com.dingding.background.domin.ProductType;
import com.dingding.background.service.ProductTypeService;

@Service
public class ProductTypeServiceImpl extends BaseServiceImpl implements ProductTypeService {

			
			//@Override
			public void add(ProductType productType) {
						productTypeDao.add(productType);
			}
		
			//@Override
			public void delete(int id) {
						productTypeDao.delete(id);
			}
		
			//@Override
			public void update(ProductType productType) {
						productTypeDao.update(productType);
			}
		
			//@Override
			public List<ProductType> selectAll() {
						List<ProductType> proTypeLsit=productTypeDao.selectAll();
						return proTypeLsit;
			}
		
			//@Override
			public List<ProductType> selectType(int id) {
						List<ProductType> proTypeLsit=productTypeDao.selectType(id);
						return proTypeLsit;
			}

}
