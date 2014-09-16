/**
 * 
 */
package com.shili.lu.advertising.controller;

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
import com.shili.lu.advertising.dto.NewsAdvertisingDto;
import com.shili.lu.advertising.dto.NewsAdvertisingSpaceDto;
import com.shili.lu.advertising.model.NewsAdvertising;
import com.shili.lu.advertising.model.NewsAdvertisingSpace;
import com.shili.lu.advertising.service.NewsAdvertisingServiceI;
import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.util.Constants;
import com.shili.lu.common.util.PageUtils;
import com.shili.lu.rms.controller.BaseController;
import com.shili.lu.rms.dto.SessionUserDto;

/**
 * 广告Controller
 * 
 * @author lumingwen
 * 
 * 
 */
@Controller
@RequestMapping("/advertising")
public class NewsAdvertisingController extends BaseController {

	/**
	 * 广告类型service
	 */
	@Autowired
	private NewsAdvertisingServiceI newsAdvertisingService;

	/**
	 * 分页查询广告内容
	 * 
	 * @param req
	 * @param queryParam
	 * @param pageBounds
	 * @return
	 */
	@RequestMapping("/listAdvertisingSpaceInfo")
	@NoSecurity
	public ModelAndView list(HttpServletRequest req,
			NewsAdvertisingSpaceDto queryParam, PageBounds pageBounds) {

		if (queryParam == null) {
			queryParam = new NewsAdvertisingSpaceDto();
		}

		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("create_time", Direction.DESC, ""));
		PageList<NewsAdvertisingSpaceDto> newsAdvertisingList = newsAdvertisingService
				.listNewsAdvertisingSpaceByPage(queryParam, pageBounds);

		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);
		m.getModel().put("list", newsAdvertisingList);
		m.getModel().put("pagestr",
				PageUtils.buildPageStr(newsAdvertisingList.getPaginator()));
		String source = req.getParameter("source");
		m.getModel().put("message", source);
		m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_space_list.jsp");
		return m;

	}

	/**
	 * 删除
	 * 
	 */
	@RequestMapping("/deleteAdvertisingSpaceInfo")
	@NoSecurity
	public ModelAndView delete(Long id) {
		newsAdvertisingService.deleteById(id);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listAdvertisingSpaceInfo.do?limit=10&page=1");
		return m;
	}

	/**
	 * 添加
	 * 
	 */
	@RequestMapping("/addAdvertisingSpace")
	@NoSecurity
	public ModelAndView add() {
		ModelAndView m = new ModelAndView();
		m.getModel().put("type", "insert");
		m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_space_addoredit.jsp");
		return m;
	}

	/**
	 * 保存
	 * 
	 */
	@RequestMapping("/saveAdvertisingSpace")
	@NoSecurity
	public ModelAndView save(NewsAdvertisingSpaceDto dto, String type,
			HttpServletRequest req, HttpSession session) {
		ModelAndView m = new ModelAndView();
		if (dto != null && dto.getAdName() != null
				&& !dto.getAdName().equals("")) {
			if (newsAdvertisingService.selecAdvertisingSpacetByAdName(dto)) {
				dto.setCreateTime(new Date());
				dto.setUpdateTime(new Date());
				SessionUserDto sessionUser = (SessionUserDto) req.getSession()
						.getAttribute(Constants.STORE_USER_IN_SESSION);
				dto.setUserId(sessionUser.getId());
				dto.setDeleteFlag(Constants.DEL_FLAG_NO);
				newsAdvertisingService.save(dto);

				m.setViewName("redirect:listAdvertisingSpaceInfo.do?limit=10&page=1");
				return m;
			} else {
				if (type.equals("insert")) {
					m.getModel().put("type", "insert");
				} else {
					m.getModel().put("type", "edit");
				}
				m.getModel().put("message", "已经存在，请从新输入");
				m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_space_addoredit.jsp");
				return m;
			}
		} else {
			if (type.equals("insert")) {
				m.getModel().put("type", "insert");
			} else {
				m.getModel().put("type", "edit");
			}
			m.getModel().put("message", "请输入广告排位名");
			m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_space_addoredit.jsp");
			return m;
		}
	}

	/**
	 * 根据特定id查询相应的旅游播报
	 * 
	 */
	@RequestMapping("/editAdvertisingSpace")
	public ModelAndView edit(String bid, HttpServletRequest request) {
		NewsAdvertisingSpace newsAdvertisingSpace = newsAdvertisingService
				.findById(bid);
		ModelAndView m = new ModelAndView();
		m.getModel().put("type", "edit");
		m.getModel().put("newsAdvertisingSpace", newsAdvertisingSpace);
		m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_space_addoredit.jsp");
		return m;
	}

	/**
	 * 根据特定id查询相应的广告
	 * 
	 */
	@RequestMapping("/findAdvertisingSpaceById")
	public ModelAndView findAdvertisingSpaceById(String bid,
			HttpServletRequest request) {
		NewsAdvertisingSpace newsAdvertisingSpace = newsAdvertisingService
				.findById(bid);
		ModelAndView m = new ModelAndView();
		m.getModel().put("type", "detail");
		m.getModel().put("newsAdvertisingSpace", newsAdvertisingSpace);
		m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_space_addoredit.jsp");
		return m;
	}

	// ******************************************
	/**
	 * 广告添加
	 */
	/**
	 * 添加
	 * 
	 */
	@RequestMapping("/managerAdvertising")
	public ModelAndView managerAdvertising() {
		ModelAndView m = new ModelAndView();
		// 返回版位list
		List<NewsAdvertisingSpace> advertisingList = newsAdvertisingService
				.selectAdvertisingSpace();
		m.getModel().put("advertingSpace", advertisingList);
		m.getModel().put("type", "insert");
		m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_addoredit.jsp");
		return m;
	}

	/**
	 * 保存
	 * 
	 */
	@RequestMapping("/saveAdvertisingByImage")
	public ModelAndView saveAdvertising(HttpServletRequest req,
			NewsAdvertisingDto dto) {
		dto.setCreateTime(new Date());
		dto.setUpdateTime(new Date());
		SessionUserDto sessionUser = (SessionUserDto) req.getSession()
				.getAttribute(Constants.STORE_USER_IN_SESSION);
		dto.setUserId(sessionUser.getId());
		dto.setDeleteFlag(Constants.DEL_FLAG_NO);
		newsAdvertisingService.saveAdvertising(dto);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listAdvertisingInfo.do?page=1&limit=10");
		return m;
	}

	/**
	 * 分页查询广告内容
	 * 
	 * @param req
	 * @param queryParam
	 * @param pageBounds
	 * @return
	 */
	@RequestMapping("/listAdvertisingInfo")
	@NoSecurity
	public ModelAndView listAdvertisingInfo(HttpServletRequest req,
			NewsAdvertisingDto queryParam, PageBounds pageBounds) {

		if (queryParam == null) {
			queryParam = new NewsAdvertisingDto();
		}

		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("create_time", Direction.DESC, ""));
		PageList<NewsAdvertisingDto> newsAdvertisingList = newsAdvertisingService
				.listNewsAdvertisingByPage(queryParam, pageBounds);

		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);
		m.getModel().put("list", newsAdvertisingList);
		m.getModel().put("pagestr",
				PageUtils.buildPageStr(newsAdvertisingList.getPaginator()));
		String source = req.getParameter("source");
		m.getModel().put("message", source);
		m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_list.jsp");
		return m;

	}

	/**
	 * 删除
	 * 
	 */
	@RequestMapping("/deleteAdvertisingInfo")
	@NoSecurity
	public ModelAndView deleteAdvertisingInfo(Long id) {
		newsAdvertisingService.deleteAdvertisingById(id);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listAdvertisingInfo.do?limit=10&page=1");
		return m;
	}

	/*
	 * 编辑相应广告
	 */
	@RequestMapping("/editAdvertising")
	public ModelAndView editAdvertising(String bid, HttpServletRequest request) {
		NewsAdvertising newsAdvertising = newsAdvertisingService
				.findAdvertisingById(bid);
		ModelAndView m = new ModelAndView();

		// 返回版位list
		List<NewsAdvertisingSpace> advertisingList = newsAdvertisingService
				.selectAdvertisingSpace();
		m.getModel().put("advertingSpace", advertisingList);

		m.getModel().put("type", "edit");
		m.getModel().put("dto", newsAdvertising);
		m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_addoredit.jsp");
		return m;
	}

	/**
	 * 根据特定id查询相应的旅游播报
	 * 
	 */
	@RequestMapping("/findAdvertisingById")
	public ModelAndView findAdvertisingById(String bid,
			HttpServletRequest request) {
		NewsAdvertising newsAdvertising = newsAdvertisingService
				.findAdvertisingById(bid);
		ModelAndView m = new ModelAndView();
		m.getModel().put("type", "detail");
		m.getModel().put("dto", newsAdvertising);
		m.setViewName("forward:/WEB-INF/pages/advertisement/news_advertising_addoredit.jsp");
		return m;
	}

}
