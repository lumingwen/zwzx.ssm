/**
 * 
 */
package com.shili.lu.news.dto;

import java.util.List;

import com.shili.lu.news.model.PubBroadcastContent;

/**
 * 新闻内容dto
 * 
 * @author lumingwen
 * 
 * 
 */
public class NewsContentDto extends PubBroadcastContent {
	// 新闻类别名
	private String newsTypeName;
	// 相关的新闻
	private List<PubBroadcastContentDto> contentList;

	public String getNewsTypeName() {
		return newsTypeName;
	}

	public void setNewsTypeName(String newsTypeName) {
		this.newsTypeName = newsTypeName;
	}

	public List<PubBroadcastContentDto> getContentList() {
		return contentList;
	}

	public void setContentList(List<PubBroadcastContentDto> contentList) {
		this.contentList = contentList;
	}

}
