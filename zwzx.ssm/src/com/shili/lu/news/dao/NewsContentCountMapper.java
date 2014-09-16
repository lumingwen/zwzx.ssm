package com.shili.lu.news.dao;

import com.shili.lu.news.model.NewsContentCount;

public interface NewsContentCountMapper {
	int deleteByPrimaryKey(Long id);

	int insert(NewsContentCount record);

	NewsContentCount selectByContentId(Integer contentId);

	int updateByPrimaryKey(NewsContentCount record);
}