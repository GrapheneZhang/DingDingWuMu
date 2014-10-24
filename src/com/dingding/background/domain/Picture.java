package com.dingding.background.domain;

public class Picture {

			
			/**
			 * @author zcs
			 * 
			 * @deprecated 产品图片表（产品素材表）
			 * 
			 * 2014-09-17
			 * */
		
			/** 所有属性 3个
			 *  主键id，产品对应图片的url
			 *产品类型名称，外键
			 * */
		
			/**
			 * 主键id
			 */
			private int id;
			
			/**
			 *产品对应图片的url
			 */
			private  String  pictureUrl;
			
			/**
			 *产品类型id，外键
			 */
			private  int protypeName;

			public int getId() {
				return id;
			}

			public void setId(int id) {
				this.id = id;
			}

			public String getPictureUrl() {
				return pictureUrl;
			}

			public void setPictureUrl(String pictureUrl) {
				this.pictureUrl = pictureUrl;
			}

			public int getProtypeName() {
				return protypeName;
			}

			public void setProtypeName(int protypeName) {
				this.protypeName = protypeName;
			}
		
			
}
