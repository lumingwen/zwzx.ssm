/**
 * 
 */
package com.shili.lu.rms.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.util.CaptchaUtils;
import com.shili.lu.common.util.Constants;
import com.shili.lu.common.util.MD5;
import com.shili.lu.rms.dto.SessionUserDto;
import com.shili.lu.rms.model.RmsUser;
import com.shili.lu.rms.service.RmsUserServiceI;

/**
 * 
 * 主页
 * 
 * @author zhangxujun
 * 
 * 
 */
@Controller
@RequestMapping("/")
public class MainController extends BaseController {

	/**
	 * 用户service
	 */
	@Autowired
	private RmsUserServiceI rmsUserService;

	/**
	 * 登录
	 * 
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@NoSecurity
	public ModelAndView login(HttpServletRequest req, HttpSession session,
			RmsUser user) {
		ModelAndView m = new ModelAndView();
		boolean issuccess = true;
		String errorMessage = "";

		String code = (String) session
				.getAttribute(Constants.DEFAULT_CAPTCHA_PARAM);

		if (StringUtils.isNotBlank(code)) {
			code = code.toLowerCase().toString();
		}
		String submitCode = WebUtils.getCleanParam(req,
				Constants.DEFAULT_CAPTCHA_PARAM);
		if (StringUtils.isNotBlank(submitCode)) {
			submitCode = submitCode.toLowerCase().toString();
		}
		if (StringUtils.isBlank(submitCode) || StringUtils.isBlank(code)
				|| !code.equals(submitCode)) {
			issuccess = false;
			errorMessage = "验证码不正确";
		} else {

			if (user == null || StringUtils.isBlank(user.getName())
					|| StringUtils.isBlank(user.getPassword())) {
				issuccess = false;
				errorMessage = "用户名或密码不能为空";
			} else {
				user.setName(StringUtils.trim(user.getName()));
				user.setPassword(StringUtils.trim(user.getPassword()));
				RmsUser loginUser = rmsUserService.getByName(user.getName());
				if (loginUser == null) {
					issuccess = false;
					errorMessage = "用户不存在";
				} else {
					String loginPassword = MD5.getMD5String(user.getPassword()
							+ loginUser.getPasswordKey());
					String persistPassword = loginUser.getPassword();
					if (!persistPassword.equalsIgnoreCase(loginPassword)) {
						issuccess = false;
						errorMessage = "密码不正确";
					} else {
						// 登录成功
						SessionUserDto sessionUser = new SessionUserDto();
						try {
							PropertyUtils
									.copyProperties(sessionUser, loginUser);
						} catch (Exception e) {
							e.printStackTrace();
						}
						req.getSession().setAttribute(
								Constants.STORE_USER_IN_SESSION, sessionUser);
						issuccess = true;
					}
				}
			}
		}

		if (issuccess) {
			// m.setViewName("redirect:/main.do");
			m.getModel().put("user", user);
			m.setViewName("forward:/WEB-INF/pages/main/admin/main.jsp");
		} else {
			m.setViewName("forward:/WEB-INF/pages/main/login.jsp");
			m.getModel().put("errorMessage", errorMessage);
			m.getModel().put("user", user);
		}
		return m;
	}

	/**
	 * 登录
	 * 
	 */
	@RequestMapping("/main")
	@NoSecurity
	public ModelAndView main() {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/main/login.jsp");
		return m;
	}

	/**
	 * 顶部
	 * 
	 */
	@RequestMapping("/top")
	@NoSecurity
	public ModelAndView top() {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/main/admin/admin_top.jsp");
		return m;
	}

	/**
	 * 左边
	 * 
	 */
	@RequestMapping("/left")
	@NoSecurity
	public ModelAndView left() {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/main/admin/left.jsp");
		return m;
	}

	/**
	 * 右部
	 * 
	 */
	@RequestMapping("/right")
	@NoSecurity
	public ModelAndView right() {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/main/admin/right.jsp");
		return m;
	}

	/**
	 * 生成验证码
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/getCaptcha")
	@NoSecurity
	public void getCaptcha(HttpSession session, HttpServletResponse response)
			throws IOException {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		CaptchaUtils tool = new CaptchaUtils();
		StringBuffer code = new StringBuffer();
		BufferedImage image = tool.genRandomCodeImage(code);
		session.removeAttribute(Constants.DEFAULT_CAPTCHA_PARAM);
		session.setAttribute(Constants.DEFAULT_CAPTCHA_PARAM, code.toString());

		// 将内存中的图片通过流动形式输出到客户端
		ImageIO.write(image, "JPEG", response.getOutputStream());
		return;
	}

	/**
	 * 注销
	 * 
	 */
	@RequestMapping("/logout")
	@NoSecurity
	public ModelAndView logout(HttpServletRequest req) {
		req.getSession().removeAttribute(Constants.STORE_USER_IN_SESSION);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:main.do");
		return m;
	}

	/**
	 * 登录
	 * 
	 */
	@RequestMapping("/loginPage")
	@NoSecurity
	public ModelAndView loginPage(HttpServletRequest req) {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/login.jsp");
		return m;
	}
}
