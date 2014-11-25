package com.shili.lu.image.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.shili.lu.common.annotation.NoSecurity;

/**
 * 图片新闻controller
 * 
 * @author
 */
@Controller
@RequestMapping("/imageNews")
public class ImageNewsController {
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
}
