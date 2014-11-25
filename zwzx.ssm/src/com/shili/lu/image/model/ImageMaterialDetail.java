package com.shili.lu.image.model;

public class ImageMaterialDetail {
    private Long id;

	private Long imageMaterialId;

	private Integer sortNumber;

	private Long imageId;

	private String imageDetail;

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
}