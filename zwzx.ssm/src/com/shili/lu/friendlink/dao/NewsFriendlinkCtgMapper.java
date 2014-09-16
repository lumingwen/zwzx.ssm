package com.shili.lu.friendlink.dao;

import java.util.List;

import com.shili.lu.friendlink.dto.NewsFriendlinkCtgDto;
import com.shili.lu.friendlink.model.NewsFriendlinkCtg;

public interface NewsFriendlinkCtgMapper {
	int deleteByPrimaryKey(Integer friendlinkctgId);

	int insert(NewsFriendlinkCtg record);

	NewsFriendlinkCtg selectByPrimaryKey(Integer friendlinkctgId);

	int updateByPrimaryKey(NewsFriendlinkCtg record);

	List<NewsFriendlinkCtgDto> selectAllData(NewsFriendlinkCtg record);

}