package com.shili.lu.news.service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.news.dto.PubBroadcastContentDto;

/**
 * 旅游播报业务逻辑处理
 * 
 * @author 邱全松 2014-7-10 下午2:20:03
 */
public interface PubBroadcastServiceI {

	/**
	 * 分页查询新闻内容
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * @author lumingwen
	 */
	public PageList<PubBroadcastContentDto> listPubBroadcastContentByPage(
			PubBroadcastContentDto queryParam, PageBounds pageBounds);

	/**
	 * 根据id删除旅游播报
	 * 
	 * @param Id
	 *            旅游播报id
	 */
	public void deleteById(Long Id);

	/**
	 * 编辑保存
	 * 
	 * @author lumingwen
	 * @param dto
	 */
	public void save(PubBroadcastContentDto dto);

	/**
	 * 查找
	 * 
	 * @author lumingwen
	 * @param id
	 */
	public PubBroadcastContentDto findById(String id);

}
