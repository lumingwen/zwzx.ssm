/**
 * 
 */
package com.shili.lu.rms.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.rms.dto.RmsMethodDto;
import com.shili.lu.rms.model.RmsMethod;

/**
 * 资源service
 * 
 * @author zhangxujun
 * 
 * 
 */
public interface RmsMethodServiceI {

	/**
	 * 查询所有可用的资源
	 * 
	 */
	public List<RmsMethodDto> listAll();

	/**
	 * 查询角色已分配的资源
	 * 
	 * @param roleId
	 *            角色id
	 * @return 列表
	 */
	public List<RmsMethodDto> listByRoleId(Long roleId);

	/**
	 * 分页查询资源
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	public PageList<RmsMethodDto> listByPage(RmsMethodDto queryParam,
			PageBounds pageBounds);

	/**
	 * 根据id删除方法
	 * 
	 * @param id
	 *            主键
	 */
	public void deleteById(Long id);

	/**
	 * 根据id查询方法
	 * 
	 * @param id
	 *            主键
	 */
	public RmsMethod getById(Long id);

	/**
	 * 保存或更新方法资源
	 * 
	 * @param role
	 *            方法资源
	 */
	public void saveOrUpdate(RmsMethodDto method);

	/**
	 * 资源名称是否可使用
	 * 
	 * @param method
	 *            参数
	 * @return false不可用
	 */
	public boolean isMethodNameAvalible(RmsMethod method);

	/**
	 * 资源是否被使用
	 * 
	 * @param id
	 * @return
	 */
	public boolean methodIsUse(Long id);
}
