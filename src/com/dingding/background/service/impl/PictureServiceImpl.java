package com.dingding.background.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingding.background.base.BaseServiceImpl;
import com.dingding.background.domain.Picture;
import com.dingding.background.service.PictureService;

@Service
public class PictureServiceImpl  extends BaseServiceImpl implements PictureService{

			
			//@Override
			public void add(Picture picture) {
						pictureDao.add(picture);
			}
		
			//@Override
			public void delete(int id) {
						pictureDao.delete(id);
			}
		
			//@Override
			public void update(Picture picture) {
						pictureDao.update(picture);
			}
		
			//@Override
			public List<Picture> selectAll() {
						List<Picture> picList=pictureDao.selectAll();
						return picList;
			}
		
			//@Override
			public List<Picture> selectType(String proTypeName) {
						List<Picture> picList=pictureDao.selectType(proTypeName);
						return picList;
			}

	
			
}
