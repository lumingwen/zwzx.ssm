/**
 * 
 */
package com.shili.lu.news.dto;

import com.shili.lu.news.model.NewsCommentWithBLOBs;

/**
 * 评论内容dto
 * 
 * @author lumingwen
 * 
 * 
 */
public class NewsCommentDto extends NewsCommentWithBLOBs {

	private String userName;
	private String title;

	private String strCreateTime;

	public String getStrCreateTime() {
		return strCreateTime;
	}

	public void setStrCreateTime(String strCreateTime) {
		this.strCreateTime = strCreateTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

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

	/**
	 * 扩展参数
	 */
	private String param;

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
