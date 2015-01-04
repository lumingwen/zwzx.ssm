/**
 * 
 */
package com.shili.lu.image.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.dao.ResAttachmentMapper;
import com.shili.lu.common.model.ResAttachment;
import com.shili.lu.common.util.Constants;
import com.shili.lu.image.dao.ImageMaterialDetailMapper;
import com.shili.lu.image.dao.ImageMaterialMapper;
import com.shili.lu.image.dto.ImageNewsDto;
import com.shili.lu.image.model.ImageMaterial;
import com.shili.lu.image.model.ImageMaterialDetail;


/**
 * 微信service
 * 
 * @author lumw
 * 
 * 
 */
@Service("imageMaterialService")
public class ImageMaterialServiceImpl implements ImageMaterialServiceI {
    @Autowired
	ImageMaterialMapper imageMaterialMapper;
    @Autowired
    ImageMaterialDetailMapper imageMaterialDetailMapper;
    
    @Autowired
    ResAttachmentMapper resAttachmentMapper;
    
	
	@Override
	public int saveImageNews(ImageNewsDto dto) {
		// 基本信息
		if (dto.getId() == null) {//插入
			dto.setCreateTime(new Date());
			dto.setUpdateTime(dto.getCreateTime());
			dto.setDeleteFlag(Constants.DEL_FLAG_NO);
			imageMaterialMapper.insert(dto);
		} else {//更新
			ImageMaterial db = imageMaterialMapper
					.selectByPrimaryKey(dto.getId());
			dto.setCreateTime(db.getCreateTime());
			dto.setUpdateTime(new Date());
			dto.setDeleteFlag(db.getDeleteFlag());
			imageMaterialMapper.updateByPrimaryKey(dto);
			imageMaterialDetailMapper.deleteByImageMaterialId(dto.getId());

			ResAttachment attachment = new ResAttachment();
			attachment.setRelId(dto.getId());
			resAttachmentMapper.deleteByRel(attachment);

		}

		// 更新上传的图片
		// 新增
		if (dto.getImageMaterialDetail() != null) {
			for (ResAttachment attachment : dto.getPhotos()) {
				attachment.setCreateTime(dto.getCreateTime());
				attachment.setDeleteFlag(dto.getDeleteFlag());
				attachment.setUpdateTime(new Date());
				attachment.setRelId(dto.getId());
				resAttachmentMapper.updateById(attachment);
			}
		}
        int i=0;
		// 扩展信息
		if (dto.getImageMaterialDetail() != null) {
			for (ImageMaterialDetail dt : dto
					.getImageMaterialDetail()) {
				dt.setCreateTime(new Date());
				dt.setUpdateTime(new Date());
				dt.setDeleteFlag(Constants.DEL_FLAG_NO);	
				dt.setImageMaterialId(dto.getId());
				dt.setImageId(dto.getPhotos().get(i).getId());
				dt.setImageDetail(dto.getImageMaterialDetail().get(i).getImageDetail());
				imageMaterialDetailMapper.insert(dt);
				i++;
			}
		}
		return i;
	}


	@Override
	public PageList<ImageMaterial> findImageMaterial(PageBounds pageBounds) {

		return imageMaterialMapper.findImageMaterial(pageBounds);
	}
	
	@Override
	public List<ImageMaterial> findImageMaterial() {

		return imageMaterialMapper.findImageMaterial();
	}


	@Override
	public List<ImageMaterialDetail> findImageMaterialDetailByIMId(
			Long imageMaterialId) {
		return imageMaterialDetailMapper.findImageMaterialDetailByIMId(imageMaterialId);
	}


	@Override
	public int imageNewsCount(Long imageMaterialId) {
		// TODO Auto-generated method stub
		return imageMaterialDetailMapper.imageNewsCount(imageMaterialId);
	}


	@Override
	public ImageMaterial findImageMaterialById(Long id) {
		return imageMaterialMapper.selectByPrimaryKey(id);
	}


	@Override
	public PageList<ImageMaterial> findPageImageMaterial(ImageNewsDto queryParam,
			PageBounds pageBounds) {
		return imageMaterialMapper.findPageImageMaterial(queryParam, pageBounds);
	}


	@Override
	public int deleteImageMaterialById(Long id) {
		
		 if(imageMaterialMapper.deleteImageMaterialById(id)!=-1 &&imageMaterialDetailMapper.deleteByImageMaterialId(id)!=-1)
		 {
			 return 1;
		 }else
			 
		 {
			 return -1;
		 }
	}
	
}
