package com.shili.lu.advertising.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.advertising.dao.NewsAdvertisingMapper;
import com.shili.lu.advertising.dao.NewsAdvertisingSpaceMapper;
import com.shili.lu.advertising.dto.NewsAdvertisingDto;
import com.shili.lu.advertising.dto.NewsAdvertisingSpaceDto;
import com.shili.lu.advertising.model.NewsAdvertising;
import com.shili.lu.advertising.model.NewsAdvertisingSpace;

@Service("newsAdvertisingService")
public class NewsAdvertisingServiceImpl implements NewsAdvertisingServiceI {

	/**
	 * 广告版位dao
	 */
	@Autowired
	private NewsAdvertisingSpaceMapper newsAdvertisingSpaceMapper;

	/**
	 * 广告
	 */
	@Autowired
	private NewsAdvertisingMapper newsAdvertisingMapper;

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
	public PageList<NewsAdvertisingSpaceDto> listNewsAdvertisingSpaceByPage(
			NewsAdvertisingSpaceDto queryParam, PageBounds pageBounds) {
		return newsAdvertisingSpaceMapper.listNewsAdvertisingSpaceByPage(
				queryParam, pageBounds);
	}

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
	public PageList<NewsAdvertisingDto> listNewsAdvertisingByPage(
			NewsAdvertisingDto queryParam, PageBounds pageBounds) {
		return newsAdvertisingMapper.listNewsAdvertisingByPage(queryParam,
				pageBounds);
	}

	@Override
	public void deleteById(Long Id) {
		if (Id != null) {
			newsAdvertisingSpaceMapper.deleteByPrimaryKey(Id.intValue());
		}

	}

	@Override
	public void deleteAdvertisingById(Long Id) {
		if (Id != null) {
			newsAdvertisingMapper.deleteByPrimaryKey(Id.intValue());
		}

	}

	@Override
	public void save(NewsAdvertisingSpaceDto dto) {
		// TODO Auto-generated method stub
		if (dto.getAdspaceId() == null || "".equals(dto.getAdspaceId())) {
			newsAdvertisingSpaceMapper.insert(dto);// 新增
		} else {
			newsAdvertisingSpaceMapper.updateByPrimaryKey(dto);// 更新
		}

	}

	@Override
	public NewsAdvertisingSpace findById(String id) {
		return newsAdvertisingSpaceMapper.selectByPrimaryKey(Integer
				.parseInt(id));

	}

	@Override
	public NewsAdvertising findAdvertisingById(String id) {
		return newsAdvertisingMapper.selectByPrimaryKey(Integer.parseInt(id));

	}

	@Override
	public void saveAdvertising(NewsAdvertisingDto dto) {

		if (dto.getAdvertisingId() == null || "".equals(dto.getAdvertisingId())) {
			newsAdvertisingMapper.insert(dto);// 新增
		} else {
			newsAdvertisingMapper.updateByPrimaryKey(dto);// 更新
		}

	}

	@Override
	public List<NewsAdvertisingSpace> selectAdvertisingSpace() {
		return newsAdvertisingSpaceMapper.selecAdvertisingSpacetList();

	}

	@Override
	public boolean selecAdvertisingSpacetByAdName(NewsAdvertisingSpace space) {
		boolean flag = false;
		if (newsAdvertisingSpaceMapper.selecAdvertisingSpacetByAdName(space) == null) {
			flag = true;
		}
		return flag;
	}
}
