/**
 * 
 */
package com.shili.lu.rms.controller;

import javax.servlet.http.HttpServletRequest;

import com.shili.lu.common.util.Constants;
import com.shili.lu.rms.dto.SessionUserDto;

/**
 * 
 * 基类
 * 
 * @author lumw
 * 
 * 
 */
public abstract class BaseController {

	/*
	 * 取得当前登录用户
	 */
	public SessionUserDto getSessionUser(HttpServletRequest req) {
		Object obj = req.getSession().getAttribute(
				Constants.STORE_USER_IN_SESSION);
		if (obj != null && obj instanceof SessionUserDto) {
			return (SessionUserDto) obj;
		}
		return null;
	}

	/**
	 * 取得登录用户id
	 * 
	 * @param req
	 * @return
	 */
	public Long getSessionUserId(HttpServletRequest req) {
		SessionUserDto user = getSessionUser(req);
		return user == null ? null : user.getId();
	}

}
