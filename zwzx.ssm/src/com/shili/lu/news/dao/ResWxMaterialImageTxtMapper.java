package com.shili.lu.news.dao;

import com.shili.lu.news.model.ResWxMaterialImageTxt;

/**
 * 微信图文素材
 * 
 * @author zhangxujun
 * 
 * 
 */
public interface ResWxMaterialImageTxtMapper {
	int deleteByPrimaryKey(Long id);

	int insert(ResWxMaterialImageTxt record);

	ResWxMaterialImageTxt selectByPrimaryKey(Long id);

	int updateByPrimaryKey(ResWxMaterialImageTxt record);
}