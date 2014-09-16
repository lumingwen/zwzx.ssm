package com.shili.lu.news.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.Order.Direction;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.model.ResDict;
import com.shili.lu.common.service.ResDictServiceI;
import com.shili.lu.common.util.Constants;
import com.shili.lu.common.util.PageUtils;
import com.shili.lu.news.dto.PubBroadcastContentDto;
import com.shili.lu.news.model.PubBroadcastContent;
import com.shili.lu.news.service.PubBroadcastServiceI;
import com.shili.lu.rms.dto.SessionUserDto;

/**
 * 广告controller
 * 
 * @author
 */
@Controller
@RequestMapping("/pubBroadcast")
public class PubBroadcastController {
	/**
	 * 广告service
	 */
	@Autowired
	private PubBroadcastServiceI pubBroadcastService;

	/**
	 * 
	 */
	@Autowired
	private ResDictServiceI resDictService;

	/**
	 * 分页查询广告内容
	 * 
	 * @param req
	 * @param queryParam
	 * @param pageBounds
	 * @return
	 */
	@RequestMapping("/listBroadcastInfo")
	@NoSecurity
	public ModelAndView list(HttpServletRequest req,
			PubBroadcastContentDto queryParam, PageBounds pageBounds) {

		if (queryParam == null) {
			queryParam = new PubBroadcastContentDto();
		}

		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("create_time", Direction.DESC, ""));
		PageList<PubBroadcastContentDto> resBroadcastList = pubBroadcastService
				.listPubBroadcastContentByPage(queryParam, pageBounds);

		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);

		List<ResDict> resdict = resDictService.getDictByTypeName("NEWROOT",
				"新闻");
		List<ResDict> contentTypeList = resDictService.listAllDictByType(
				"NEWROOT", resdict.get(0).getId());
		m.getModel().put("contenttypelist", contentTypeList);
		if (queryParam.getNewsTypeId() != null) {

			ResDict r = resDictService.getDictById(queryParam.getNewsTypeId());
			List<ResDict> newsTypeList = resDictService.listAllDictByType(
					"NEWROOT", r.getPid());
			m.getModel().put("newstypelist", newsTypeList);
		} else {
			if (queryParam.getContentTypeId() != null) {
				ResDict r = resDictService.getDictById(queryParam
						.getContentTypeId());
				List<ResDict> newsTypeList = resDictService.listAllDictByType(
						"NEWROOT", r.getId());
				m.getModel().put("newstypelist", newsTypeList);
			}

		}

		m.getModel().put("list", resBroadcastList);
		m.getModel().put("pagestr",
				PageUtils.buildPageStr(resBroadcastList.getPaginator()));
		String source = req.getParameter("source");
		m.getModel().put("message", source);
		m.setViewName("forward:/WEB-INF/pages/pub/pub_broadcast_list.jsp");
		return m;

	}

	/**
	 * 删除
	 * 
	 */
	@RequestMapping("/deleteBroadcastInfo")
	@NoSecurity
	public ModelAndView delete(Long id) {
		pubBroadcastService.deleteById(id);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listBroadcastInfo.do?limit=10&page=1");
		return m;
	}

	/**
	 * 添加
	 * 
	 */
	@RequestMapping("/addBroadcast")
	@NoSecurity
	public ModelAndView add() {
		ModelAndView m = new ModelAndView();
		// List<ResDict> list = resDictService.listAllDictByType("NEWROOT", 0L);
		List<ResDict> resdict = resDictService.getDictByTypeName("NEWROOT",
				"新闻");
		List<ResDict> list = resDictService.listAllDictByType("NEWROOT",
				resdict.get(0).getId());
		m.getModel().put("type", "insert");
		m.getModel().put("typelist", list);
		m.setViewName("forward:/WEB-INF/pages/pub/pub_broadcast_addoredit.jsp");
		return m;
	}

	/**
	 * 保存
	 * 
	 */
	@RequestMapping("/saveBroadcast")
	@NoSecurity
	public ModelAndView save(PubBroadcastContentDto dto, HttpServletRequest req) {
		dto.setUpdateTime(new Date());
		SessionUserDto sessionUser = (SessionUserDto) req.getSession()
				.getAttribute(Constants.STORE_USER_IN_SESSION);
		dto.setUserId(sessionUser.getId());
		dto.setDeleteFlag(Constants.DEL_FLAG_NO);
		pubBroadcastService.save(dto);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listBroadcastInfo.do?limit=10&page=1");
		return m;
	}

	/**
	 * 根据特定id查询相应的旅游播报
	 * 
	 */
	@RequestMapping("/editBroadcast")
	public ModelAndView edit(String bid, HttpServletRequest request) {
		PubBroadcastContent pubBroadcastContent = pubBroadcastService
				.findById(bid);
		ModelAndView m = new ModelAndView();
		List<ResDict> resdict = resDictService.getDictByTypeName("NEWROOT",
				"新闻");
		List<ResDict> contentTypeList = resDictService.listAllDictByType(
				"NEWROOT", resdict.get(0).getId());
		if (pubBroadcastContent.getNewsTypeId() != null) {

			ResDict r = resDictService.getDictById(pubBroadcastContent
					.getNewsTypeId());
			List<ResDict> newsTypeList = resDictService.listAllDictByType(
					"NEWROOT", r.getPid());
			m.getModel().put("newstypelist", newsTypeList);
		}
		// 查询相应的类型
		m.getModel().put("type", "edit");
		m.getModel().put("contenttypelist", contentTypeList);
		m.getModel().put("dto", pubBroadcastContent);
		m.setViewName("forward:/WEB-INF/pages/pub/pub_broadcast_addoredit.jsp");
		return m;
	}

	/**
	 * 根据特定id查询相应的新闻内容
	 * 
	 */
	@RequestMapping("/findBroadcastById")
	public ModelAndView findBroadcastById(String bid, HttpServletRequest request) {
		PubBroadcastContent pubBroadcastContent = pubBroadcastService
				.findById(bid);
		ModelAndView m = new ModelAndView();
		m.getModel().put("pubBroadcastContent", pubBroadcastContent);
		m.setViewName("forward:/WEB-INF/pages/pub/pub_broadcast_detail.jsp");
		return m;
	}

	/**
	 * 根据特定id查询相应的旅游播报
	 * 
	 */
	@RequestMapping("/viewBroadcast")
	@NoSecurity
	public ModelAndView viewBroadcast(PubBroadcastContentDto dto,
			HttpServletRequest request) {
		ModelAndView m = new ModelAndView();
		m.getModel().put("pubBroadcastContent", dto);
		m.setViewName("forward:/WEB-INF/pages/pub/pub_broadcast_detail.jsp");
		return m;
	}
}
