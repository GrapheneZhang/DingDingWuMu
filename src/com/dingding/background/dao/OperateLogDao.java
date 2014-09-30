package com.dingding.background.dao;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.dingding.background.domin.OperateLog;

public interface OperateLogDao{

		/**
		 * OperateLog的dao层接口
		 * @author zcs
		 * 2014-9-17
		 */
	
		/**
		 * 添加日志记录
		 * @param OperateLog对象
		 */
		public void add(OperateLog operateLog);
		
		/**
		 * 删除日志记录
		 * @param id 日志的id
		 */
		public void delete(int id);
		
		/**
		 * 修改日志记录（暂时不用，日志不能修改）
		 * @param id 日志的id
		 */
		//public void update(OperateLog operateLog);
		
		/**
		 * 查询所有日志（提取出来的数据是全部的日志，页面可以进行有选择的显示）
		 */
		public List<OperateLog> selectAll();
		
		/**
		 * 查询，根据管理员登录名
		 */
		public List<OperateLog> selectLoginName(String loginName);
		
		/**
		 * 查询，根据操作时间进行查询
		 */
		public List<OperateLog>  selectDateTitle(Map<String, Date> map);
		
		
}
