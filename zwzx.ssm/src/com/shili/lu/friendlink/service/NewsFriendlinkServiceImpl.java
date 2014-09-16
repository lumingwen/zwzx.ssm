package com.shili.lu.friendlink.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.util.Constants;
import com.shili.lu.friendlink.dao.NewsFriendlinkCtgMapper;
import com.shili.lu.friendlink.dao.NewsFriendlinkMapper;
import com.shili.lu.friendlink.dto.NewsFriendlinkCtgDto;
import com.shili.lu.friendlink.dto.NewsFriendlinkDto;
import com.shili.lu.friendlink.model.NewsFriendlink;
import com.shili.lu.friendlink.model.NewsFriendlinkCtg;

@Service("newsFriendlinkService")
public class NewsFriendlinkServiceImpl implements NewsFriendlinkServiceI {

	/**
	 * 链接dao
	 */
	@Autowired
	private NewsFriendlinkMapper newsFriendlinkMapper;

	/**
	 * 链接类型dao
	 */
	@Autowired
	private NewsFriendlinkCtgMapper newsFriendlinkCtgMapper;

	/*
	 * 链接类型的查看
	 * 
	 * @see
	 * com.shili.lu.friendlink.service.NewsFriendlinkServiceI#selectAllData(
	 * com.shili.lu.friendlink.model.NewsFriendlinkCtg)
	 */
	@Override
	public List<NewsFriendlinkCtgDto> selectAllData(NewsFriendlinkCtg queryParam) {
		return newsFriendlinkCtgMapper.selectAllData(queryParam);
	}

	/**
	 * 根据id删除链接类型
	 * 
	 * @param Id
	 */
	@Override
	public void deleteFriendlinkCtgById(Long Id) {
		if (Id != null) {
			newsFriendlinkCtgMapper.deleteByPrimaryKey(Id.intValue());
		}
	}

	@Override
	public void saveFriendlinkCtg(NewsFriendlinkCtg dto) {
		if (dto.getFriendlinkctgId() == null
				|| "".equals(dto.getFriendlinkctgId())) {
			dto.setCreateTime(new Date());
			dto.setUpdateTime(new Date());
			dto.setDeleteFlag(Constants.DEL_FLAG_NO);
			newsFriendlinkCtgMapper.insert(dto);// 新增
		} else {
			NewsFriendlinkCtg newlinkctg = newsFriendlinkCtgMapper
					.selectByPrimaryKey(dto.getFriendlinkctgId());
			dto.setCreateTime(newlinkctg.getCreateTime());
			dto.setUpdateTime(new Date());
			dto.setDeleteFlag(Constants.DEL_FLAG_NO);
			newsFriendlinkCtgMapper.updateByPrimaryKey(dto);// 更新
		}

	}

	@Override
	public NewsFriendlinkCtg findFriendlinkCtgById(String id) {
		return newsFriendlinkCtgMapper.selectByPrimaryKey(Integer.parseInt(id));

	}

	@Override
	public void saveFriendlink(NewsFriendlinkDto dto) {
		if (dto.getFriendlinkId() == null || "".equals(dto.getFriendlinkId())) {
			newsFriendlinkMapper.insert(dto);// 新增
		} else {
			newsFriendlinkMapper.updateByPrimaryKey(dto);// 更新
		}

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
	public PageList<NewsFriendlinkDto> listFriendlinkByPage(
			NewsFriendlinkDto queryParam, PageBounds pageBounds) {
		return newsFriendlinkMapper
				.listFriendlinkByPage(queryParam, pageBounds);
	}

	@Override
	public void deleteFriendlinkById(Long Id) {
		if (Id != null) {
			newsFriendlinkMapper.deleteByPrimaryKey(Id.intValue());
		}

	}

	@Override
	public NewsFriendlink findFriendlinkById(String id) {
		return newsFriendlinkMapper.selectByPrimaryKey(Integer.parseInt(id));

	}

}
