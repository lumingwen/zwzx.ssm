package com.shili.lu.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.util.Constants;
import com.shili.lu.rms.dto.SessionUserDto;
import com.shili.lu.rms.service.RmsUserServiceI;

/**
 * 
 * springmvc拦截器
 * 
 * @author zhangxujun
 * 
 * 
 */
public class SecurityInterceptor extends HandlerInterceptorAdapter {

	/**
	 * log
	 */
	private static final Logger log = Logger
			.getLogger(SecurityInterceptor.class);

	/**
	 * 用户service
	 */
	@Autowired
	private RmsUserServiceI rmsUserService;

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	/**
	 * 方法调用前拦截
	 */
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp,
			Object object) throws Exception {

		// 取得class及method
		HandlerMethod handler = (HandlerMethod) object;
		NoSecurity noSec = handler.getMethodAnnotation(NoSecurity.class);

		// log.error("调用方法: "+handler.getBeanType().getName()+":"+handler.getMethod().getName());

		// 判断是否需要执行安全验证
		if (noSec != null) {
			// log.error("不需要校验");
			return true;
		} else {
			// log.error("需要校验");
		}
		SessionUserDto user = (SessionUserDto) req.getSession().getAttribute(
				Constants.STORE_USER_IN_SESSION);
		if (user == null) {
			resp.sendRedirect(req.getContextPath() + "/main.do");
			return false;
		}

		return true;

	}

}
