/**
 * 
 */
package com.shili.lu.rms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.rms.dao.RmsMethodMapper;
import com.shili.lu.rms.dao.RmsRoleMethodMapper;
import com.shili.lu.rms.dto.RmsMethodDto;
import com.shili.lu.rms.model.RmsMethod;

/**
 * 资源service
 * 
 * @author zhangxujun
 * 
 * 
 */
@Service("rmsMethodService")
public class RmsMethodServiceImpl implements RmsMethodServiceI {

	/**
	 * 方法dao
	 */
	@Autowired
	private RmsMethodMapper rmsMethodMapper;
	@Autowired
	private RmsRoleMethodMapper rmsRoleMethodMapper;

	/**
	 * 查询所有可用的资源
	 * 
	 */
	@Override
	public List<RmsMethodDto> listAll() {
		RmsMethodDto queryParam = new RmsMethodDto();
		PageBounds pageBounds = new PageBounds();
		pageBounds.setLimit(Integer.MAX_VALUE);
		pageBounds.setContainsTotalCount(false);
		PageList<RmsMethodDto> allMethod = this.listByPage(queryParam,
				pageBounds);
		return allMethod;
	}

	/**
	 * 查询角色已分配的资源
	 * 
	 * @param roleId
	 *            角色id
	 * @return 列表
	 */
	@Override
	public List<RmsMethodDto> listByRoleId(Long roleId) {
		RmsMethodDto queryParam = new RmsMethodDto();
		queryParam.setRoleId(roleId);
		PageBounds pageBounds = new PageBounds();
		pageBounds.setLimit(Integer.MAX_VALUE);
		pageBounds.setContainsTotalCount(false);
		PageList<RmsMethodDto> allMethod = this.listByPage(queryParam,
				pageBounds);
		return allMethod;
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
	public PageList<RmsMethodDto> listByPage(RmsMethodDto queryParam,
			PageBounds pageBounds) {
		return rmsMethodMapper.listByPage(queryParam, pageBounds);
	}

	/**
	 * 根据id删除方法
	 * 
	 * @param id
	 *            主键
	 */
	@Override
	public void deleteById(Long methodId) {
		rmsMethodMapper.deleteByPrimaryKey(methodId);
	}

	/**
	 * 根据id查询方法
	 * 
	 * @param id
	 *            主键
	 */
	@Override
	public RmsMethod getById(Long methodId) {
		return rmsMethodMapper.selectByPrimaryKey(methodId);
	}

	/**
	 * 保存或更新方法资源
	 * 
	 * @param role
	 *            方法资源
	 */
	@Override
	public void saveOrUpdate(RmsMethodDto method) {
		if (method.getId() == null || method.getId() <= 0) {
			method.setCreateTime(new Date());
			method.setUpdateTime(method.getCreateTime());
			method.setDeleteFlag(0);
			rmsMethodMapper.insert(method);
		} else {
			RmsMethod temp = rmsMethodMapper.selectByPrimaryKey(method.getId());
			if (temp != null) {
				method.setCreateTime(temp.getCreateTime());
				method.setDeleteFlag(temp.getDeleteFlag());
				method.setUpdateTime(new Date());
				rmsMethodMapper.updateByPrimaryKey(method);
			}
		}
	}

	/**
	 * 资源名称是否可使用
	 * 
	 * @param method
	 *            参数
	 * @return false不可用
	 */
	@Override
	public boolean isMethodNameAvalible(RmsMethod method) {
		if (method.getId() != null && method.getId() > 0) {
			RmsMethod temp = rmsMethodMapper.selectByPrimaryKey(method.getId());
			if (temp != null) {
				if (temp.getClassName().equals(method.getClassName())
						&& temp.getMethodName().equals(method.getMethodName())) {
					return true;
				}
			}
		}
		RmsMethodDto queryParam = new RmsMethodDto();
		queryParam.setFullMatch(true);
		queryParam.setClassName(method.getClassName());
		queryParam.setMethodName(method.getMethodName());
		PageBounds pageBounds = new PageBounds();
		pageBounds.setLimit(1);
		pageBounds.setContainsTotalCount(false);
		PageList<RmsMethodDto> list = rmsMethodMapper.listByPage(queryParam,
				pageBounds);
		return CollectionUtils.isEmpty(list);
	}

	@Override
	public boolean methodIsUse(Long id) {
		// TODO Auto-generated method stub
		List methodList = rmsRoleMethodMapper.selectByMethodId(id);
		if (methodList != null && methodList.size() > 0) {
			return false;
		} else {
			return true;
		}
	}
}
