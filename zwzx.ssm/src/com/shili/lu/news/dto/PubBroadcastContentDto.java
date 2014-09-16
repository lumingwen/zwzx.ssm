/**
 * 
 */
package com.shili.lu.news.dto;

import com.shili.lu.news.model.PubBroadcastContent;

/**
 * 旅游播报内容dto
 * 
 * @author lumingwen
 * 
 * 
 */
public class PubBroadcastContentDto extends PubBroadcastContent {

	private String userName;
	/**
	 * 扩展参数
	 */
	private String param;

	// 新闻内容类型名
	private String contentTypeName;

	// 新闻类型名
	private String newsTypeName;

	// 评论总数
	private String commentCount;

	// 总浏览数
	private String viewsCount;

	/**
	 * 页数
	 */
	private Integer page;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(String commentCount) {
		this.commentCount = commentCount;
	}

	public String getViewsCount() {
		return viewsCount;
	}

	public void setViewsCount(String viewsCount) {
		this.viewsCount = viewsCount;
	}

	public String getContentTypeName() {
		return contentTypeName;
	}

	public void setContentTypeName(String contentTypeName) {
		this.contentTypeName = contentTypeName;
	}

	public String getNewsTypeName() {
		return newsTypeName;
	}

	public void setNewsTypeName(String newsTypeName) {
		this.newsTypeName = newsTypeName;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	private String createTimeStart;// 开始时间字符串
	private String createTimeEnd;// 结束时间字符串

}
