package com.dingding.background.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingding.background.base.BaseServiceImpl;
import com.dingding.background.domain.Tech;
import com.dingding.background.service.TechService;

@Service
public class TechServiceImpl  extends BaseServiceImpl implements TechService{

			
			//@Override
			public void add(Tech tech) {
						techDao.add(tech);
			}
		
			//@Override
			public void delete(int id) {
						techDao.delete(id);
			}
		
			//@Override
			public void update(Tech tech) {
						techDao.update(tech);
			}
		
			//@Override
			public List<Tech> selectAll() {
						List<Tech>  techList=techDao.selectAll();
						return techList;
			}

}
