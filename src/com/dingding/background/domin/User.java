package com.dingding.background.domin;

/**
 * @author zcs
 * 
 * @describe管理员表
 * 
 * 2014-09-17
 * */
public class User {

		
	
		/** 所有属性 6个
		 *  主键id，登录名，真实姓名，登录密码，用户权限，用户身份证号
		 * */
	
		/**
		 * 主键id
		 */
		private int id;
		
		/**
		 * 登录名
		 */
		private String loginName;
		
		/**
		 * 用户真实姓名
		 */
		private  String userName;
		
		/**
		 * 登录密码
		 */
		private String password;
		
		/**
		 * 用户权限
		 * 1代表超级管理员有权限增加管理员，默认为0
		 */
		private char privilege;
		
		/**
		 * 用户身份证号
		 */
		private String idCard;
		
		
		
		

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getLoginName() {
			return loginName;
		}

		public void setLoginName(String loginName) {
			this.loginName = loginName;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public char getPrivilege() {
			return privilege;
		}

		public void setPrivilege(char privilege) {
			this.privilege = privilege;
		}

		public String getIdCard() {
			return idCard;
		}

		public void setIdCard(String idCard) {
			this.idCard = idCard;
		}
}
