package com.shili.lu.image.dto;

import java.util.List;

import com.shili.lu.common.model.ResAttachment;
import com.shili.lu.image.model.ImageMaterial;
import com.shili.lu.image.model.ImageMaterialDetail;

public class ImageNewsDto extends ImageMaterial {

	/**
	 * 图片描述
	 */
	private List<ImageMaterialDetail> imageMaterialDetail;
	
	
	/**
	 * 图片序号
	 */
	private List<ResAttachment> photos;
	

	public List<ImageMaterialDetail> getImageMaterialDetail() {
		return imageMaterialDetail;
	}

	public void setImageMaterialDetail(List<ImageMaterialDetail> imageMaterialDetail) {
		this.imageMaterialDetail = imageMaterialDetail;
	}

	public List<ResAttachment> getPhotos() {
		return photos;
	}

	public void setPhotos(List<ResAttachment> photos) {
		this.photos = photos;
	}
}
