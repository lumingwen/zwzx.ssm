/**
 * 
 */
package com.shili.lu.rms.service;

import java.util.List;

import com.shili.lu.rms.dto.RmsMenuDto;

/**
 * 菜单service
 * 
 * @author zhangxujun
 * 
 * 
 */
public interface RmsMenuServiceI {

	/**
	 * 根据角色查询所有菜单
	 * 
	 * @param roleId
	 *            角色id
	 * 
	 */
	public List<RmsMenuDto> listAllMenuByRoleId(Long roleId);

	/**
	 * 查询所有菜单
	 * 
	 */
	public List<RmsMenuDto> listAllMenu();

	/**
	 * 新增菜单(级联保存)
	 * 
	 * @param menu
	 */
	public void insertMenu(RmsMenuDto dto);

	/**
	 * 根据权限查询系统菜单json字符串
	 * 
	 * @param userId
	 *            用户id
	 * 
	 */
	public String getMenuJson(Long userId);

}
