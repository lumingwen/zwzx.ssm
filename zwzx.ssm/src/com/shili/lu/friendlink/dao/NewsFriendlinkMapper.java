package com.shili.lu.friendlink.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.friendlink.dto.NewsFriendlinkDto;
import com.shili.lu.friendlink.model.NewsFriendlink;

public interface NewsFriendlinkMapper {
	int deleteByPrimaryKey(Integer friendlinkId);

	int insert(NewsFriendlink record);

	NewsFriendlink selectByPrimaryKey(Integer friendlinkId);

	int updateByPrimaryKey(NewsFriendlink record);

	public PageList<NewsFriendlinkDto> listFriendlinkByPage(
			NewsFriendlinkDto queryParam, PageBounds pageBounds);

	// 前台
	List<NewsFriendlink> findFriendlinkByCtg(
			@Param("friendlinkctgName") String friendlinkctgName);
}