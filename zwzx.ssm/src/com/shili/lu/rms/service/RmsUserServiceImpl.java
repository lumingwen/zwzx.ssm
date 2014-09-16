package com.shili.lu.rms.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.util.Constants;
import com.shili.lu.common.util.MD5;
import com.shili.lu.rms.dao.RmsMethodMapper;
import com.shili.lu.rms.dao.RmsRoleMapper;
import com.shili.lu.rms.dao.RmsUserMapper;
import com.shili.lu.rms.dto.RmsUserDto;
import com.shili.lu.rms.dto.SessionUserDto;
import com.shili.lu.rms.model.RmsMethod;
import com.shili.lu.rms.model.RmsUser;

/**
 * 用户
 * 
 * @author zhangxujun
 * 
 * 
 */
@Service("rmsUserService")
public class RmsUserServiceImpl implements RmsUserServiceI {

	/**
	 * 用户dao
	 */
	@Autowired
	private RmsUserMapper rmsUserMapper;

	/**
	 * 角色dao
	 */
	@Autowired
	private RmsRoleMapper rmsRoleMapper;

	/**
	 * 资源dao
	 */
	@Autowired
	private RmsMethodMapper rmsMethodMapper;

	/**
	 * 分页查询用户
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	@Override
	public PageList<RmsUserDto> listByPage(RmsUserDto queryParam,
			PageBounds pageBounds) {
		return rmsUserMapper.listRmsUserByPage(queryParam, pageBounds);
	}

	/**
	 * 根据用户名查询用户
	 * 
	 * @param username
	 * @return
	 */
	@Override
	public RmsUser getByName(String username) {
		RmsUserDto queryParam = new RmsUserDto();

		return rmsUserMapper.selectByName(username);

	}

	/**
	 * 判断用户是否具有方法权限
	 * 
	 * @param user
	 * @param className
	 * @param methodName
	 * @return
	 */
	@Override
	public boolean hasMethodPermission(SessionUserDto user, String className,
			String methodName) {
		if (Constants.USER_TYPE_ADMIN.equals(user.getUserType())) {
			return true;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", user.getId());
		map.put("className", className);
		map.put("methodName", methodName);
		List<RmsMethod> methods = rmsMethodMapper
				.listMethodPermissionByUser(map);
		return !CollectionUtils.isEmpty(methods);
	}

	/**
	 * 根据id删除用户
	 * 
	 * @param userId
	 *            用户id
	 */
	@Override
	public void deleteById(Long userId) {
		if (userId != null) {
			rmsUserMapper.deleteByPrimaryKey(userId);
		}
	}

	/**
	 * 根据id查询用户
	 * 
	 * @param userId
	 *            用户id
	 */
	@Override
	public RmsUser getById(Long userId) {
		return rmsUserMapper.selectByPrimaryKey(userId);
	}

	/**
	 * 保存或更新用户
	 * 
	 * @param user
	 *            用户
	 */
	@Override
	public void saveOrUpdateRmsUser(RmsUser user) {
		if (user.getId() == null || user.getId() <= 0) {
			user.setCreateTime(new Date());
			user.setUpdateTime(user.getCreateTime());
			user.setDeleteFlag(0);
			user.setPasswordKey(System.currentTimeMillis() + "");
			user.setPassword(MD5.getMD5String(user.getPassword()
					+ user.getPasswordKey()));
			rmsUserMapper.insert(user);
		} else {
			RmsUser temp = rmsUserMapper.selectByPrimaryKey(user.getId()
					.longValue());
			if (temp != null) {
				temp.setUpdateTime(new Date());
				temp.setName(user.getName());
				temp.setUserType(user.getUserType());
				temp.setRoleId(user.getRoleId());
				rmsUserMapper.updateByPrimaryKey(temp);
			}
		}
	}

	@Override
	public void saveUserPassword(RmsUser user) {
		RmsUser temp = rmsUserMapper.selectByPrimaryKey(user.getId());
		if (user != null && temp != null) {
			temp.setPassword(MD5.getMD5String(user.getPassword()
					+ temp.getPasswordKey()));
			temp.setUpdateTime(new Date());
			rmsUserMapper.updateByPrimaryKey(temp);
		}
	}

	/**
	 * 用户名是否可使用
	 * 
	 * @param user
	 *            参数
	 * @return false不可用
	 */
	@Override
	public boolean isUserNameAvalible(RmsUser user) {
		if (user.getId() != null && user.getId() > 0) {
			RmsUser temp = rmsUserMapper.selectByPrimaryKey(user.getId());
			if (temp != null && temp.getName().equals(user.getName().trim())) {
				return true;
			}
		}
		RmsUserDto queryParam = new RmsUserDto();
		queryParam.setFullMatch(true);
		queryParam.setName(user.getName().trim());
		PageBounds pageBounds = new PageBounds();
		pageBounds.setLimit(1);
		pageBounds.setContainsTotalCount(false);
		PageList<RmsUserDto> list = rmsUserMapper.listRmsUserByPage(queryParam,
				pageBounds);
		return CollectionUtils.isEmpty(list);
	}

	@Override
	public boolean checkPassword(RmsUser user) {
		// TODO Auto-generated method stub
		String password = null;
		if (user != null) {
			password = MD5.getMD5String(user.getPassword()
					+ user.getPasswordKey());
			if (password != null && user.getId() != null && user.getId() > 0) {
				RmsUser temp = rmsUserMapper.selectByPrimaryKey(user.getId());
				if (temp != null && temp.getPassword().equals(password)) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public boolean getByRoleId(Long roleId) {
		// TODO Auto-generated method stub
		List userList = rmsUserMapper.selectByRoleId(roleId);
		if (userList.size() > 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void addScore(RmsUser user) {
		// TODO Auto-generated method stub
		rmsUserMapper.addScore(user);
	}

}
