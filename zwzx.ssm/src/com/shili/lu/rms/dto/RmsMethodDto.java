/**
 * 
 */
package com.shili.lu.rms.dto;

import com.shili.lu.rms.model.RmsMethod;

/**
 * 方法资源dto
 * 
 * @author zhangxujun
 * 
 * 
 */
public class RmsMethodDto extends RmsMethod {

	/**
	 * 字符串参数全匹配
	 */
	private boolean fullMatch = false;

	/**
	 * 是否选中
	 */
	private boolean checked = false;

	/**
	 * 角色id
	 */
	private Long roleId;

	public boolean isFullMatch() {
		return fullMatch;
	}

	public void setFullMatch(boolean fullMatch) {
		this.fullMatch = fullMatch;
	}

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

}
