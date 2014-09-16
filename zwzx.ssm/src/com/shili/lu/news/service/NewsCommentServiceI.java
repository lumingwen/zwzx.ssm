package com.shili.lu.news.service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.news.dto.NewsCommentDto;

/**
 * 新闻评论service
 * 
 * @author lumingwen 2014年7月21日 下午12:13:43
 */
public interface NewsCommentServiceI {
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
	 * 新增(游客)、修改、删除、启用、停用,评论内容
	 * 
	 * @param dto
	 */
	public Integer editComment(NewsCommentDto dto);

}
