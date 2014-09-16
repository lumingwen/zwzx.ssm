/**
 * 
 */
package com.shili.lu.rms.service;

import java.util.Date;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.util.Constants;
import com.shili.lu.rms.dao.RmsMethodMapper;
import com.shili.lu.rms.dao.RmsRoleMapper;
import com.shili.lu.rms.dao.RmsRoleMenuMapper;
import com.shili.lu.rms.dao.RmsRoleMethodMapper;
import com.shili.lu.rms.dto.RmsMenuDto;
import com.shili.lu.rms.dto.RmsMethodDto;
import com.shili.lu.rms.dto.RmsRoleDto;
import com.shili.lu.rms.model.RmsRole;
import com.shili.lu.rms.model.RmsRoleMenu;
import com.shili.lu.rms.model.RmsRoleMethod;

/**
 * 角色service
 * 
 * @author zhangxujun
 * 
 * 
 */
@Service("rmsRoleService")
public class RmsRoleServiceImpl implements RmsRoleServiceI {

	/**
	 * 角色dao
	 */
	@Autowired
	private RmsRoleMapper rmsRoleMapper;

	/**
	 * 方法dao
	 */
	@Autowired
	private RmsMethodMapper rmsMethodMapper;

	/**
	 * 角色关联菜单dao
	 */
	@Autowired
	private RmsRoleMenuMapper rmsRoleMenuMapper;

	/**
	 * 角色关联资源dao
	 */
	@Autowired
	private RmsRoleMethodMapper rmsRoleMethodMapper;

	/**
	 * 分配菜单
	 * 
	 * @param role
	 *            角色dto
	 */
	@Override
	public void allocationMenu(RmsRoleDto role) {
		rmsRoleMenuMapper.deleteByRoleId(role.getId());
		if (!CollectionUtils.isEmpty(role.getMenuList())) {
			for (RmsMenuDto menu : role.getMenuList()) {
				RmsRoleMenu r = new RmsRoleMenu();
				r.setRoleId(role.getId());
				r.setMenuId(menu.getId());
				r.setCreateTime(new Date());
				r.setUpdateTime(r.getCreateTime());
				r.setDeleteFlag(Constants.DEL_FLAG_NO);
				rmsRoleMenuMapper.insert(r);
			}
		}
	}

	/**
	 * 分配资源
	 * 
	 * @param role
	 *            角色dto
	 */
	@Override
	public void allocationMethod(RmsRoleDto role) {
		rmsRoleMethodMapper.deleteByRoleId(role.getId());
		if (!CollectionUtils.isEmpty(role.getMethodList())) {
			for (RmsMethodDto menu : role.getMethodList()) {
				RmsRoleMethod r = new RmsRoleMethod();
				r.setRoleId(role.getId());
				r.setMethodId(menu.getId());
				r.setCreateTime(new Date());
				r.setUpdateTime(r.getCreateTime());
				r.setDeleteFlag(Constants.DEL_FLAG_NO);
				rmsRoleMethodMapper.insert(r);
			}
		}
	}

	/**
	 * 分页查询角色
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	@Override
	public PageList<RmsRoleDto> listByPage(RmsRoleDto queryParam,
			PageBounds pageBounds) {
		return rmsRoleMapper.listRoleByPage(queryParam, pageBounds);
	}

	/**
	 * 根据id删除角色
	 * 
	 * @param id
	 *            主键
	 */
	@Override
	public void deleteById(Long id) {
		if (id != null) {
			rmsRoleMapper.deleteByPrimaryKey(id);
		}
	}

	/**
	 * 根据id查询角色
	 * 
	 * @param id
	 *            主键
	 */
	@Override
	public RmsRoleDto getById(Long id) {
		RmsRole role = rmsRoleMapper.selectByPrimaryKey(id);
		RmsRoleDto dto = new RmsRoleDto();
		if (role != null) {
			try {
				PropertyUtils.copyProperties(dto, role);
				return dto;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 保存或更新角色
	 * 
	 * @param role
	 *            角色
	 */
	@Override
	public void saveOrUpdate(RmsRole role) {
		if (role.getId() == null || role.getId() <= 0) {
			role.setCreateTime(new Date());
			role.setUpdateTime(role.getCreateTime());
			role.setDeleteFlag(0);
			rmsRoleMapper.insert(role);
		} else {
			RmsRole temp = rmsRoleMapper.selectByPrimaryKey(role.getId());
			if (temp != null) {
				role.setCreateTime(temp.getCreateTime());
				role.setDeleteFlag(temp.getDeleteFlag());
				role.setUpdateTime(new Date());
				rmsRoleMapper.updateByPrimaryKey(role);
			}
		}
	}

	/**
	 * 角色名称是否可用
	 * 
	 * @param role
	 *            参数
	 * @return true可用,false不可用
	 */
	@Override
	public boolean isRoleNameAvalible(RmsRole role) {
		if (role.getId() != null && role.getId() > 0) {
			RmsRole temp = rmsRoleMapper.selectByPrimaryKey(role.getId());
			if (temp != null && temp.getName().equals(role.getName().trim())) {
				return true;
			}
		}
		RmsRoleDto queryParam = new RmsRoleDto();
		queryParam.setFullMatch(true);
		queryParam.setName(role.getName().trim());
		PageBounds pageBounds = new PageBounds();
		pageBounds.setLimit(1);
		pageBounds.setContainsTotalCount(false);
		PageList<RmsRoleDto> list = rmsRoleMapper.listRoleByPage(queryParam,
				pageBounds);
		return CollectionUtils.isEmpty(list);
	}
}
