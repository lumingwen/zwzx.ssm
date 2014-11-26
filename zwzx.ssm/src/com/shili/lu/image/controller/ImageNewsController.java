package com.shili.lu.image.controller;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.util.Constants;
import com.shili.lu.image.dto.ImageNewsDto;
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
		m.setViewName("redirect:listFriendlinkInfo.do?page=1&limit=10");
		return m;
	}
}
