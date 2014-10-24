package com.dingding.background.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingding.background.base.BaseController;
import com.dingding.background.domain.OperateLog;
import com.dingding.background.service.OperateLogService;

/**
 * OperateLog的Controller层接口
 * @author zcs
 * 2014-9-21
 */
@Controller
@RequestMapping(value="/opLogController")//此类全局路径
public class OperateLogController extends BaseController {

			@Resource
			public OperateLogService operateLogService;
			
			//添加管理员操作日志
			@RequestMapping(value="/add")
			public String add(){
						
						//获取管理员操作日志信息
						OperateLog operateLog=new OperateLog();
						
						//调用service层
						operateLogService.add(operateLog);
						System.out.println("添加数据成功");
						return "test/success";
			}
			
			//删除管理员操作日志
			@RequestMapping(value="/delete")
			public String delete(){
						
						//获取管理员操作日志id
						int id=9;
						//调用service层
						operateLogService.delete(id);
						System.out.println("删除数据成功");
						return "test/success";
			}
			
			//查询管理员操作日志
			@RequestMapping(value="/selectAll")
			public String selectAll(){
						
						//获取管理员操作日志数据,调用service层
				 		List<OperateLog> operateLog=operateLogService.selectAll();
						
						System.out.println("获取数据成功");
						return "test/success";
		}
	
		//查询管理员操作日志(根据姓名)
		@RequestMapping(value="/selectLoginName")
		public String selectLoginName(){
					
					//获取管理员名
					String name=null;
					//调用service层
			 		List<OperateLog> operateLog=operateLogService.selectLoginName(name);
					
					System.out.println("获取数据成功");
					return "test/success";
		}
		
		//查询管理员操作日志(根据日期)
				@RequestMapping(value="/selectDateTitle")
				public String selectDateTitle(){
							
							//获取日期数据
							Map<String, Date> map=null;
							//调用service层
					 		List<OperateLog> operateLog=operateLogService.selectDateTitle(map);
							
							System.out.println("获取数据成功");
							return "test/success";
				}
}
