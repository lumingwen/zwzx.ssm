/**
 * 
 */
package com.shili.lu.rms.dto;

import java.util.List;

import com.shili.lu.rms.model.RmsMenu;

/**
 * 菜单dto
 * 
 * @author zhangxujun
 * 
 * 
 */
public class RmsMenuDto extends RmsMenu {

	/**
	 * 是否选中
	 */
	private boolean checked = false;

	/**
	 * 角色id
	 */
	private Long roleId;

	/**
	 * 子菜单
	 */
	private List<RmsMenuDto> childList;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public List<RmsMenuDto> getChildList() {
		return childList;
	}

	public void setChildList(List<RmsMenuDto> childList) {
		this.childList = childList;
	}
}
