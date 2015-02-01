package com.dingding.background.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dingding.background.base.BaseServiceImpl;
import com.dingding.background.domain.Words;
import com.dingding.background.service.WordsService;

@Service
public class WordsServiceImpl extends BaseServiceImpl implements WordsService {

	/**1
	 * Describe:条件查询
	 * Parameters:
	 * @return:ModelAndView
	 */
	public List<Words> list(Map<String, Object> map) {
		return wordsDao.list(map);
	}

	/**2.1
	 * Describe:getById
	 * Parameters:
	 * @return:User
	 */
	public Words getById(int id) {
		return wordsDao.getById(id);
	}

	/**3
	 * Describe:新增
	 * Parameters:
	 * @return:Integer
	 */
	public boolean add(Words words) {
		boolean result=false;
		try {
			Integer rows=wordsDao.add(words);
			if(rows>0)
				result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**4
	 * Describe:删除
	 * Parameters:
	 * @return:
	 */
	public boolean delete(int id) {
		boolean result=false;
		try {
			Integer rows=wordsDao.delete(id);
			if(rows>0)
				result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
