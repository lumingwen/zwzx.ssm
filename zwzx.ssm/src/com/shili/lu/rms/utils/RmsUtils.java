/**
 * 
 */
package com.shili.lu.rms.utils;

import java.util.List;

import org.springframework.util.CollectionUtils;

import com.shili.lu.rms.dto.RmsMenuDto;
import com.shili.lu.rms.dto.RmsMethodDto;

/**
 * 权限管理工具类
 * 
 * @author zhangxujun
 * 
 * 
 */
public class RmsUtils {

	/**
	 * 系统菜单地址trim处理
	 * 
	 * @param str
	 * @return
	 */
	public static String trimMenu(String str) {
		if (str == null) {
			return "";
		}
		return str.trim();
	}

	/**
	 * 初始化资源的checked选中状态
	 * 
	 * @param allList
	 *            所有集合
	 * @param selectList
	 *            选中集合
	 */
	public static void initSelectMethodList(List<RmsMethodDto> allList,
			List<RmsMethodDto> selectList) {
		if (CollectionUtils.isEmpty(allList)
				|| CollectionUtils.isEmpty(selectList)) {
			return;
		}
		for (RmsMethodDto method1 : allList) {
			method1.setChecked(false);
			for (RmsMethodDto method2 : selectList) {
				if (method1.getId().equals(method2.getId())) {
					method1.setChecked(true);
				}
			}
		}
	}

	/**
	 * 初始化菜单的checked选中状态
	 * 
	 * @param allList
	 *            所有集合
	 * @param selectList
	 *            选中集合
	 */
	public static void initSelectMenuList(List<RmsMenuDto> allList,
			List<RmsMenuDto> selectList) {
		if (CollectionUtils.isEmpty(allList)
				|| CollectionUtils.isEmpty(selectList)) {
			return;
		}
		for (RmsMenuDto method1 : allList) {
			method1.setChecked(false);
			for (RmsMenuDto method2 : selectList) {
				if (method1.getId().equals(method2.getId())) {
					method1.setChecked(true);
				}
			}
		}
	}
}
