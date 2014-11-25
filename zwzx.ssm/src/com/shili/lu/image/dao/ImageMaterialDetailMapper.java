package com.shili.lu.image.dao;

import com.shili.lu.image.model.ImageMaterialDetail;

public interface ImageMaterialDetailMapper {
    int deleteByPrimaryKey(Long id);

	int insert(ImageMaterialDetail record);

	int insertSelective(ImageMaterialDetail record);

	ImageMaterialDetail selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(ImageMaterialDetail record);

	int updateByPrimaryKey(ImageMaterialDetail record);

}