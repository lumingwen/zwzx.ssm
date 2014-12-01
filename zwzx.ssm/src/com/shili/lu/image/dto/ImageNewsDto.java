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
	
	/**
	 * 开始时间
	 * @return
	 */
	private String createTimeStart;// 开始时间字符串
	
	private String createTimeEnd;
	
	/**
	 * 页数
	 */
	private Integer page;
	
	/**
	 * 扩展参数
	 */
	private String param;

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

	public String getCreateTimeStart() {
		return createTimeStart;
	}

	public void setCreateTimeStart(String createTimeStart) {
		this.createTimeStart = createTimeStart;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getCreateTimeEnd() {
		return createTimeEnd;
	}

	public void setCreateTimeEnd(String createTimeEnd) {
		this.createTimeEnd = createTimeEnd;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}
	
}
