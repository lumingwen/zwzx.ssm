/**
 * 
 */
package com.shili.lu.friendlink.dto;

import com.shili.lu.friendlink.model.NewsFriendlink;

/**
 * 链接内容dto
 * 
 * @author lumingwen
 * 
 * 
 */
public class NewsFriendlinkDto extends NewsFriendlink {

	private String userName;

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

	private String createTimeStart;// 开始时间字符串
	private String createTimeEnd;// 结束时间字符串

}
