package com.shili.lu.news.model;

import java.util.Date;

public class NewsContentCount {

	private Integer contentId;

	private Integer views;

	private Integer viewsMonth;

	private Integer viewsWeek;

	private Integer viewsDay;

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

	private Integer viewsYear;

	private Date createTime;

	private Date updateTime;

	public Integer getContentId() {
		return contentId;
	}

	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Integer getViewsYear() {
		return viewsYear;
	}

	public void setViewsYear(Integer viewsYear) {
		this.viewsYear = viewsYear;
	}

	public Integer getViewsMonth() {
		return viewsMonth;
	}

	public void setViewsMonth(Integer viewsMonth) {
		this.viewsMonth = viewsMonth;
	}

	public Integer getViewsWeek() {
		return viewsWeek;
	}

	public void setViewsWeek(Integer viewsWeek) {
		this.viewsWeek = viewsWeek;
	}

	public Integer getViewsDay() {
		return viewsDay;
	}

	public void setViewsDay(Integer viewsDay) {
		this.viewsDay = viewsDay;
	}
}