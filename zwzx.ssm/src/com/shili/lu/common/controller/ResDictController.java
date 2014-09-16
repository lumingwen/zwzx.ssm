/**
 * 
 */
package com.shili.lu.common.controller;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
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
import com.shili.lu.common.dto.ResDictDto;
import com.shili.lu.common.dto.ResponseDto;
import com.shili.lu.common.model.ResDict;
import com.shili.lu.common.service.ResDictServiceI;
import com.shili.lu.common.util.Constants;
import com.shili.lu.common.util.PageUtils;
import com.shili.lu.rms.controller.BaseController;

/**
 * 字典Controller
 * 
 * @author zhangxujun
 * 
 * 
 */
@Controller
@RequestMapping("/dict")
public class ResDictController extends BaseController {

	private final Logger log = Logger.getLogger(getClass());

	/**
	 * service
	 */
	@Autowired
	private ResDictServiceI resDictService;

	private Map<String, String> getDictMap() {
		Map<String, String> dictMap = new LinkedHashMap<String, String>();
		dictMap.put(Constants.NEW_ROOT, "根目录");
		dictMap.put(Constants.CONTENS, "类型");
		// dictMap.put(Constants.DICT_JWXL, "境外线路");
		// dictMap.put(Constants.DICT_GLXZQH, "国内行政区划");
		// dictMap.put(Constants.DICT_GJXZQH, "国际行政区划");
		// dictMap.put(Constants.DICT_JPXZQU_GL, "机票出发/到达地区(国内)");
		// dictMap.put(Constants.DICT_JPXZQU_GJ, "机票出发/到达地区(国际)");
		// dictMap.put(Constants.DICT_JDXJ, "酒店星级");
		// dictMap.put(Constants.DICT_JDJG, "酒店价格");
		// dictMap.put(Constants.DICT_JPCW, "机票舱位");
		return dictMap;
	}

	/**
	 * 字典目录
	 * 
	 * @return
	 */
	@RequestMapping("/list")
	@NoSecurity
	public ModelAndView list() {
		ModelAndView m = new ModelAndView();
		m.getModel().put("dictMap", getDictMap());
		m.setViewName("forward:/WEB-INF/pages/main/dict/res_dict_list.jsp");
		return m;
	}

	/**
	 * 字典内容列表
	 * 
	 * @return
	 */
	@RequestMapping("/contentList")
	public ModelAndView contentList(ResDictDto queryParam, PageBounds pageBounds) {

		if (queryParam == null) {
			queryParam = new ResDictDto();
		}

		pageBounds.setContainsTotalCount(true);
		pageBounds.getOrders()
				.add(new Order("update_time", Direction.DESC, ""));
		PageList<ResDictDto> list = resDictService.listDictContentByPage(
				queryParam, pageBounds);

		ModelAndView m = new ModelAndView();
		m.getModel().put("queryParam", queryParam);
		m.getModel().put("list", list);
		m.getModel()
				.put("pagestr", PageUtils.buildPageStr(list.getPaginator()));
		m.setViewName("forward:/WEB-INF/pages/main/dict/res_dict_content_list.jsp");
		return m;
	}

	/**
	 * 字典编辑页面
	 * 
	 * @return
	 */
	@RequestMapping("/editDict")
	@NoSecurity
	public ModelAndView editDict(String type) {
		ModelAndView m = new ModelAndView();
		Map<String, String> map = getDictMap();
		List<ResDict> list = resDictService.listAllDictByType(type);
		m.getModel().put("list", list);
		m.getModel().put("type", type);
		m.getModel().put("name", map.get(type));
		m.setViewName("forward:/WEB-INF/pages/main/dict/res_dict_edit.jsp");
		return m;
	}

	/**
	 * 新增字典
	 * 
	 * @param type
	 * @param pid
	 * @param name
	 * @return
	 */
	@RequestMapping(value = "/addDict", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addDict(String type, Long pid, String name) {

		// 保存字典
		ResDict dict = new ResDict();
		dict.setCreateTime(new Date());
		dict.setUpdateTime(dict.getCreateTime());
		dict.setDeleteFlag(Constants.DEL_FLAG_NO);
		dict.setType(type);
		dict.setPid(pid);
		dict.setCname(name);
		resDictService.insertDict(dict);

		// 响应
		ResponseDto respDto = new ResponseDto();
		respDto.setSuccess(true);
		respDto.setMessage(dict.getId() + "");
		JSONObject json = JSONObject.fromObject(respDto);
		String str = json.toString();
		return str;
	}

	/**
	 * 删除字典
	 * 
	 * @param type
	 * @param pid
	 * @param name
	 * @return
	 */
	@RequestMapping(value = "/removeDict", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeDict(Long id) {

		// 保存字典
		resDictService.removeDict(id);

		// 响应
		ResponseDto respDto = new ResponseDto();
		respDto.setSuccess(true);
		respDto.setMessage("");
		JSONObject json = JSONObject.fromObject(respDto);
		String str = json.toString();
		return str;
	}

	/**
	 * 更新字典
	 * 
	 * @param type
	 * @param pid
	 * @param name
	 * @return
	 */
	@RequestMapping(value = "/updateDict", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateDict(ResDict dict) {

		// 保存字典
		resDictService.updateDict(dict);

		// 响应
		ResponseDto respDto = new ResponseDto();
		respDto.setSuccess(true);
		respDto.setMessage("");
		JSONObject json = JSONObject.fromObject(respDto);
		String str = json.toString();
		return str;
	}

	/**
	 * 到字典内容编辑页面
	 * 
	 * @param dto
	 * @return
	 */
	@RequestMapping("/toEditDictContent")
	public ModelAndView toEditDictContent(ResDictDto dto) {
		ModelAndView m = new ModelAndView();
		m.setViewName("forward:/WEB-INF/pages/main/dict/res_dict_content_edit.jsp");
		if (dto != null && dto.getId() != null) {
			ResDict db = resDictService.getDictById(dto.getId());
			try {
				PropertyUtils.copyProperties(dto, db);
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		}
		m.getModel().put("dto", dto);
		if (dto != null) {
			if (dto.getPid() == null || Constants.TOP_PID.equals(dto.getPid())) {
				m.getModel().put("pidName", "---");
			} else {
				ResDict parent = resDictService.getDictById(dto.getPid());
				m.getModel().put("pidName",
						parent == null ? "" : parent.getCname());
			}
			m.getModel().put("dictTypeName", getDictMap().get(dto.getType()));
		}

		return m;
	}

	/**
	 * 字典内容编辑
	 * 
	 * @param dto
	 * @return
	 */
	@RequestMapping("/editDictContent")
	public ModelAndView editDictContent(ResDictDto dto) {
		ModelAndView m = new ModelAndView();
		resDictService.editDictContent(dto);
		m.setViewName("redirect:contentList.do?limit=10&type=" + dto.getType());
		return m;
	}

	/*
	 * 新闻类型选择
	 */
	@RequestMapping(value = "/queryNewsType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String queryNewsType(Long pId, HttpServletRequest request,
			HttpServletResponse respons) {
		ResDict r = new ResDict();
		r.setType(Constants.NEWS_TYPE);
		r.setPid(pId);
		List<ResDict> list = resDictService.queryNewsType(r);
		JSONArray json = JSONArray.fromObject(list);
		String s = json.toString();
		return s;
	}
}
