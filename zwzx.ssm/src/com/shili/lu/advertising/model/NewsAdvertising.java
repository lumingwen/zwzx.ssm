package com.shili.lu.advertising.model;

import java.util.Date;

public class NewsAdvertising {
	private Integer advertisingId;

	private Integer adspaceId;

	private String adName;

	private String category;

	private Integer adWeight;

	private Long displayCount;

	private Long clickCount;

	private Date startTime;

	private Date endTime;

	private String isEnabled;

	private Long userId;

	private Date createTime;

	private Date updateTime;

	private Integer deleteFlag;

	private Integer type;

	private String imageUrl;

	private String imageLink;

	private String imagePoint;

	private String imageTarget;

	private String fontDetail;

	private String fontLink;

	private String fontColor;

	private Integer fontSize;

	private String fontTarget;

	private Long imageId;

	private String adCode;

	public Integer getAdvertisingId() {
		return advertisingId;
	}

	public void setAdvertisingId(Integer advertisingId) {
		this.advertisingId = advertisingId;
	}

	public Integer getAdspaceId() {
		return adspaceId;
	}

	public void setAdspaceId(Integer adspaceId) {
		this.adspaceId = adspaceId;
	}

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName == null ? null : adName.trim();
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category == null ? null : category.trim();
	}

	public Integer getAdWeight() {
		return adWeight;
	}

	public void setAdWeight(Integer adWeight) {
		this.adWeight = adWeight;
	}

	public Long getDisplayCount() {
		return displayCount;
	}

	public void setDisplayCount(Long displayCount) {
		this.displayCount = displayCount;
	}

	public Long getClickCount() {
		return clickCount;
	}

	public void setClickCount(Long clickCount) {
		this.clickCount = clickCount;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(String isEnabled) {
		this.isEnabled = isEnabled == null ? null : isEnabled.trim();
	}

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

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl == null ? null : imageUrl.trim();
	}

	public String getImageLink() {
		return imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink == null ? null : imageLink.trim();
	}

	public String getImagePoint() {
		return imagePoint;
	}

	public void setImagePoint(String imagePoint) {
		this.imagePoint = imagePoint == null ? null : imagePoint.trim();
	}

	public String getImageTarget() {
		return imageTarget;
	}

	public void setImageTarget(String imageTarget) {
		this.imageTarget = imageTarget == null ? null : imageTarget.trim();
	}

	public String getFontDetail() {
		return fontDetail;
	}

	public void setFontDetail(String fontDetail) {
		this.fontDetail = fontDetail == null ? null : fontDetail.trim();
	}

	public String getFontLink() {
		return fontLink;
	}

	public void setFontLink(String fontLink) {
		this.fontLink = fontLink == null ? null : fontLink.trim();
	}

	public String getFontColor() {
		return fontColor;
	}

	public void setFontColor(String fontColor) {
		this.fontColor = fontColor == null ? null : fontColor.trim();
	}

	public Integer getFontSize() {
		return fontSize;
	}

	public void setFontSize(Integer fontSize) {
		this.fontSize = fontSize;
	}

	public String getFontTarget() {
		return fontTarget;
	}

	public void setFontTarget(String fontTarget) {
		this.fontTarget = fontTarget == null ? null : fontTarget.trim();
	}

	public Long getImageId() {
		return imageId;
	}

	public void setImageId(Long imageId) {
		this.imageId = imageId;
	}

	public String getAdCode() {
		return adCode;
	}

	public void setAdCode(String adCode) {
		this.adCode = adCode == null ? null : adCode.trim();
	}
}