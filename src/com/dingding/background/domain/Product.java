package com.dingding.background.domain;

public class Product {

			/**
			 * @author zcs
			 * 
			 * @deprecated 产品表
			 * 
			 * 2014-09-17
			 * */
		
			/** 所有属性 6个
			 *  主键id，产品名
			 * 外键产品类型id，产品描述
			 * 产品对应图片的url,产品状态
			 * */
		
			/**
			 * 主键id
			 */
			private int id;
			
			/**
			 * 产品名（格式：产品名+产品型号）
			 */
			private  String  name;
			
			/**
			 *外键产品类型id
			 */
			private  int proTypeName;
			
			/**
			 * 产品描述
			 */
			private  String  productDes;
			
			/**
			 * 产品对应图片的url
			 */
			private  String  pictureUrl;
			
			/**
			 * 产品状态:0为不显示（屏蔽） 1为显示（展示中，默认）
			 */
			private  char  productState;

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

			public int getProTypeName() {
				return proTypeName;
			}

			public void setProTypeName(int proTypeName) {
				this.proTypeName = proTypeName;
			}

			public String getProductDes() {
				return productDes;
			}

			public void setProductDes(String productDes) {
				this.productDes = productDes;
			}

			public String getPictureUrl() {
				return pictureUrl;
			}

			public void setPictureUrl(String pictureUrl) {
				this.pictureUrl = pictureUrl;
			}

			public char getProductState() {
				return productState;
			}

			public void setProductState(char productState) {
				this.productState = productState;
			}
}
