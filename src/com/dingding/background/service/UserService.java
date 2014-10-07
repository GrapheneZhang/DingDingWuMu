package com.dingding.background.service;

import java.util.List;

import com.dingding.background.domin.User;

public interface UserService {

	//public List<User> selectAll();1.1 查询所有管理员
	public List<User> list(User user);//1.2 条件查询
	
	public User getById(int id);//2 获取：通过Id
	
	public boolean add(User user);//3 添加
	public boolean delete(int id);//4 删除
	public boolean update(User user);//5 修改管理员属性，当然是不能修改权限的
	
	public boolean countByLoginName(String loginName);//6.1 loginName唯一性验证
	public boolean countByIdCard(String idCard);//6.2 idCard唯一性验证
	
	//登录相关
	public User login(User user);//登录
}
