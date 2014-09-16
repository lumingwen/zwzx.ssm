package com.shili.lu.news.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.news.dao.PubBroadcastContentMapper;
import com.shili.lu.news.dto.PubBroadcastContentDto;

@Service("pubBroadcastService")
public class PubBroadcastServiceImpl implements PubBroadcastServiceI {

	/**
	 * 旅游播报dao
	 */
	@Autowired
	private PubBroadcastContentMapper pubBroadcastContentMapper;

	/**
	 * 分页查询旅游播报内容
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * @author lumingwen
	 */
	@Override
	public PageList<PubBroadcastContentDto> listPubBroadcastContentByPage(
			PubBroadcastContentDto queryParam, PageBounds pageBounds) {
		return pubBroadcastContentMapper.listBroadcastByPage(queryParam,
				pageBounds);
	}

	@Override
	public void deleteById(Long Id) {
		if (Id != null) {
			pubBroadcastContentMapper.deleteByPrimaryKey(Id);
		}

	}

	@Override
	public void save(PubBroadcastContentDto dto) {
		// TODO Auto-generated method stub
		if (dto.getId() == null || "".equals(dto.getId())) {
			dto.setCreateTime(new Date());
			pubBroadcastContentMapper.insert(dto);// 新增
		} else {
			pubBroadcastContentMapper.updateByPrimaryKeyWithBLOBs(dto);// 更新
		}

	}

	@Override
	public PubBroadcastContentDto findById(String id) {
		return pubBroadcastContentMapper.selectByPrimaryKey(Long.parseLong(id));

	}

}
