package com.dingding.background.dao;

import java.util.List;

import com.dingding.background.domin.User;

/**
 * User的dao层接口
 * @author zcs
 * 2014-9-17
 */
public interface UserDao {
		
	//public List<User> selectAll();1.1 查询所有管理员
	public List<User> list(User user);//1.2 条件查询
	
	public User getById(int id);//2 获取：通过Id
	
	public Integer add(User user);//3 添加
	public Integer delete(int id);//4 删除
	public Integer update(User user);//5 修改管理员属性，当然是不能修改权限的
	
	//登录相关
	public User getByLoginNameAndPassword(User user);//6.1登录
	
	public Integer countByLoginName(String loginName);//10.1 loginName唯一性验证
	public Integer countByIdCard(String idCard);//10.2 idCard唯一性验证
	
}
