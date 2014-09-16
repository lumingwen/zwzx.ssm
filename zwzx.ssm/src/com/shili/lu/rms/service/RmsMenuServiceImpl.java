/**
 * 
 */
package com.shili.lu.rms.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shili.lu.common.util.Constants;
import com.shili.lu.rms.dao.RmsMenuMapper;
import com.shili.lu.rms.dao.RmsUserMapper;
import com.shili.lu.rms.dto.RmsMenuDto;
import com.shili.lu.rms.model.RmsUser;
import com.shili.lu.rms.utils.RmsUtils;

/**
 * 
 * 菜单service
 * 
 * @author zhangxujun
 * 
 * 
 */
@Service("rmsMenuService")
public class RmsMenuServiceImpl implements RmsMenuServiceI {

	/**
	 * 菜单dao
	 */
	@Autowired
	private RmsMenuMapper rmsMenuMapper;

	/**
	 * 用户dao
	 */
	@Autowired
	private RmsUserMapper rmsUserMapper;

	/**
	 * 根据权限查询系统菜单json字符串
	 * 
	 * @param userId
	 *            用户id
	 * 
	 */
	@Override
	public String getMenuJson(Long userId) {
		RmsUser user = rmsUserMapper.selectByPrimaryKey(userId);
		if (Constants.USER_TYPE_ADMIN.equals(user.getUserType())) {
			// 超级管理员
			String json = buildChildMenuJson(1, Constants.TOP_PID, null);
			return json;
		} else {
			// 其他
			RmsMenuDto menu = new RmsMenuDto();
			menu.setRoleId(user.getRoleId() == null ? -1L : user.getRoleId());
			List<RmsMenuDto> menus = rmsMenuMapper.listMenu(menu);
			String json = buildChildMenuJson(2, Constants.TOP_PID, menus);
			return json;
		}
	}

	/**
	 * @param type
	 *            类型(1:超级管理员,2:其他)
	 * @param pid
	 *            顶级id
	 * @return
	 */
	private String buildChildMenuJson(int type, Long pid, List<RmsMenuDto> list) {

		// 根据父id查询子节点
		List<RmsMenuDto> menus = new ArrayList<RmsMenuDto>();
		if (type == 1) {
			RmsMenuDto menu = new RmsMenuDto();
			menu.setPid(pid);
			menus = rmsMenuMapper.listMenu(menu);
		} else {
			if (list != null) {
				for (RmsMenuDto dto : list) {
					if (pid != null && pid.equals(dto.getPid())) {
						menus.add(dto);
					}
				}
			}
		}

		// 递归生成json
		menus = menus == null ? new ArrayList<RmsMenuDto>() : menus;
		StringBuffer sb = new StringBuffer("[");
		for (int i = 0; i < menus.size(); i++) {
			RmsMenuDto temp = menus.get(i);
			if (i > 0) {
				sb.append(",");
			}
			sb.append("{");
			sb.append("'id':'").append(temp.getId()).append("',");
			sb.append("'name':'").append(temp.getName()).append("',");
			sb.append("'level':'").append(temp.getLevel()).append("',");
			sb.append("'type':'").append(temp.getType()).append("',");
			sb.append("'pid':'").append(temp.getPid()).append("',");
			sb.append("'url':'").append(RmsUtils.trimMenu(temp.getUrl()))
					.append("',");
			sb.append("'iconUrl':'")
					.append(RmsUtils.trimMenu(temp.getIconUrl())).append("',");
			sb.append("'children':").append(
					buildChildMenuJson(type, temp.getId(), list));
			sb.append("}");
		}
		sb.append("]");
		return sb.toString();
	}

	/**
	 * 根据角色查询所有菜单
	 * 
	 * @param roleId
	 *            角色id
	 * 
	 */
	@Override
	public List<RmsMenuDto> listAllMenuByRoleId(Long roleId) {
		RmsMenuDto menu = new RmsMenuDto();
		menu.setRoleId(roleId);
		return rmsMenuMapper.listMenu(menu);
	}

	/**
	 * 查询所有菜单
	 * 
	 */
	@Override
	public List<RmsMenuDto> listAllMenu() {
		RmsMenuDto menu = new RmsMenuDto();
		return rmsMenuMapper.listMenu(menu);
	}

	/**
	 * 新增菜单(级联保存)
	 * 
	 * @param menu
	 */
	@Override
	public void insertMenu(RmsMenuDto dto) {
		// 保存自身
		dto.setCreateTime(new Date());
		dto.setUpdateTime(new Date());
		dto.setDeleteFlag(Constants.DEL_FLAG_NO);
		if (dto.getPid() == null) {
			dto.setPid(Constants.TOP_PID);
		}
		if (dto.getLevel() == null) {
			dto.setLevel(1);
		}
		rmsMenuMapper.insert(dto);
		// 保存子菜单
		if (CollectionUtils.isNotEmpty(dto.getChildList())) {
			for (RmsMenuDto child : dto.getChildList()) {
				child.setPid(dto.getId());
				child.setLevel(dto.getLevel() + 1);
				insertMenu(child);
			}
		}
	}

}
