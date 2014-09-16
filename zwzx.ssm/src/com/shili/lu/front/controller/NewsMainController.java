/**
 * 
 */
package com.shili.lu.front.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.shili.lu.advertising.dto.NewsAdvertisingDto;
import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.model.ResDict;
import com.shili.lu.common.service.ResDictServiceI;
import com.shili.lu.common.util.PageUtils;
import com.shili.lu.friendlink.model.NewsFriendlink;
import com.shili.lu.friendlink.service.FrontNewsFriendlinkServiceI;
import com.shili.lu.news.dto.NewsCommentDto;
import com.shili.lu.news.dto.NewsContentDto;
import com.shili.lu.news.dto.PubBroadcastContentDto;
import com.shili.lu.news.model.NewsContentCount;
import com.shili.lu.news.service.FrontNewsContetCountServiceI;
import com.shili.lu.news.service.FrontNewsContetServiceI;
import com.shili.lu.news.service.PubBroadcastServiceI;
import com.shili.lu.rms.controller.BaseController;

/**
 * 链接Controller
 * 
 * @author lumingwen
 * 
 * 
 */
@Controller
@RequestMapping("/front")
public class NewsMainController extends BaseController {

	/**
	 * 链接类型service
	 */
	@Autowired
	private FrontNewsFriendlinkServiceI frontNewsFriendlinkService;

	@Autowired
	private FrontNewsContetServiceI frontNewsContetService;

	@Autowired
	private ResDictServiceI resDictService;

	/**
	 * 访问量
	 */
	@Autowired
	private FrontNewsContetCountServiceI frontNewsContetCountService;

	/**
	 * 广告service
	 */
	@Autowired
	private PubBroadcastServiceI pubBroadcastService;

	/**
	 * 到主页
	 * 
	 */
	@SuppressWarnings("null")
	@RequestMapping("/index")
	@NoSecurity
	public ModelAndView main() {
		ModelAndView m = new ModelAndView();

		// 最热新闻
		List<PubBroadcastContentDto> latestNewsContent = frontNewsContetService
				.findNewsContent();
		m.getModel().put("latestNewsContent", latestNewsContent);
		// 广告list
		List<NewsAdvertisingDto> newsAdvertisingList = frontNewsContetService
				.listNewsAdvertising();
		m.getModel().put("newsAdvertisingList", newsAdvertisingList);
		// 右边热点微博list
		List<NewsFriendlink> friendlinklist = frontNewsFriendlinkService
				.findFriendlinkByCtg("热点微博");
		// 新闻类型
		// 顶部菜单的生成
		List<ResDict> menulist = resDictService.getAllMenu("NEWROOT", 1);
		m.getModel().put("menulist", menulist);
		// List<ResDict> list = resDictService.listAllDictByType("NEWROOT", 0L);
		List<ResDict> resdict = resDictService.getDictByTypeName("NEWROOT",
				"新闻");
		List<ResDict> list = resDictService.listAllDictByType("NEWROOT",
				resdict.get(0).getId());
		List<NewsContentDto> newscontentList = new ArrayList<NewsContentDto>();
		NewsContentDto newsContent = null;
		// 新闻内容(查询相应类型下面的新闻内容)
		for (int i = 0; i < list.size(); i++) {
			Long id = list.get(i).getId();
			String newsTypeName = list.get(i).getCname();
			List<PubBroadcastContentDto> contentlist = frontNewsContetService
					.selectByNewsTypeId(id);
			newsContent = new NewsContentDto();
			newsContent.setNewsTypeName(newsTypeName);
			newsContent.setContentTypeId(list.get(i).getId());
			newsContent.setContentList(contentlist);
			newscontentList.add(newsContent);

		}

		// 返回新闻内容
		m.getModel().put("newscontentList", newscontentList);
		m.getModel().put("friendlinklist", friendlinklist);
		m.setViewName("forward:/front/index.jsp");
		return m;
	}

	/******
	 * 列表
	 * 
	 */
	@RequestMapping("/findBroadcastListByContentTypeId")
	@NoSecurity
	public ModelAndView findBroadcastListByContentTypeId(String contentTypeId,
			HttpServletRequest request) {
		ModelAndView m = new ModelAndView();
		// 广告list
		List<NewsAdvertisingDto> newsAdvertisingList = frontNewsContetService
				.listNewsAdvertising();
		m.getModel().put("newsAdvertisingList", newsAdvertisingList);

		// 新闻类型（旧)
		// List<ResDict> menulist = resDictService.getDetailAllMenu("NEWROOT",
		// 1,
		// Long.parseLong(contentTypeId));

		// 顶部菜单的生成
		List<ResDict> menulist = resDictService.getAllMenu("NEWROOT", 1);

		// 最新新闻
		List<PubBroadcastContentDto> contentlist = frontNewsContetService
				.findNewsContent();
		m.getModel().put("newscontentNewstNewsList", contentlist);

		// 返回最多评论的新闻
		// String newsTypeName = list.get(i).getCname();
		List<PubBroadcastContentDto> contentlist1 = frontNewsContetService
				.selectListMostComment();
		m.getModel().put("newscontentMostCommentList", contentlist1);

		// 返回最多点击
		// String newsTypeName = list.get(i).getCname();
		List<PubBroadcastContentDto> contentlist2 = frontNewsContetService
				.selectListMostViews();
		m.getModel().put("newscontentMostViewList", contentlist2);

		// String newsTypeName = list.get(i).getCname();
		List<PubBroadcastContentDto> contentlist3 = frontNewsContetService
				.selectListByNewsTypeId(Long.parseLong(contentTypeId));

		// 根据newTypeId来差列表
		// 返回频道推荐新闻内容
		m.getModel().put("newscontentList", contentlist3);
		m.getModel().put("contentTypeId", contentTypeId);
		m.getModel().put("menulist", menulist);
		m.setViewName("forward:/front/detail/news_list.jsp");
		return m;
	}

	/******
	 * 根据特定新闻类型查看 列表
	 * 
	 */
	@RequestMapping("/findBroadcastListByNewsTypeId")
	@NoSecurity
	public ModelAndView findBroadcastListByNewsTypeId(String contentTypeId,
			String newsTypeId, HttpServletRequest request) {
		ModelAndView m = new ModelAndView();
		// 广告list
		List<NewsAdvertisingDto> newsAdvertisingList = frontNewsContetService
				.listNewsAdvertising();
		m.getModel().put("newsAdvertisingList", newsAdvertisingList);

		// 新闻类型
		// List<ResDict> menulist = resDictService.getDetailAllMenu("NEWROOT",
		// 1,
		// Long.parseLong(newsTypeId));

		// 顶部菜单的生成
		List<ResDict> menulist = resDictService.getAllMenu("NEWROOT", 1);

		// 最新新闻
		List<PubBroadcastContentDto> contentlist = frontNewsContetService
				.findNewsContent();
		m.getModel().put("newscontentNewstNewsList", contentlist);

		// 返回最多评论的新闻
		// String newsTypeName = list.get(i).getCname();
		List<PubBroadcastContentDto> contentlist1 = frontNewsContetService
				.selectListMostComment();
		m.getModel().put("newscontentMostCommentList", contentlist1);

		// 返回最多点击
		// String newsTypeName = list.get(i).getCname();
		List<PubBroadcastContentDto> contentlist2 = frontNewsContetService
				.selectListMostViews();
		m.getModel().put("newscontentMostViewList", contentlist2);

		// String newsTypeName = list.get(i).getCname();
		List<PubBroadcastContentDto> contentlist3 = frontNewsContetService
				.selectListByNewsTypeId(Long.parseLong(contentTypeId));

		// 根据newTypeId来差列表
		// 返回频道推荐新闻内容
		m.getModel().put("newscontentList", contentlist3);
		m.getModel().put("contentTypeId", contentTypeId);
		m.getModel().put("menulist", menulist);
		m.setViewName("forward:/front/detail/news_list.jsp");
		return m;
	}

	/**
	 * 分页查询评论内容
	 * 
	 * @param req
	 * @param queryParam
	 * @param pageBounds
	 * @return
	 */
	public ModelAndView list(HttpServletRequest req, NewsCommentDto queryParam,
			PageBounds pageBounds, ModelAndView modeView) {
		if (queryParam == null) {
			queryParam = new NewsCommentDto();
		}

		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("create_time", Direction.DESC, ""));
		PageList<NewsCommentDto> list = frontNewsContetService
				.listNewsCommentByPage(queryParam, pageBounds);

		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);
		m.getModel().put("list", list);
		m.getModel()
				.put("pagestr", PageUtils.buildPageStr(list.getPaginator()));
		return m;
	}

	/**
	 * 访问量保存
	 * 
	 */
	@SuppressWarnings("null")
	@RequestMapping("/editNewsContentCount")
	@NoSecurity
	public ModelAndView editNewsContentCount(String newsId,
			HttpServletRequest req, HttpSession session) {
		PubBroadcastContentDto pubBroadcastContent = pubBroadcastService
				.findById(newsId);

		// 更新访问量

		NewsContentCount newsContentCount = frontNewsContetCountService
				.findById(Integer.parseInt(newsId));
		if (session.isNew() || newsContentCount == null) {
			if (newsContentCount == null) {
				newsContentCount = new NewsContentCount();
				newsContentCount.setContentId(Integer.parseInt(newsId));
				newsContentCount.setViews(1);
				newsContentCount.setViewsDay(1);
				newsContentCount.setViewsWeek(1);
				newsContentCount.setViewsMonth(1);
				newsContentCount.setViewsYear(1);
				newsContentCount.setCreateTime(new Date());
				newsContentCount.setUpdateTime(new Date());
				frontNewsContetCountService.editNewsContentCount(
						newsContentCount, "insert");
			} else {
				newsContentCount.setViews(newsContentCount.getViews() + 1);
				// 比较日期增加计数
				if (new java.text.SimpleDateFormat("yyyy-MM-dd").format(
						newsContentCount.getUpdateTime()).equals(
						new SimpleDateFormat("yyyy-MM-dd").format(new Date())))
					// this.obj.setDayCount(this.obj.getDayCount() + 1);
					newsContentCount
							.setViewsDay(newsContentCount.getViewsDay() + 1);
				else
					newsContentCount.setViewsDay(1);

				if (new SimpleDateFormat("yyyy-MM").format(
						newsContentCount.getUpdateTime()).equals(
						new SimpleDateFormat("yyyy-MM").format(new Date())))
					newsContentCount.setViewsMonth(newsContentCount
							.getViewsMonth() + 1);
				else
					newsContentCount.setViewsMonth(1);

				Calendar ca = Calendar.getInstance();
				ca.setTime(new Date());
				ca.setFirstDayOfWeek(Calendar.MONDAY);

				if (ca.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY
						&& !new SimpleDateFormat("yyyy-MM-dd").format(
								newsContentCount.getUpdateTime()).equals(
								new SimpleDateFormat("yyyy-MM-dd")
										.format(new Date())))
					newsContentCount.setViewsWeek(1);
				else
					newsContentCount.setViewsWeek(newsContentCount
							.getViewsWeek() + 1);

				if (new SimpleDateFormat("yyyy").format(
						newsContentCount.getUpdateTime()).equals(
						new SimpleDateFormat("yyyy").format(new Date())))
					newsContentCount.setViewsYear(newsContentCount
							.getViewsYear() + 1);
				else
					newsContentCount.setViewsYear(1);
				newsContentCount.setUpdateTime(new Date());
				frontNewsContetCountService.editNewsContentCount(
						newsContentCount, "update");
			}
		}
		ModelAndView m = new ModelAndView();

		// 新闻类型(旧)
		// List<ResDict> menulist = resDictService.getDetailAllMenu("NEWROOT",
		// 1,
		// pubBroadcastContent.getContentTypeId());
		// 顶部菜单的生成
		List<ResDict> menulist = resDictService.getAllMenu("NEWROOT", 1);
		// 频道推荐
		List<NewsContentDto> newscontentList = new ArrayList<NewsContentDto>();
		NewsContentDto newsContent = null;
		// String newsTypeName = list.get(i).getCname();
		List<PubBroadcastContentDto> contentlist = frontNewsContetService
				.selectByNewsTypeId(pubBroadcastContent.getContentTypeId());
		newsContent = new NewsContentDto();
		newsContent.setContentList(contentlist);
		newscontentList.add(newsContent);

		// 新闻评论
		PageBounds pageBounds = new PageBounds();
		NewsCommentDto queryParam = new NewsCommentDto();
		queryParam.setContentId(Long.parseLong(newsId));
		pageBounds.setPage(1);
		// pageBounds.setLimit(10);
		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("create_time", Direction.DESC, ""));
		PageList<NewsCommentDto> list = frontNewsContetService
				.listNewsCommentByPage(queryParam, pageBounds);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		for (int i = 0; i < list.size(); i++) {
			String str = format.format(list.get(i).getCreateTime());
			list.get(i).setStrCreateTime(str);
		}
		m.getModel().put("list", list);
		m.getModel()
				.put("pagestr", PageUtils.buildPageStr(list.getPaginator()));

		m.getModel().put("pubBroadcastContent", pubBroadcastContent);

		// 返回最多评论的新闻
		// String newsTypeName = list.get(i).getCname();
		List<PubBroadcastContentDto> contentlist1 = frontNewsContetService
				.selectListMostComment();
		m.getModel().put("newscontentMostCommentList", contentlist1);

		// 返回最多点击
		// String newsTypeName = list.get(i).getCname();
		List<PubBroadcastContentDto> contentlist2 = frontNewsContetService
				.selectListMostViews();
		m.getModel().put("newscontentMostViewList", contentlist2);

		// 广告list
		List<NewsAdvertisingDto> newsAdvertisingList = frontNewsContetService
				.listNewsAdvertising();
		m.getModel().put("newsAdvertisingList", newsAdvertisingList);

		// 返回频道推荐新闻内容
		m.getModel().put("newscontentList", newscontentList);
		m.getModel().put("menulist", menulist);

		m.setViewName("forward:/front/detail/news_detail.jsp");
		return m;
	}

	/**
	 * 查看更多
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getMoreNewsListAjax", produces = "application/json;charset=UTF-8")
	@NoSecurity
	@ResponseBody
	public String getMoreNewsListAjax(HttpServletRequest req,
			PubBroadcastContentDto info) {

		// 参数
		PubBroadcastContentDto queryParam = new PubBroadcastContentDto();
		queryParam.setContentTypeId(info.getContentTypeId());
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
		PageList<PubBroadcastContentDto> list = frontNewsContetService
				.listNewsListByPage(queryParam, pageBounds);
		// 返回
		JSONArray json = JSONArray.fromObject(list);
		String str = json.toString();
		return str;

	}
}
