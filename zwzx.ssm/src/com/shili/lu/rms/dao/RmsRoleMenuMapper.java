package com.shili.lu.rms.dao;

import com.shili.lu.rms.model.RmsRoleMenu;

/**
 * 角色分配菜单
 * 
 * @author zhangxujun
 * 
 * 
 */

public interface RmsRoleMenuMapper {
	int deleteByPrimaryKey(Long id);

	int insert(RmsRoleMenu record);

	RmsRoleMenu selectByPrimaryKey(Long id);

	int updateByPrimaryKey(RmsRoleMenu record);

	int deleteByRoleId(Long roleId);
}