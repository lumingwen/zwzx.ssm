package com.shili.lu.rms.dao;

import java.util.List;
import java.util.Map;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.rms.dto.RmsMethodDto;
import com.shili.lu.rms.model.RmsMethod;

/**
 * 方法
 * 
 * @author zhangxujun
 * 
 * 
 */

public interface RmsMethodMapper {
	int deleteByPrimaryKey(Long id);

	int insert(RmsMethod record);

	RmsMethod selectByPrimaryKey(Long id);

	int updateByPrimaryKey(RmsMethod record);

	/**
	 * 查询用户具有权限的方法
	 * 
	 * @param map
	 * @return
	 */
	List<RmsMethod> listMethodPermissionByUser(Map<String, Object> map);

	/**
	 * 分页查询角色
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	public PageList<RmsMethodDto> listByPage(RmsMethodDto queryParam,
			PageBounds pageBounds);
}