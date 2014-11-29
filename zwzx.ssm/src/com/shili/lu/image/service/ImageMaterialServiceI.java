/**
 * 
 */
package com.shili.lu.image.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.image.dto.ImageNewsDto;
import com.shili.lu.image.model.ImageMaterial;
import com.shili.lu.image.model.ImageMaterialDetail;



/**
 * 图片新闻service
 * 
 * @author lumw
 * 
 * 
 */
public interface ImageMaterialServiceI {

	public int saveImageNews(ImageNewsDto dto);
	
	public PageList<ImageMaterial> findImageMaterial(PageBounds pageBounds);
	
	public List<ImageMaterial> findImageMaterial();
	
	public List<ImageMaterialDetail> findImageMaterialDetailByIMId(Long imageMaterialId);
	
	public int imageNewsCount(Long imageMaterialId);
	
	public ImageMaterial findImageMaterialById(Long id);
}
