package com.shili.lu.rms.service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.rms.dto.RmsUserDto;
import com.shili.lu.rms.dto.SessionUserDto;
import com.shili.lu.rms.model.RmsUser;

public interface RmsUserServiceI {

	/**
	 * 分页查询用户
	 * 
	 * @param queryParam
	 *            查询参数
	 * @param pageBounds
	 *            分页参数
	 * 
	 */
	public PageList<RmsUserDto> listByPage(RmsUserDto queryParam,
			PageBounds pageBounds);

	/**
	 * 根据用户名查询用户
	 * 
	 * @param username
	 * @return
	 */
	public RmsUser getByName(String username);

	/**
	 * 判断用户是否具有方法权限
	 * 
	 * @param user
	 *            登录用户
	 * @param className
	 *            类名
	 * @param methodName
	 *            方法名
	 * @return true或false
	 */
	public boolean hasMethodPermission(SessionUserDto user, String className,
			String methodName);

	/**
	 * 根据id删除用户
	 * 
	 * @param userId
	 *            用户id
	 */
	public void deleteById(Long userId);

	/**
	 * 根据id增加竞争力
	 */
	public void addScore(RmsUser user);

	/**
	 * 根据id查询用户
	 * 
	 * @param userId
	 *            用户id
	 */
	public RmsUser getById(Long userId);

	/**
	 * 受否还有用户使用该角色
	 * 
	 * @param userId
	 *            用户id
	 */
	public boolean getByRoleId(Long roleId);

	/**
	 * 保存或更新用户
	 * 
	 * @param user
	 *            用户
	 */
	public void saveOrUpdateRmsUser(RmsUser user);

	/**
	 * 用户名是否可使用
	 * 
	 * @param user
	 *            参数
	 * @return false不可用
	 */
	public boolean isUserNameAvalible(RmsUser user);

	/**
	 * 检查密码是否正确
	 * 
	 * @param user
	 * @return
	 */
	public boolean checkPassword(RmsUser user);

	/**
	 * 保存用户密码
	 * 
	 * @param user
	 */
	public void saveUserPassword(RmsUser user);
}
