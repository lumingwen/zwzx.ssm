package com.shili.lu.news.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shili.lu.news.dao.NewsContentCountMapper;
import com.shili.lu.news.model.NewsContentCount;

//访问量
@Service("frontNewsContetCountService")
public class FrontNewsContentCountServiceImpl implements
		FrontNewsContetCountServiceI {
	@Autowired
	private NewsContentCountMapper newsContentCountMapper;

	@Override
	public NewsContentCount findById(Integer id) {
		return newsContentCountMapper.selectByContentId(id);
	}

	@Override
	public void editNewsContentCount(NewsContentCount dto, String type) {
		if (type.equals("insert")) {
			newsContentCountMapper.insert(dto);// 新增
		} else {
			newsContentCountMapper.updateByPrimaryKey(dto);// 更新
		}

	}
}
