package com.shili.lu.news.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.advertising.dao.NewsAdvertisingMapper;
import com.shili.lu.advertising.dto.NewsAdvertisingDto;
import com.shili.lu.news.dao.NewsCommentMapper;
import com.shili.lu.news.dao.PubBroadcastContentMapper;
import com.shili.lu.news.dto.NewsCommentDto;
import com.shili.lu.news.dto.PubBroadcastContentDto;
import com.shili.lu.news.model.PubBroadcastContent;

@Service("frontNewsContetService")
public class FrontNewsContentServiceImpl implements FrontNewsContetServiceI {

	@Autowired
	private PubBroadcastContentMapper pubBroadcastContentMapper;

	/**
	 * 评论dao
	 */
	@Autowired
	private NewsCommentMapper newsCommentMapper;

	/**
	 * 广告dao
	 */
	@Autowired
	private NewsAdvertisingMapper newsAdvertisingMapper;

	@Override
	public List<PubBroadcastContentDto> findNewsContent() {
		// 新闻类别的查询

		// 根据类别查询类别下面的新闻内容

		return pubBroadcastContentMapper.findNewsContent();
	}

	@Override
	public List<PubBroadcastContentDto> selectByNewsTypeId(Long id) {
		return pubBroadcastContentMapper.selectByNewsTypeId(id);
	}

	@Override
	public PubBroadcastContent findById(String id) {
		return pubBroadcastContentMapper.selectByPrimaryKey(Long.parseLong(id));
	}

	@Override
	public PageList<NewsCommentDto> listNewsCommentByPage(
			NewsCommentDto queryParam, PageBounds pageBounds) {
		return newsCommentMapper.listNewsCommentByPage(queryParam, pageBounds);
	}

	@Override
	public List<PubBroadcastContentDto> selectListByNewsTypeId(Long id) {
		return pubBroadcastContentMapper.selectListByNewsTypeId(id);
	}

	@Override
	public List<NewsAdvertisingDto> listNewsAdvertising() {
		return newsAdvertisingMapper.listNewsAdvertising();
	}

	@Override
	public List<PubBroadcastContentDto> selectListMostComment() {
		return pubBroadcastContentMapper.selectListMostComment();
	}

	@Override
	public List<PubBroadcastContentDto> selectListMostViews() {
		return pubBroadcastContentMapper.selectListMostViews();
	}

	@Override
	public PageList<PubBroadcastContentDto> listNewsListByPage(
			PubBroadcastContentDto queryParam, PageBounds pageBounds) {
		return pubBroadcastContentMapper.listBroadcastByPage(queryParam,
				pageBounds);
	}

}
