package com.shili.lu.rms.dao;

import java.util.List;

import com.shili.lu.rms.model.RmsRoleMethod;

/**
 * 角色分配方法
 * 
 * @author zhangxujun
 * 
 * 
 */

public interface RmsRoleMethodMapper {
	int deleteByPrimaryKey(Long id);

	int insert(RmsRoleMethod record);

	RmsRoleMethod selectByPrimaryKey(Long id);

	List<RmsRoleMethod> selectByMethodId(Long id);

	int updateByPrimaryKey(RmsRoleMethod record);

	int deleteByRoleId(Long roleId);
}