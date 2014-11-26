/**
 * 
 */
package com.shili.lu.image.service;

import java.util.List;

import com.shili.lu.image.dto.ImageNewsDto;
import com.shili.lu.image.model.ImageMaterial;



/**
 * 图片新闻service
 * 
 * @author lumw
 * 
 * 
 */
public interface ImageMaterialServiceI {

	public int saveImageNews(ImageNewsDto dto);
	
	public List<ImageMaterial> findImageMaterial();
}
