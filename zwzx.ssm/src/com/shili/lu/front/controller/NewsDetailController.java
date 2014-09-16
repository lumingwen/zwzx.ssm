/**
 * 
 */
package com.shili.lu.front.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.Order.Direction;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.util.IpSeek;
import com.shili.lu.news.dto.NewsCommentDto;
import com.shili.lu.news.service.FrontNewsContetServiceI;
import com.shili.lu.news.service.NewsCommentServiceI;
import com.shili.lu.rms.controller.BaseController;

/**
 * 新闻评论Controller
 * 
 * @author lumingwen
 * 
 * 
 */
@Controller
@RequestMapping("/frontDetail")
public class NewsDetailController extends BaseController {
	@Autowired
	private NewsCommentServiceI newsCommentService;

	@Autowired
	private FrontNewsContetServiceI frontNewsContetService;

	/**
	 * 分页评论编辑
	 * 
	 * @param dto
	 * @return
	 */
	@RequestMapping("/saveComment")
	@NoSecurity
	public ModelAndView saveComment(HttpServletRequest request,
			NewsCommentDto dto) {
		ModelAndView m = new ModelAndView();
		// ip地址获取
		String ip = IpSeek.getIp(request);
		dto.setIp(ip);
		newsCommentService.editComment(dto);
		m.setViewName("redirect:../front/findNewsContentById.do?bid="
				+ dto.getContentId());
		return m;
	}

	/**
	 * 保存评论
	 * 
	 * @param req
	 * @param info
	 * @return
	 */
	@RequestMapping(value = "/saveCommentAjax", produces = "application/json;charset=UTF-8")
	@NoSecurity
	@ResponseBody
	public String saveCommentAjax(HttpServletRequest req, NewsCommentDto info) {
		// 评论内容
		int saveInfo;
		// ip地址获取
		String ip = IpSeek.getIp(req);
		info.setIp(ip);
		saveInfo = newsCommentService.editComment(info);
		// 返回
		List<NewsCommentDto> list = new ArrayList<NewsCommentDto>();
		if (saveInfo == 1) {
			list.add(info);
		}
		JSONArray json = JSONArray.fromObject(list);
		String str = json.toString();
		return str;
	}

	/**
	 * 查看更多
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getMoreAjax", produces = "application/json;charset=UTF-8")
	@NoSecurity
	@ResponseBody
	public String getMoreAjax(HttpServletRequest req, NewsCommentDto info) {

		// 参数
		NewsCommentDto queryParam = new NewsCommentDto();
		queryParam.setContentId(info.getContentId());
		PageBounds pageBounds = new PageBounds();
		if (info.getPage() == null) {
			pageBounds.setPage(1);
		} else {
			pageBounds.setPage(info.getPage());
		}
		pageBounds.setLimit(10);
		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("create_time", Direction.DESC, ""));

		// 查询
		PageList<NewsCommentDto> list = frontNewsContetService
				.listNewsCommentByPage(queryParam, pageBounds);
		// 返回
		JSONArray json = JSONArray.fromObject(list);
		String str = json.toString();
		return str;

	}

}
