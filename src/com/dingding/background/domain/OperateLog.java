package com.dingding.background.domain;

import java.sql.Date;
public class OperateLog {

		/**
		 * @author zcs
		 * 
		 * @deprecated 管理员操作记录表
		 * 
		 * 2014-09-17
		 * */
	
		/** 所有属性 5个
		 *  主键id，外键管理员id，操作类型，操作描述，操作时间
		 * */
	
		/**
		 * 主键id
		 */
		private int id;
		
		/**
		 * 外键管理员id,参照User中的id
		 */
		private  int userId;
		
		/**
		 * 操作类型（增加，删除，修改）
		 */
		private  String operateType;
		
		/**
		 * 操作描述
		 */
		private String operateDis;
		
		/**
		 * 操作时间
		 */
		private Date operateTime;
		
		/**
		 * 操作管理员登录名
		 */
		private String loginName;
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public String getOperateType() {
			return operateType;
		}

		public void setOperateType(String operateType) {
			this.operateType = operateType;
		}

		public String getOperateDis() {
			return operateDis;
		}

		public void setOperateDis(String operateDis) {
			this.operateDis = operateDis;
		}

		public Date getOperateTime() {
			return operateTime;
		}

		public void setOperateTime(Date operateTime) {
			this.operateTime = operateTime;
		}

		public String getLoginName() {
			return loginName;
		}

		public void setLoginName(String loginName) {
			this.loginName = loginName;
		}
		
		
}
