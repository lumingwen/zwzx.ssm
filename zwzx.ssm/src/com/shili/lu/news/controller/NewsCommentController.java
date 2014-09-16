package com.shili.lu.news.controller;

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
import com.shili.lu.common.util.PageUtils;
import com.shili.lu.news.dto.NewsCommentDto;
import com.shili.lu.news.service.NewsCommentServiceI;

/**
 * 评论controller
 * 
 * @author
 */
@Controller
@RequestMapping("/newsComment")
public class NewsCommentController {
	/**
	 * 评论service
	 */
	@Autowired
	private NewsCommentServiceI newsCommentService;

	/**
	 * 分页查询评论内容
	 * 
	 * @param req
	 * @param queryParam
	 * @param pageBounds
	 * @return
	 */
	@RequestMapping("/listNewsCommentInfo")
	@NoSecurity
	public ModelAndView list(HttpServletRequest req, NewsCommentDto queryParam,
			PageBounds pageBounds) {
		if (queryParam == null) {
			queryParam = new NewsCommentDto();
		}

		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("create_time", Direction.DESC, ""));
		PageList<NewsCommentDto> list = newsCommentService
				.listNewsCommentByPage(queryParam, pageBounds);

		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);
		m.getModel().put("list", list);
		m.getModel()
				.put("pagestr", PageUtils.buildPageStr(list.getPaginator()));
		m.setViewName("forward:/WEB-INF/pages/pub/news_comment_list.jsp");
		return m;

	}

	/**
	 * 分页评论编辑
	 * 
	 * @param dto
	 * @return
	 */
	@RequestMapping("/editComment")
	public ModelAndView editComment(NewsCommentDto dto) {
		ModelAndView m = new ModelAndView();
		newsCommentService.editComment(dto);
		m.setViewName("redirect:listNewsCommentInfo.do?limit=10");
		return m;
	}

}
