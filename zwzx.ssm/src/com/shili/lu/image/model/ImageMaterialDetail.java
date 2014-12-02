package com.shili.lu.image.model;

import java.util.Date;

public class ImageMaterialDetail {
    private Long id;

	private Long imageMaterialId;

	private Integer sortNumber;

	private Long imageId;

	private String imageDetail;
	
	private Date createTime;

	private Date updateTime;
	
	private Integer deleteFlag;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getImageMaterialId() {
		return imageMaterialId;
	}

	public void setImageMaterialId(Long imageMaterialId) {
		this.imageMaterialId = imageMaterialId;
	}

	public Integer getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}

	public Long getImageId() {
		return imageId;
	}

	public void setImageId(Long imageId) {
		this.imageId = imageId;
	}

	public String getImageDetail() {
		return imageDetail;
	}

	public void setImageDetail(String imageDetail) {
		this.imageDetail = imageDetail == null ? null : imageDetail.trim();
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
	
}