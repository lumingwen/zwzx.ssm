package com.shili.lu.friendlink.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.friendlink.dto.NewsFriendlinkCtgDto;
import com.shili.lu.friendlink.dto.NewsFriendlinkDto;
import com.shili.lu.friendlink.model.NewsFriendlink;
import com.shili.lu.friendlink.model.NewsFriendlinkCtg;

public interface NewsFriendlinkServiceI {

	/**
	 * 链接类别
	 * 
	 * @author lumingwen
	 */
	public List<NewsFriendlinkCtgDto> selectAllData(NewsFriendlinkCtg queryParam);

	/**
	 * 根据id删除链接类型
	 * 
	 * @param Id
	 */
	public void deleteFriendlinkCtgById(Long Id);

	/**
	 * 编辑保存
	 * 
	 * @author lumingwen
	 * @param dto
	 */
	public void saveFriendlinkCtg(NewsFriendlinkCtg dto);

	/**
	 * 查找
	 * 
	 * @author lumingwen
	 * @param id
	 */
	public NewsFriendlinkCtg findFriendlinkCtgById(String id);

	/**
	 * 编辑链接保存
	 * 
	 * @author lumingwen
	 * @param dto
	 */
	public void saveFriendlink(NewsFriendlinkDto dto);

	/**
	 * 分页查询链接内容
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * @author lumingwen
	 */
	public PageList<NewsFriendlinkDto> listFriendlinkByPage(
			NewsFriendlinkDto queryParam, PageBounds pageBounds);

	/**
	 * 根据id删除链接
	 * 
	 * @param Id
	 *            链接id
	 */
	public void deleteFriendlinkById(Long Id);

	/**
	 * 查找
	 * 
	 * @author lumingwen
	 * @param id
	 */
	public NewsFriendlink findFriendlinkById(String id);

}
