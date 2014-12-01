package com.shili.lu.image.controller;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.github.miemiedev.mybatis.paginator.domain.Order.Direction;
import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.util.Constants;
import com.shili.lu.common.util.PageUtils;
import com.shili.lu.image.dto.ImageNewsDto;
import com.shili.lu.image.model.ImageMaterial;
import com.shili.lu.image.service.ImageMaterialServiceI;

/**
 * 图片新闻controller
 * 
 * @author
 */
@Controller
@RequestMapping("/imageNews")
public class ImageNewsController {
	
	@Autowired
	ImageMaterialServiceI imageMaterialService;
	
	
	
	/**
	 * 添加
	 * 
	 */
	@RequestMapping("/addImageNews")
	@NoSecurity
	public ModelAndView add() {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/pub/image_info_add.jsp");
		return m;
	}
	

	/**
	 * 保存
	 * 
	 */
	@RequestMapping("/saveImageNews")
	public ModelAndView saveImageNews(HttpServletRequest req,
			ImageNewsDto dto) {
		dto.setCreateTime(new Date());
		dto.setUpdateTime(new Date());
		dto.setDeleteFlag(Constants.DEL_FLAG_NO);
		imageMaterialService.saveImageNews(dto);
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:listImageInfo.do?page=1&limit=10");
		return m;
	}
	
	/**
	 * 分页查询图片
	 * 
	 * @param req
	 * @param queryParam
	 * @param pageBounds
	 * @return
	 */
	@RequestMapping("/listImageInfo")
	@NoSecurity
	public ModelAndView list(HttpServletRequest req,
			ImageNewsDto queryParam, PageBounds pageBounds) {

		if (queryParam == null) {
			queryParam = new ImageNewsDto();
		}

		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("update_time", Direction.DESC, ""));
		PageList<ImageMaterial> imageList = imageMaterialService
				.findPageImageMaterial(queryParam, pageBounds);

		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);
		m.getModel().put("imageList", imageList);
		m.getModel().put("pagestr",
				PageUtils.buildPageStr(imageList.getPaginator()));
		m.setViewName("forward:/WEB-INF/pages/pub/image_info_list.jsp");
		return m;

	}
}
