package com.shili.lu.advertising.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.advertising.dto.NewsAdvertisingDto;
import com.shili.lu.advertising.model.NewsAdvertising;

public interface NewsAdvertisingMapper {
	int deleteByPrimaryKey(Integer advertisingId);

	int insert(NewsAdvertising record);

	NewsAdvertising selectByPrimaryKey(Integer advertisingId);

	int updateByPrimaryKey(NewsAdvertising record);

	/**
	 * 分页查询
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	public PageList<NewsAdvertisingDto> listNewsAdvertisingByPage(
			NewsAdvertisingDto queryParam, PageBounds pageBounds);

	/**
	 * 查询广告(前台用)
	 */
	public List<NewsAdvertisingDto> listNewsAdvertising();
}