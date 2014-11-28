package com.shili.lu.image.dao;

import java.util.List;

import com.shili.lu.image.model.ImageMaterialDetail;

public interface ImageMaterialDetailMapper {
    int deleteByPrimaryKey(Long id);

	int insert(ImageMaterialDetail record);

	ImageMaterialDetail selectByPrimaryKey(Long id);

	int updateByPrimaryKey(ImageMaterialDetail record);
	
	int deleteByImageId(Long imageId);
	
	List<ImageMaterialDetail> findImageMaterialDetailByIMId(Long imageMaterialId);
	
	int imageNewsCount(Long imageMaterialId);

}