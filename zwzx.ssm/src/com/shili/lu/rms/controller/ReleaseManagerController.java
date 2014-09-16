package com.shili.lu.rms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shili.lu.common.annotation.NoSecurity;

/**
 * 
 * @author Administrator
 * 
 *         发布管理
 * @date 2014-7-9 上午01:51:06
 * 
 * @version V1.0
 */
@Controller
@RequestMapping("/")
public class ReleaseManagerController {
	/**
	 * 登录
	 * 
	 */
	@RequestMapping("/releaseManager")
	@NoSecurity
	public ModelAndView ReleaseManager() {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/main/login.jsp");
		return m;
	}
}
