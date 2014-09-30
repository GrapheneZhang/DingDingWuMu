package com.dingding.background.domin;

/**
 * @author zcs
 * @describe 产品类型表
 * 2014-09-17
 * */
public class ProductType {

		
	
		/** 所有属性 3个
		 *  主键id，类型名，父类id
		 * */
	
		/**
		 * 主键id
		 */
		private int id;
		
		/**
		 * 类型名
		 */
		private  String  name;
		
		/**
		 *父类id
		 */
		private  int parentId;
		
		/**
		 *父类id
		 */
		private  char protypeState;
		

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getParentId() {
			return parentId;
		}

		public void setParentId(int parentId) {
			this.parentId = parentId;
		}

		public char getProtypeState() {
			return protypeState;
		}

		public void setProtypeState(char protypeState) {
			this.protypeState = protypeState;
		}
		
		
}
