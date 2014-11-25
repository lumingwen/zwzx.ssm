package com.shili.lu.image.dao;

import com.shili.lu.image.model.ImageMaterial;

public interface ImageMaterialMapper {
    int deleteByPrimaryKey(Long id);

	int insert(ImageMaterial record);

	int insertSelective(ImageMaterial record);

	ImageMaterial selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(ImageMaterial record);

	int updateByPrimaryKey(ImageMaterial record);
}