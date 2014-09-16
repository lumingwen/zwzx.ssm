package com.shili.lu.advertising.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.advertising.dto.NewsAdvertisingSpaceDto;
import com.shili.lu.advertising.model.NewsAdvertisingSpace;

public interface NewsAdvertisingSpaceMapper {
	int deleteByPrimaryKey(Integer adspaceId);

	int insert(NewsAdvertisingSpace record);

	int insertSelective(NewsAdvertisingSpace record);

	NewsAdvertisingSpace selectByPrimaryKey(Integer adspaceId);

	int updateByPrimaryKeySelective(NewsAdvertisingSpace record);

	int updateByPrimaryKey(NewsAdvertisingSpace record);

	/**
	 * 分页查询
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	public PageList<NewsAdvertisingSpaceDto> listNewsAdvertisingSpaceByPage(
			NewsAdvertisingSpaceDto queryParam, PageBounds pageBounds);

	public List<NewsAdvertisingSpace> selecAdvertisingSpacetList();

	public NewsAdvertisingSpace selecAdvertisingSpacetByAdName(
			NewsAdvertisingSpace space);
}