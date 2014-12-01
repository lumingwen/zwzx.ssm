package com.shili.lu.image.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.image.dto.ImageNewsDto;
import com.shili.lu.image.model.ImageMaterial;

public interface ImageMaterialMapper {
    int deleteByPrimaryKey(Long id);

	int insert(ImageMaterial record);

	ImageMaterial selectByPrimaryKey(Long id);

	int updateByPrimaryKey(ImageMaterial record);
	
	PageList<ImageMaterial> findImageMaterial(PageBounds pageBounds);
	
	List<ImageMaterial> findImageMaterial();
	
	PageList<ImageMaterial> findPageImageMaterial(ImageNewsDto queryParam,
			PageBounds pageBounds);
	
	
}