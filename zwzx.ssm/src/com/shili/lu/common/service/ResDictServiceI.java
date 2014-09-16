/**
 * 
 */
package com.shili.lu.common.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.dto.ResDictDto;
import com.shili.lu.common.model.ResDict;

/**
 * 字典service
 * 
 * @author zhangxujun
 * 
 * 
 */
public interface ResDictServiceI {

	/**
	 * 根据类型查询所有字典
	 * 
	 * @param type
	 * @return
	 */
	public List<ResDict> listAllDictByType(String type);

	/**
	 * 根据类型查询所有字典
	 * 
	 * @param type
	 *            pid
	 * @return
	 */
	public List<ResDict> listAllDictByType(String type, Long pid);

	/**
	 * 分页查询字典目录
	 * 
	 * @param param
	 * @param pageBounds
	 * @return
	 */
	public PageList<ResDictDto> listDictContentByPage(ResDict param,
			PageBounds pageBounds);

	/**
	 * 插入字典
	 * 
	 * @param dict
	 */
	public void insertDict(ResDict dict);

	/**
	 * 级联删除字典
	 * 
	 * @param id
	 */
	public void removeDict(Long id);

	/**
	 * 修改字典(仅name)
	 * 
	 * @param dict
	 */
	public void updateDict(ResDict dict);

	/**
	 * 修改字典(所有字段)
	 * 
	 * @param dict
	 */
	public void updateFullDict(ResDict dict);

	/**
	 * 根据id查询字典
	 * 
	 * @param id
	 * @return
	 */
	public ResDict getDictById(Long id);

	/**
	 * 新增、修改、删除、启用、停用,字典内容
	 * 
	 * @param dto
	 */
	public Long editDictContent(ResDictDto dto);

	/**
	 * 查询类型 根据选择的不同内容类型
	 * 
	 * @param r
	 * @return
	 */
	public List<ResDict> queryNewsType(ResDict r);

	/**
	 * 根据cname查询字典
	 * 
	 * @param id
	 * @return
	 */
	public List<ResDict> getDictByTypeName(String type, String typeName);

	/**
	 * 查询主页menu
	 * 
	 * 
	 * @param id
	 * @return
	 */
	public List<ResDict> getAllMenu(String type, int hot_status);

	/**
	 * 查询详细页面顶部menu
	 * 
	 * 
	 * @param id
	 * @return
	 */
	public List<ResDict> getDetailAllMenu(String type, int hot_status,
			Long content_type_id);

}
