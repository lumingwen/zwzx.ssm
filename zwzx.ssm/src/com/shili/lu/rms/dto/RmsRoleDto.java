/**
 * 
 */
package com.shili.lu.rms.dto;

import java.util.List;

import com.shili.lu.rms.model.RmsRole;

/**
 * 角色dto
 * 
 * @author zhangxujun
 * 
 * 
 */
public class RmsRoleDto extends RmsRole {

	/**
	 * 菜单列表
	 */
	private List<RmsMenuDto> menuList;

	/**
	 * 资源列表
	 */
	private List<RmsMethodDto> methodList;

	/**
	 * 字符串参数全匹配
	 */
	private boolean fullMatch = false;

	public boolean isFullMatch() {
		return fullMatch;
	}

	public void setFullMatch(boolean fullMatch) {
		this.fullMatch = fullMatch;
	}

	public List<RmsMenuDto> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<RmsMenuDto> menuList) {
		this.menuList = menuList;
	}

	public List<RmsMethodDto> getMethodList() {
		return methodList;
	}

	public void setMethodList(List<RmsMethodDto> methodList) {
		this.methodList = methodList;
	}

}
