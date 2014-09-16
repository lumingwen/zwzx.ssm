package com.shili.lu.news.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.advertising.dto.NewsAdvertisingDto;
import com.shili.lu.news.dto.NewsCommentDto;
import com.shili.lu.news.dto.PubBroadcastContentDto;
import com.shili.lu.news.model.PubBroadcastContent;

/**
 * 新闻内容的查看
 * 
 * @author lumingwen 2014年7月21日 下午12:13:43
 */
public interface FrontNewsContetServiceI {
	// 查询新闻的内容
	public List<PubBroadcastContentDto> findNewsContent();

	/**
	 * 根据新闻类型查看新闻
	 * 
	 * @author Administrator 2014年7月21日 下午12:55:40
	 * @param id
	 * @return
	 */

	public List<PubBroadcastContentDto> selectByNewsTypeId(Long id);

	public List<PubBroadcastContentDto> selectListByNewsTypeId(Long id);

	/**
	 * 分页新闻评论内容
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * @author lumingwen
	 */
	public PageList<PubBroadcastContentDto> listNewsListByPage(
			PubBroadcastContentDto queryParam, PageBounds pageBounds);

	/**
	 * 查找
	 * 
	 * @author lumingwen
	 * @param id
	 */
	public PubBroadcastContent findById(String id);

	/**
	 * 分页新闻评论内容
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * @author lumingwen
	 */
	public PageList<NewsCommentDto> listNewsCommentByPage(
			NewsCommentDto queryParam, PageBounds pageBounds);

	/**
	 * 查询广告
	 */
	public List<NewsAdvertisingDto> listNewsAdvertising();

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
