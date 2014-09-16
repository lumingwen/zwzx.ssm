/**
 * 
 */
package com.shili.lu.rms.dto;

import com.shili.lu.rms.model.RmsUser;

/**
 * 系统用户dto
 * 
 * @author lumingwen
 * 
 * 
 */
public class RmsUserDto extends RmsUser {

	/**
	 * 字符串参数全匹配
	 */
	private boolean fullMatch = false;

	/**
	 * 角色名称
	 */
	private String roleName;

	/**
	 * 用户类型,多个则以逗号分隔
	 */
	private String userTypes;

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public boolean isFullMatch() {
		return fullMatch;
	}

	public void setFullMatch(boolean fullMatch) {
		this.fullMatch = fullMatch;
	}

	public String getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(String userTypes) {
		this.userTypes = userTypes;
	}

}
