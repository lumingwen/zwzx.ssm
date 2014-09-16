package com.shili.lu.news.service;

import com.shili.lu.news.model.NewsContentCount;

/**
 * 访问量
 * 
 * @author lumingwen 2014年7月21日 下午12:13:43
 */
public interface FrontNewsContetCountServiceI {

	public NewsContentCount findById(Integer contentId);

	/**
	 * 更新或者插入新闻访问总数
	 * 
	 * @param newsContentCount
	 */
	public void editNewsContentCount(NewsContentCount newsContentCount,
			String type);
}
