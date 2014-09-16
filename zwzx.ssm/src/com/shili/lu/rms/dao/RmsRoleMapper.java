package com.shili.lu.rms.dao;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.rms.dto.RmsRoleDto;
import com.shili.lu.rms.model.RmsRole;

/**
 * 角色
 * 
 * @author zhangxujun
 * 
 * 
 */

public interface RmsRoleMapper {

	/**
	 * 分页查询角色
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	public PageList<RmsRoleDto> listRoleByPage(RmsRoleDto queryParam,
			PageBounds pageBounds);

	int deleteByPrimaryKey(Long id);

	int insert(RmsRole record);

	RmsRole selectByPrimaryKey(Long id);

	int updateByPrimaryKey(RmsRole record);

}