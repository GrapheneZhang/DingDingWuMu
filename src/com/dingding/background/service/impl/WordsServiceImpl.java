package com.dingding.background.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dingding.background.base.BaseServiceImpl;
import com.dingding.background.domain.Words;
import com.dingding.background.service.WordsService;

@Service
public class WordsServiceImpl extends BaseServiceImpl implements WordsService {

			
			//@Override
			public void add(Words words) {
						wordsDao.add(words);
			}
		
			//@Override
			public void delete(int id) {
						wordsDao.delete(id);
			}
		
			//@Override
			public List<Words> selectAll() {
					List<Words> wordsList=wordsDao.selectAll();
					return wordsList;
			}
		
			//@Override
			public List<Words> selectDate(Map<String, Date> map) {
						List<Words> wordsList=wordsDao.selectDate(map);
						return wordsList;
			}

}
