package com.shili.lu.advertising.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.advertising.dto.NewsAdvertisingDto;
import com.shili.lu.advertising.dto.NewsAdvertisingSpaceDto;
import com.shili.lu.advertising.model.NewsAdvertising;
import com.shili.lu.advertising.model.NewsAdvertisingSpace;

public interface NewsAdvertisingServiceI {

	/**
	 * 分页查询旅游播报内容
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * @author lumingwen
	 */
	public PageList<NewsAdvertisingSpaceDto> listNewsAdvertisingSpaceByPage(
			NewsAdvertisingSpaceDto queryParam, PageBounds pageBounds);

	/**
	 * 分页查询旅游播报内容
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * @author lumingwen
	 */
	public PageList<NewsAdvertisingDto> listNewsAdvertisingByPage(
			NewsAdvertisingDto queryParam, PageBounds pageBounds);

	/**
	 * 根据id删除广告排位类型
	 * 
	 * @param Id
	 *            广告排位id
	 */
	public void deleteById(Long Id);

	/**
	 * 根据id删除广告
	 * 
	 * @param Id
	 *            旅游播报id
	 */
	public void deleteAdvertisingById(Long Id);

	/**
	 * 编辑保存
	 * 
	 * @author lumingwen
	 * @param dto
	 */
	public void save(NewsAdvertisingSpaceDto dto);

	/**
	 * 查找
	 * 
	 * @author lumingwen
	 * @param id
	 */
	public NewsAdvertisingSpace findById(String id);

	/**
	 * 查找
	 * 
	 * @author lumingwen
	 * @param id
	 */
	public NewsAdvertising findAdvertisingById(String id);

	/**
	 * 编辑保存
	 * 
	 * @author lumingwen
	 * @param dto
	 */
	public void saveAdvertising(NewsAdvertisingDto dto);

	/**
	 * 查询广告版位list
	 * 
	 * @author lumingwen
	 * @param dto
	 */
	public List<NewsAdvertisingSpace> selectAdvertisingSpace();

	/**
	 * 根据广告位名查询
	 * 
	 */
	public boolean selecAdvertisingSpacetByAdName(NewsAdvertisingSpace space);
}
