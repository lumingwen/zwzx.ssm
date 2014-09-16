package com.shili.lu.rms.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.rms.dto.RmsUserDto;
import com.shili.lu.rms.model.RmsUser;

public interface RmsUserMapper {
	int deleteByPrimaryKey(Long id);

	int insert(RmsUser record);

	RmsUser selectByPrimaryKey(Long id);

	int updateByPrimaryKey(RmsUser record);

	/**
	 * 分页查询用户
	 * 
	 * @param queryParam
	 * @param pageBounds
	 * 
	 */
	public PageList<RmsUserDto> listRmsUserByPage(RmsUserDto queryParam,
			PageBounds pageBounds);

	/**
	 * 冻结用户
	 * 
	 * @param id
	 * @return
	 */
	public int stopBusiness(Long id);

	/**
	 * 启用用户
	 * 
	 * @author Administrator 2014-6-5 下午6:03:49
	 * @param id
	 * @return
	 */
	public int startBusiness(Long id);

	List<RmsUser> selectByRoleId(Long id);

	public void addScore(RmsUser user);

	/**
	 * 根据用户名查询用户
	 * 
	 * @param username
	 * @return
	 */
	public RmsUser selectByName(String name);
}