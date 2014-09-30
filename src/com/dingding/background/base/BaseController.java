package com.dingding.background.base;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author	 zcs
 * 
 * 目前该类只是包含了一个日志信息处理类，以便与子类直接使用
 * 
 * */
public abstract class BaseController {

	
			//日志信息类
			protected   static Log log = LogFactory.getLog(BaseController.class);
}
