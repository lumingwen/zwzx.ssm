package com.shili.lu.rms.dao;

import java.util.List;

import com.shili.lu.rms.dto.RmsMenuDto;
import com.shili.lu.rms.model.RmsMenu;

/**
 * 菜单
 * 
 * @author zhangxujun
 * 
 * 
 */

public interface RmsMenuMapper {
	int deleteByPrimaryKey(Long id);

	int insert(RmsMenu record);

	RmsMenu selectByPrimaryKey(Long id);

	int updateByPrimaryKey(RmsMenu record);

	/**
	 * 查询菜单
	 * 
	 */
	public List<RmsMenuDto> listMenu(RmsMenuDto menu);
}