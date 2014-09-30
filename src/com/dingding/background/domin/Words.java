package com.dingding.background.domin;

import java.sql.Date;

public class Words {

			/**
			 * @author zcs
			 * 
			 * @deprecated 留言表
			 * 
			 * 2014-09-17
			 * */
		
			/** 所有属性 7个
			 *  主键id，留言标题，留言内容
			 *  留言时间，留言人tel，留言人qq，留言人姓名
			 * */
		
			/**
			 * 主键id
			 */
			private int id;
			
			/**
			 *留言标题
			 */
			private  String title;
			
			/**
			 *留言内容
			 */
			private  String content;
			
			/**
			 *留言时间
			 */
			private  Date createTime;
			
			/**
			 *留言人tel
			 */
			private  String tel;
			
			/**
			 *留言人qq
			 */
			private  String qq;
			
			/**
			 *留言人姓名
			 */
			private  String name;

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

			public Date getCreateTime() {
				return createTime;
			}

			public void setCreateTime(Date createTime) {
				this.createTime = createTime;
			}

			public String getTel() {
				return tel;
			}

			public void setTel(String tel) {
				this.tel = tel;
			}

			public String getQq() {
				return qq;
			}

			public void setQq(String qq) {
				this.qq = qq;
			}

			public String getName() {
				return name;
			}

			public void setName(String name) {
				this.name = name;
			}
			
			
}
