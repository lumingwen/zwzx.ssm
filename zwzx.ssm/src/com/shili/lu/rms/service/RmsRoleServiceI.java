/**
 * 
 */
package com.shili.lu.rms.service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.rms.dto.RmsRoleDto;
import com.shili.lu.rms.model.RmsRole;

/**
 * 角色service
 * 
 * @author zhangxujun
 * 
 * 
 */
public interface RmsRoleServiceI {

	/**
	 * 分配菜单
	 * 
	 * @param role
	 *            角色dto
	 */
	public void allocationMenu(RmsRoleDto role);

	/**
	 * 分配资源
	 * 
	 * @param role
	 *            角色dto
	 */
	public void allocationMethod(RmsRoleDto role);

	/**
	 * 分页查询角色
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	public PageList<RmsRoleDto> listByPage(RmsRoleDto queryParam,
			PageBounds pageBounds);

	/**
	 * 根据id删除角色
	 * 
	 * @param id
	 *            主键
	 */
	public void deleteById(Long id);

	/**
	 * 根据id查询角色
	 * 
	 * @param id
	 *            主键
	 */
	public RmsRoleDto getById(Long id);

	/**
	 * 保存或更新角色
	 * 
	 * @param role
	 *            角色
	 */
	public void saveOrUpdate(RmsRole role);

	/**
	 * 角色名称是否可用
	 * 
	 * @param role
	 *            参数
	 * @return true可用,false不可用
	 */
	public boolean isRoleNameAvalible(RmsRole role);

}
