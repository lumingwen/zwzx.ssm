package com.shili.lu.image.dao;

import java.util.List;

import com.shili.lu.image.model.ImageMaterial;

public interface ImageMaterialMapper {
    int deleteByPrimaryKey(Long id);

	int insert(ImageMaterial record);

	ImageMaterial selectByPrimaryKey(Long id);

	int updateByPrimaryKey(ImageMaterial record);
	
	 List<ImageMaterial> findImageMaterial();
}