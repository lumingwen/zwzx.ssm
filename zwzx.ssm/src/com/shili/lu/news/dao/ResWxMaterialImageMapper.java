package com.shili.lu.news.dao;

import com.shili.lu.news.model.ResWxMaterialImage;

/**
 * 微信图片素材dao
 * 
 * @author zhangxujun
 * 
 * 
 */
public interface ResWxMaterialImageMapper {
	int deleteByPrimaryKey(Long id);

	int insert(ResWxMaterialImage record);

	ResWxMaterialImage selectByPrimaryKey(Long id);

	int updateByPrimaryKey(ResWxMaterialImage record);
}