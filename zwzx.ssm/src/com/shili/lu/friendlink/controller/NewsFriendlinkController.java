/**
 * 
 */
package com.shili.lu.friendlink.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.Order.Direction;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.util.Constants;
import com.shili.lu.common.util.PageUtils;
import com.shili.lu.friendlink.dto.NewsFriendlinkCtgDto;
import com.shili.lu.friendlink.dto.NewsFriendlinkDto;
import com.shili.lu.friendlink.model.NewsFriendlink;
import com.shili.lu.friendlink.model.NewsFriendlinkCtg;
import com.shili.lu.friendlink.service.NewsFriendlinkServiceI;
import com.shili.lu.rms.controller.BaseController;
import com.shili.lu.rms.dto.SessionUserDto;

/**
 * 链接Controller
 * 
 * @author lumingwen
 * 
 * 
 */
@Controller
@RequestMapping("/friendlink")
public class NewsFriendlinkController extends BaseController {

	/**
	 * 链接类型service
	 */
	@Autowired
	private NewsFriendlinkServiceI newsFriendlinkService;

	/**
	 * 查询链接内容
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping("/listFriendlinkCtgInfo")
	@NoSecurity
	public ModelAndView list(HttpServletRequest req,
			NewsFriendlinkCtgDto queryParam) {

		if (queryParam == null) {
			queryParam = new NewsFriendlinkCtgDto();
		}

		List<NewsFriendlinkCtgDto> list = newsFriendlinkService
				.selectAllData(queryParam);
		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);
		m.getModel().put("newsFriendlinkCtg", list);
		m.setViewName("forward:/WEB-INF/pages/link/news_friendlink_ctg_detail.jsp");
		return m;
	}

	/**
	 * 删除
	 * 
	 */
	@RequestMapping("/deleteFriendlinkCtgInfo")
	@NoSecurity
	public ModelAndView delete(Long id) {
		newsFriendlinkService.deleteFriendlinkCtgById(id);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listFriendlinkCtgInfo.do");
		return m;
	}

	/**
	 * 添加
	 * 
	 */
	@RequestMapping("/addFriendlinkCtg")
	@NoSecurity
	public ModelAndView add() {
		ModelAndView m = new ModelAndView();
		m.getModel().put("type", "insert");
		m.setViewName("forward:/WEB-INF/pages/link/news_friendlink_ctg_edit.jsp");
		return m;
	}

	/**
	 * 保存
	 * 
	 */
	@RequestMapping("/saveFriendlinkCtg")
	@NoSecurity
	public ModelAndView save(NewsFriendlinkCtg dto, HttpServletRequest req,
			HttpSession session) {
		SessionUserDto sessionUser = (SessionUserDto) req.getSession()
				.getAttribute(Constants.STORE_USER_IN_SESSION);
		dto.setUserId(sessionUser.getId());
		newsFriendlinkService.saveFriendlinkCtg(dto);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listFriendlinkCtgInfo.do");
		return m;
	}

	/**
	 * 根据特定id查询相应的旅游播报
	 * 
	 */
	@RequestMapping("/editFriendlinkCtg")
	public ModelAndView edit(String bid, HttpServletRequest request) {
		NewsFriendlinkCtg newsFriendlinkCtg = newsFriendlinkService
				.findFriendlinkCtgById(bid);
		ModelAndView m = new ModelAndView();
		m.getModel().put("type", "edit");
		m.getModel().put("dto", newsFriendlinkCtg);
		m.setViewName("forward:/WEB-INF/pages/link/news_friendlink_ctg_edit.jsp");
		return m;
	}

	/**
	 * 添加
	 * 
	 */
	@RequestMapping("/managerFriendlink")
	public ModelAndView managerAdvertising() {
		ModelAndView m = new ModelAndView();
		m.getModel().put("type", "insert");
		NewsFriendlinkCtgDto qyeryParam = new NewsFriendlinkCtgDto();

		List<NewsFriendlinkCtgDto> list = newsFriendlinkService
				.selectAllData(qyeryParam);
		m.getModel().put("friendlinkctglist", list);
		m.setViewName("forward:/WEB-INF/pages/link/news_friendlink_edit.jsp");
		return m;
	}

	/**
	 * 保存
	 * 
	 */
	@RequestMapping("/saveFriendlink")
	public ModelAndView saveFriendlink(HttpServletRequest req,
			NewsFriendlinkDto dto) {
		dto.setCreateTime(new Date());
		dto.setUpdateTime(new Date());
		SessionUserDto sessionUser = (SessionUserDto) req.getSession()
				.getAttribute(Constants.STORE_USER_IN_SESSION);
		dto.setUserId(sessionUser.getId());
		dto.setDeleteFlag(Constants.DEL_FLAG_NO);
		newsFriendlinkService.saveFriendlink(dto);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listFriendlinkInfo.do?page=1&limit=10");
		return m;
	}

	/**
	 * 分页查询链接内容
	 * 
	 * @param req
	 * @param queryParam
	 * @param pageBounds
	 * @return
	 */
	@RequestMapping("/listFriendlinkInfo")
	@NoSecurity
	public ModelAndView listFriendlinkInfo(HttpServletRequest req,
			NewsFriendlinkDto queryParam, PageBounds pageBounds) {

		if (queryParam == null) {
			queryParam = new NewsFriendlinkDto();
		}

		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("create_time", Direction.DESC, ""));
		PageList<NewsFriendlinkDto> newsFriendlinkList = newsFriendlinkService
				.listFriendlinkByPage(queryParam, pageBounds);

		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);
		m.getModel().put("list", newsFriendlinkList);
		m.getModel().put("pagestr",
				PageUtils.buildPageStr(newsFriendlinkList.getPaginator()));
		String source = req.getParameter("source");
		m.getModel().put("message", source);
		m.setViewName("forward:/WEB-INF/pages/link/news_friendlink_list.jsp");
		return m;

	}

	/**
	 * 删除
	 * 
	 */
	@RequestMapping("/deleteFriendlinkInfo")
	@NoSecurity
	public ModelAndView deleteFriendlinkInfo(Long id) {
		newsFriendlinkService.deleteFriendlinkById(id);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listFriendlinkInfo.do?limit=10&page=1");
		return m;
	}

	/*
	 * 编辑相应广告
	 */
	@RequestMapping("/editFriendlink")
	public ModelAndView editFriendlink(String bid, HttpServletRequest request) {
		NewsFriendlink newsFriendlink = newsFriendlinkService
				.findFriendlinkById(bid);
		ModelAndView m = new ModelAndView();
		m.getModel().put("type", "edit");
		m.getModel().put("dto", newsFriendlink);

		NewsFriendlinkCtgDto qyeryParam = new NewsFriendlinkCtgDto();

		List<NewsFriendlinkCtgDto> list = newsFriendlinkService
				.selectAllData(qyeryParam);
		m.getModel().put("friendlinkctglist", list);
		m.setViewName("forward:/WEB-INF/pages/link/news_friendlink_edit.jsp");
		return m;
	}

	/**
	 * 根据特定id查询相应的旅游播报
	 * 
	 */
	@RequestMapping("/findFriendlinkById")
	public ModelAndView findFriendlinkById(String bid,
			HttpServletRequest request) {
		NewsFriendlink newsFriendlink = newsFriendlinkService
				.findFriendlinkById(bid);
		ModelAndView m = new ModelAndView();
		m.getModel().put("type", "detail");
		NewsFriendlinkCtgDto qyeryParam = new NewsFriendlinkCtgDto();

		List<NewsFriendlinkCtgDto> list = newsFriendlinkService
				.selectAllData(qyeryParam);
		m.getModel().put("friendlinkctglist", list);
		m.getModel().put("dto", newsFriendlink);
		m.setViewName("forward:/WEB-INF/pages/link/news_friendlink_edit.jsp");
		return m;
	}

}
