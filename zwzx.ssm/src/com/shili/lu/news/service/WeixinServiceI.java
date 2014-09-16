/**
 * 
 */
package com.shili.lu.news.service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.news.dto.MaterialDto;
import com.shili.lu.news.dto.ResWxMaterialImageTxtDto;
import com.shili.lu.news.model.ResWxMaterialImage;

/**
 * 微信service
 * 
 * @author zhangxujun
 * 
 * 
 */
public interface WeixinServiceI {

	/**
	 * 查询素材列表
	 * 
	 * @param queryParam
	 * @param pageBounds
	 * @return
	 */
	public PageList<MaterialDto> listMaterialByPage(MaterialDto queryParam,
			PageBounds pageBounds);

	/**
	 * 根据id查询图片素材
	 * 
	 * @param id
	 * @return
	 */
	public ResWxMaterialImage getWxMaterialImage(Long id);

	/**
	 * 新增/修改/删除,图片素材
	 * 
	 * @param dto
	 */
	public void editWxImage(ResWxMaterialImage dto);

	/**
	 * 新增/修改/删除,图文素材
	 * 
	 * @param dto
	 */
	public void editWxImageTxt(ResWxMaterialImageTxtDto dto);

	/**
	 * 根据id查询图文素材dto
	 * 
	 * @param id
	 * @return
	 */
	public ResWxMaterialImageTxtDto getImageTxtDto(Long id);

	/**
	 * 删除发送记录
	 * 
	 * @param id
	 */
	public void deleteWxSend(Long id);
}
