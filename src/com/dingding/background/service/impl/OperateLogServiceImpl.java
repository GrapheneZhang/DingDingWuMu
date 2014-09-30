package com.dingding.background.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dingding.background.base.BaseServiceImpl;
import com.dingding.background.domin.OperateLog;
import com.dingding.background.service.OperateLogService;

@Service
public class  OperateLogServiceImpl  extends BaseServiceImpl implements OperateLogService{

			
			//@Override
			public void add(OperateLog operateLog) {
						operateLogDao.add(operateLog);
			}
		
			//@Override
			public void delete(int id) {
						operateLogDao.delete(id);
			}
		
			//@Override
			public List<OperateLog> selectAll() {
							
						List<OperateLog> olList=operateLogDao.selectAll();
						return olList;
			}
		
			//@Override
			public List<OperateLog> selectLoginName(String loginName) {

						List<OperateLog> olList=operateLogDao.selectLoginName(loginName);
						return olList;
			}
		
			//@Override
			public List<OperateLog> selectDateTitle(Map<String, Date> map) {
			
						List<OperateLog> olList=operateLogDao.selectDateTitle(map);
						return olList;
			}

}
