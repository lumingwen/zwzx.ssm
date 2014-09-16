package com.shili.lu.friendlink.model;

import java.util.Date;

public class NewsFriendlinkCtg {
	private Integer friendlinkctgId;

	private String friendlinkctgName;

	private Integer priority;
	private Long userId;

	private Date createTime;

	private Date updateTime;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	private Integer deleteFlag;

	public Integer getFriendlinkctgId() {
		return friendlinkctgId;
	}

	public void setFriendlinkctgId(Integer friendlinkctgId) {
		this.friendlinkctgId = friendlinkctgId;
	}

	public String getFriendlinkctgName() {
		return friendlinkctgName;
	}

	public void setFriendlinkctgName(String friendlinkctgName) {
		this.friendlinkctgName = friendlinkctgName == null ? null
				: friendlinkctgName.trim();
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
}