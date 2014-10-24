package com.dingding.background.domain;

import java.util.Date;

/**
 * @author zcs
 * @describe 新闻表
 * 2014-09-17
 * */
public class News {
	//所有属性 6个
	//主键id，新闻标题，新闻内容，管理员id，创建时间，管理员姓名
		
	/**
	 * 1 主键id
	 */
	private int id;
	
	/**
	 * 2 新闻标题
	 */
	private String title;
	
	/**
	 * 3 新闻内容
	 */
	private String content;
	
	/**
	 * 4 管理员id
	 */
	private int authorId;
	/**
	 * 5 管理员姓名
	 */
	private String authorName;
	
	/**
	 * 6 创建时间 createtime
	 */
	private Date createTime;
	
	//7搜索时的条件字段
	private String createTimeStart;
	//8
	private String createTimeEnd;
	
	

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

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getCreateTimeStart() {
		return createTimeStart;
	}

	public void setCreateTimeStart(String createTimeStart) {
		this.createTimeStart = createTimeStart;
	}

	public String getCreateTimeEnd() {
		return createTimeEnd;
	}

	public void setCreateTimeEnd(String createTimeEnd) {
		this.createTimeEnd = createTimeEnd;
	}
			
			
}
