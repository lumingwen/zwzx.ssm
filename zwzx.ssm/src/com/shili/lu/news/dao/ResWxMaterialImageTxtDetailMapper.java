package com.shili.lu.news.dao;

import com.shili.lu.news.model.ResWxMaterialImageTxtDetail;

/**
 * 微信图文素材详细信息dao
 * 
 * @author zhangxujun
 * 
 * 
 */
public interface ResWxMaterialImageTxtDetailMapper {

	int deleteByPrimaryKey(Long id);

	int insert(ResWxMaterialImageTxtDetail record);

	ResWxMaterialImageTxtDetail selectByPrimaryKey(Long id);

	int updateByPrimaryKey(ResWxMaterialImageTxtDetail record);

}