package com.shili.lu.news.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.news.dto.PubBroadcastContentDto;
import com.shili.lu.news.model.PubBroadcastContent;

public interface PubBroadcastContentMapper {
	int deleteByPrimaryKey(Long id);

	int insert(PubBroadcastContent record);

	PubBroadcastContentDto selectByPrimaryKey(Long id);

	int updateByPrimaryKeyWithBLOBs(PubBroadcastContent record);

	int updateByPrimaryKey(PubBroadcastContent record);

	/**
	 * 分页查询
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	public PageList<PubBroadcastContentDto> listBroadcastByPage(
			PubBroadcastContentDto queryParam, PageBounds pageBounds);

	/**
	 * 根据新闻类型查看新闻
	 */

	public List<PubBroadcastContentDto> selectByNewsTypeId(Long id);

	/**
	 * 根据新闻类型查看新闻
	 */

	public List<PubBroadcastContentDto> selectListByNewsTypeId(Long id);

	/**
	 * 查询最新的新闻
	 * 
	 */

	public List<PubBroadcastContentDto> findNewsContent();

	/**
	 * 查询最多评论的新闻
	 * 
	 */

	public List<PubBroadcastContentDto> selectListMostComment();

	/**
	 * 查询点击最多的新闻
	 * 
	 */

	public List<PubBroadcastContentDto> selectListMostViews();

}