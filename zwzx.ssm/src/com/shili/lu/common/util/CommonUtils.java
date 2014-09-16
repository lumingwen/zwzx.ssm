/**
 * 
 */
package com.shili.lu.common.util;

import java.beans.PropertyDescriptor;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.PropertyUtils;

import com.alibaba.druid.util.StringUtils;
import com.shili.lu.common.model.ResAttachment;

/**
 * 
 * 公共工具类
 * 
 * @author zhangxujun
 * 
 * 
 */
public class CommonUtils {

	/**
	 * 获得附件的真实地址
	 * 
	 * @param attachment
	 * @return
	 */
	public static String getAttachmentRealPath(HttpServletRequest request,
			ResAttachment attachment) {
		String relativePath = attachment.getSavePath();
		String filePath = request.getSession().getServletContext()
				.getRealPath("/")
				+ relativePath;
		return filePath;
	}

	/**
	 * 字符串连接函数,功能类似mysql中的group_concat函数
	 * 
	 * @param list
	 *            对象集合
	 * @param field
	 *            集合中对象的属性名
	 * @param separator
	 *            分割符
	 * @return 字符串
	 */
	@SuppressWarnings("rawtypes")
	public static String groupConcat(List list, String field, String separator) {
		StringBuffer sb = new StringBuffer();
		if (list != null && !list.isEmpty()) {
			for (Object obj : list) {
				if (sb.length() == 0) {
					sb.append(separator);
				}
				if (StringUtils.isEmpty(field)) {
					sb.append(String.valueOf(obj));
				} else {
					try {
						sb.append(String.valueOf(PropertyUtils.getProperty(obj,
								field)));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		return sb.toString();
	}

	/**
	 * 构造测试对象
	 * 
	 * @param cls
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static Object buildObject(Class cls) {
		try {
			PropertyDescriptor[] pds = PropertyUtils
					.getPropertyDescriptors(cls);
			Object o = cls.newInstance();
			for (PropertyDescriptor pd : pds) {
				Class type = pd.getPropertyType();
				if (String.class.equals(type)) {
					PropertyUtils.setProperty(o, pd.getName(), pd.getName()
							+ System.currentTimeMillis());
				}
				if (Long.class.equals(type)) {
					PropertyUtils.setProperty(o, pd.getName(), 1L);
				}
				if (Integer.class.equals(type)) {
					PropertyUtils.setProperty(o, pd.getName(), 0);
				}
				if (Date.class.equals(type)) {
					PropertyUtils.setProperty(o, pd.getName(), new Date());
				}
			}
			return o;
		} catch (Exception e) {
			return null;
		}
	}

}
