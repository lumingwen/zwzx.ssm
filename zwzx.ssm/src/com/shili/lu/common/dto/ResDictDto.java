/**
 * 
 */
package com.shili.lu.common.dto;

import com.shili.lu.common.model.ResDict;

/**
 * 字典dto
 * 
 * @author lumingwen
 * 
 * 
 */
public class ResDictDto extends ResDict {

	/**
	 * 全名
	 */
	private String fullName;

	/**
	 * 扩展参数
	 */
	private String param;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

}
