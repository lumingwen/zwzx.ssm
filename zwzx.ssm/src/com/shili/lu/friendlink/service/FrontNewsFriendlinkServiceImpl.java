package com.shili.lu.friendlink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shili.lu.friendlink.dao.NewsFriendlinkCtgMapper;
import com.shili.lu.friendlink.dao.NewsFriendlinkMapper;
import com.shili.lu.friendlink.model.NewsFriendlink;

@Service("frontNewsFriendlinkService")
public class FrontNewsFriendlinkServiceImpl implements
		FrontNewsFriendlinkServiceI {

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

	@Override
	public List<NewsFriendlink> findFriendlinkByCtg(String friendlinkctgName) {
		return newsFriendlinkMapper.findFriendlinkByCtg(friendlinkctgName);
	}

}
