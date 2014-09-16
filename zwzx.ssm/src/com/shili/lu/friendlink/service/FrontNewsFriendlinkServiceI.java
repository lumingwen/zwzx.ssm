package com.shili.lu.friendlink.service;

import java.util.List;

import com.shili.lu.friendlink.model.NewsFriendlink;

public interface FrontNewsFriendlinkServiceI {

	/**
	 * 根据链接类型查询相应的链接
	 */
	public List<NewsFriendlink> findFriendlinkByCtg(String friendlinkctgName);

}
