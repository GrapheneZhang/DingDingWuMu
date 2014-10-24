package com.dingding.background.domain;

public class Tech {

	
			/**
			 * @author zcs
			 * 
			 * @deprecated 知识库表
			 * 
			 * 2014-09-17
			 * */
		
			/** 所有属性3个
			 *  主键id，知识标题，内容
			 * */
		
			/**
			 * 主键id
			 */
			private int id;
			
			/**
			 *知识标题
			 */
			private  String title;
			
			/**
			 *内容(两种类型：1.文本描述，2.文档url)
			 */
			private  String content;

			public int getId() {
				return id;
			}

			public void setId(int id) {
				this.id = id;
			}

			public String getTitle() {
				return title;
			}

			public void setTitle(String title) {
				this.title = title;
			}

			public String getContent() {
				return content;
			}

			public void setContent(String content) {
				this.content = content;
			}
			
			
}
