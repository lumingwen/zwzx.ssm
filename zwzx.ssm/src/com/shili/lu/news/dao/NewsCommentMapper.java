package com.shili.lu.news.dao;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.news.dto.NewsCommentDto;
import com.shili.lu.news.model.NewsComment;
import com.shili.lu.news.model.NewsCommentWithBLOBs;

public interface NewsCommentMapper {
	int deleteByPrimaryKey(Integer commentId);

	int insert(NewsCommentWithBLOBs record);

	NewsCommentWithBLOBs selectByPrimaryKey(Integer commentId);

	int updateByPrimaryKeyWithBLOBs(NewsCommentWithBLOBs record);

	int updateByPrimaryKey(NewsComment record);

	PageList<NewsCommentDto> listNewsCommentByPage(NewsCommentDto queryParam,
			PageBounds pageBounds);

}