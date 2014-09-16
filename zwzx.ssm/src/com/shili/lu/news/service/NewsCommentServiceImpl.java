package com.shili.lu.news.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.util.Constants;
import com.shili.lu.news.dao.NewsCommentMapper;
import com.shili.lu.news.dto.NewsCommentDto;

@Service("newsCommentService")
public class NewsCommentServiceImpl implements NewsCommentServiceI {

	/**
	 * 评论dao
	 */
	@Autowired
	private NewsCommentMapper newsCommentMapper;

	@Override
	public PageList<NewsCommentDto> listNewsCommentByPage(
			NewsCommentDto queryParam, PageBounds pageBounds) {
		return newsCommentMapper.listNewsCommentByPage(queryParam, pageBounds);
	}

	@Override
	public Integer editComment(NewsCommentDto dto) {
		if (dto != null) {
			if (dto.getCommentId() == null || dto.getCommentId() <= 0) {
				// 新增
				dto.setCreateTime(new Date());
				dto.setDeleteFlag(Constants.DEL_FLAG_NO);
				dto.setText(dto.getText());
				dto.setIp(dto.getIp());
				return newsCommentMapper.insert(dto);
			} else {
				if (Constants.DEL_FLAG_YES.equals(dto.getDeleteFlag())) {
					// 删除
					newsCommentMapper.deleteByPrimaryKey(dto.getCommentId());
				} else if (dto.getIsRecommend() != null) {
					// 是否推荐
					newsCommentMapper.updateByPrimaryKey(dto);
				} else if (dto.getIsChecked() != null) {
					// 是否热门
					newsCommentMapper.updateByPrimaryKey(dto);
				}
			}
			return dto.getCommentId();
		}
		return null;
	}
}
