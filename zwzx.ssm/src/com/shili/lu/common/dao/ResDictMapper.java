package com.shili.lu.common.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.dto.ResDictDto;
import com.shili.lu.common.model.ResDict;

/**
 * 字典dao
 * 
 * @author zhangxujun
 * 
 * 
 */
public interface ResDictMapper {

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Long id);

	/**
	 * 插入
	 * 
	 * @param record
	 * @return
	 */
	int insert(ResDict record);

	/**
	 * 查询
	 * 
	 * @param id
	 * @return
	 */
	ResDict selectByPrimaryKey(Long id);

	/**
	 * 更新
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKey(ResDict record);

	/**
	 * 查询字典
	 * 
	 * 
	 * @return 字典
	 */
	List<ResDict> listAllDict(ResDict param);

	/**
	 * 查询字典
	 * 
	 * 
	 * @return 字典
	 */
	List<ResDict> listAllDetailDict(ResDict param);

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
	 * 根据id查询所有子节点(包括自己)
	 * 
	 * @param id
	 * @return
	 */
	public String getAllChildIds(Long id);

	/**
	 * 级联更新状态(包括子节点)
	 * 
	 * @param param
	 *            必填参数:status、param
	 * @return
	 */
	public int cascadeUpdateStauts(ResDictDto param);

	/**
	 * 级联删除(包括子节点)
	 * 
	 * @param param
	 *            必填参数:param
	 * @return
	 */
	public int cascadeDelete(ResDictDto param);

}