package com.dingding.background.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingding.background.base.BaseServiceImpl;
import com.dingding.background.domin.User;
import com.dingding.background.service.UserService;

@Service
public class UserServiceImpl  extends BaseServiceImpl implements UserService{

	/**1
	 * Describe:条件查询
	 * Parameters:
	 * @return:ModelAndView
	 */
	public List<User> list(User user) {
		return userDao.list(user);
	}

	/**2.1
	 * Describe:getById
	 * Parameters:
	 * @return:User
	 */
	public User getById(int id) {
		return userDao.getById(id);
	}

	/**3
	 * Describe:新增
	 * Parameters:
	 * @return:Integer
	 */
	public boolean add(User user) {
		boolean result=false;
		try {
			Integer rows=userDao.add(user);
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
			Integer rows=userDao.delete(id);
			if(rows>0)
				result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**5
	 * Describe:修改
	 * Parameters:
	 * @return:ModelAndView
	 */
	public boolean update(User user) {
		boolean result=false;
		try {
			Integer rows=userDao.update(user);
			if(rows>0)
				result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**6.1
	 * Describe:登录
	 * Parameters:
	 * @return:User
	 */
	public User login(User user) {
		return userDao.getByLoginNameAndPassword(user);
	}

	
	/**10 唯一性验证**/
	public boolean countByLoginName(String loginName) {
		boolean result=true;
		try {
			Integer num=userDao.countByLoginName(loginName);
			if(num>0)
				result=false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public boolean countByIdCard(String idCard) {
		boolean result=true;
		try {
			Integer num=userDao.countByIdCard(idCard);
			if(num>0)
				result=false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}