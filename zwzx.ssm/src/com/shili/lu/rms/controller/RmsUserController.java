/**
 * 
 */
package com.shili.lu.rms.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.Order.Direction;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.util.PageUtils;
import com.shili.lu.rms.dto.RmsRoleDto;
import com.shili.lu.rms.dto.RmsUserDto;
import com.shili.lu.rms.model.RmsUser;
import com.shili.lu.rms.service.RmsRoleServiceI;
import com.shili.lu.rms.service.RmsUserServiceI;

/**
 * 用户管理
 * 
 * @author zhangxujun
 * 
 * 
 */
@Controller
@RequestMapping("/user")
public class RmsUserController extends BaseController {

	/**
	 * 用户service
	 */
	@Autowired
	private RmsUserServiceI rmsUserService;

	/**
	 * 角色service
	 */
	@Autowired
	private RmsRoleServiceI rmsRoleService;

	/**
	 * 列表
	 * 
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest req, RmsUserDto queryParam,
			PageBounds pageBounds) {

		if (queryParam == null) {
			queryParam = new RmsUserDto();
		}

		// queryParam.setUserTypes(Constants.USER_TYPE_ADMIN + ","
		// + Constants.USER_TYPE_ADMIN_NORMAL);
		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("update_time", Direction.DESC, ""));
		PageList<RmsUserDto> userList = rmsUserService.listByPage(queryParam,
				pageBounds);

		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);
		m.getModel().put("userList", userList);
		m.getModel().put("pagestr",
				PageUtils.buildPageStr(userList.getPaginator()));
		String source = req.getParameter("source");
		m.getModel().put("message", source);
		m.setViewName("forward:/WEB-INF/pages/user/list.jsp");
		return m;

	}

	/**
	 * 新增/编辑页面
	 * 
	 */
	@RequestMapping("/toEdit")
	public ModelAndView toEdit(Long userId) {

		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/user/edit.jsp");

		RmsRoleDto queryParam = new RmsRoleDto();
		PageBounds pageBounds = new PageBounds();
		pageBounds.setLimit(Integer.MAX_VALUE);
		pageBounds.setContainsTotalCount(false);
		PageList<RmsRoleDto> roleList = rmsRoleService.listByPage(queryParam,
				pageBounds);

		m.getModel().put("roleList", roleList);

		if (userId != null && userId > 0) {
			RmsUser user = rmsUserService.getById(userId);
			m.getModel().put("user", user);
		}

		return m;
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping("/editPassword")
	public ModelAndView editPassword(HttpServletRequest req) {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/user/editPassword.jsp");
		m.getModel().put("user", this.getSessionUser(req));
		return m;
	}

	/**
	 * 检查用户密码是否正确
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping("/checkPassword")
	@NoSecurity
	public void checkPassword(HttpServletRequest req,
			HttpServletResponse response, String password) throws IOException {
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		req.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String res = "n";// 校验失败
		RmsUser user = getSessionUser(req);
		user.setPassword(password);
		boolean f = rmsUserService.checkPassword(user);
		if (rmsUserService.checkPassword(user)) {
			res = "y";// 校验通过
		}
		response.getWriter().write(res);
	}

	/**
	 * 保存修改密码
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping("/savePassword")
	@NoSecurity
	public void savePassword(HttpServletRequest req,
			HttpServletResponse response, String password) throws IOException {
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		req.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String res = "y";// 校验失败
		RmsUser user = getSessionUser(req);
		user.setPassword(password);
		rmsUserService.saveUserPassword(user);
		response.getWriter().write(res);
	}

	/**
	 * 新增/编辑
	 * 
	 */
	@RequestMapping("/edit")
	public ModelAndView edit(RmsUser user) {

		ModelAndView m = new ModelAndView();
		String source = user.getId() == null || user.getId() <= 0 ? "1" : "2";
		m.setViewName("redirect:list.do?limit=10&page=1&source=" + source);

		// 用户名校验
		if (!rmsUserService.isUserNameAvalible(user)) {
			RmsRoleDto queryParam = new RmsRoleDto();
			PageBounds pageBounds = new PageBounds();
			pageBounds.setLimit(Integer.MAX_VALUE);
			pageBounds.setContainsTotalCount(false);
			PageList<RmsRoleDto> roleList = rmsRoleService.listByPage(
					queryParam, pageBounds);
			m.getModel().put("roleList", roleList);
			m.setViewName("forward:/WEB-INF/pages/user/edit.jsp");
			m.getModel().put("message", "用户名已存在");
			m.getModel().put("user", user);
			return m;
		}

		rmsUserService.saveOrUpdateRmsUser(user);
		return m;
	}

	/**
	 * 删除
	 * 
	 */
	@RequestMapping("/delete")
	public ModelAndView delete(Long userId) {
		rmsUserService.deleteById(userId);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:list.do?limit=10&page=1&source=3");
		return m;
	}

	/**
	 * 查看页面
	 * 
	 */
	@RequestMapping("/view")
	public ModelAndView view(Long userId) {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/user/view.jsp");
		m.getModel().put("user", rmsUserService.getById(userId));
		return m;
	}
}
