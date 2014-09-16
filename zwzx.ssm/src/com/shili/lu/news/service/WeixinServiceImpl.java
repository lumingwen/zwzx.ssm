/**
 * 
 */
package com.shili.lu.news.service;

import java.util.Date;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.util.Constants;
import com.shili.lu.news.dao.ResWxMaterialImageMapper;
import com.shili.lu.news.dao.ResWxMaterialImageTxtDetailMapper;
import com.shili.lu.news.dao.ResWxMaterialImageTxtMapper;
import com.shili.lu.news.dto.MaterialDto;
import com.shili.lu.news.dto.ResWxMaterialImageTxtDto;
import com.shili.lu.news.model.ResWxMaterialImage;
import com.shili.lu.news.model.ResWxMaterialImageTxt;
import com.shili.lu.news.model.ResWxMaterialImageTxtDetail;

/**
 * 微信service
 * 
 * @author zhangxujun
 * 
 * 
 */
@Service("weixinService")
public class WeixinServiceImpl implements WeixinServiceI {

	private final Logger log = Logger.getLogger(getClass());

	/**
	 * dao
	 */
	@Autowired
	private ResWxMaterialImageMapper resWxMaterialImageMapper;

	/**
	 * dao
	 */
	@Autowired
	private ResWxMaterialImageTxtDetailMapper resWxMaterialImageTxtDetailMapper;

	/**
	 * dao
	 */
	@Autowired
	private ResWxMaterialImageTxtMapper resWxMaterialImageTxtMapper;

	/**
	 * 根据id查询图片素材
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public ResWxMaterialImage getWxMaterialImage(Long id) {
		return resWxMaterialImageMapper.selectByPrimaryKey(id);
	}

	/**
	 * 新增/修改/删除,图片素材
	 * 
	 * @param dto
	 */
	@Override
	public void editWxImage(ResWxMaterialImage dto) {
		if (dto != null) {
			if (Constants.DEL_FLAG_YES.equals(dto.getDeleteFlag())) {
				// 删除
				resWxMaterialImageMapper.deleteByPrimaryKey(dto.getId());
			} else if (dto.getId() == null || dto.getId() < 0) {
				// 新增
				dto.setCreateTime(new Date());
				dto.setUpdateTime(new Date());
				dto.setDeleteFlag(Constants.DEL_FLAG_NO);
				resWxMaterialImageMapper.insert(dto);
			} else {
				// 修改
				ResWxMaterialImage temp = resWxMaterialImageMapper
						.selectByPrimaryKey(dto.getId());
				temp.setUpdateTime(new Date());
				temp.setName(dto.getName());
				temp.setImageId(dto.getImageId());
				resWxMaterialImageMapper.updateByPrimaryKey(temp);
			}
		}
	}

	/**
	 * 新增/修改/删除,图文素材
	 * 
	 * @param dto
	 */
	@Override
	public void editWxImageTxt(ResWxMaterialImageTxtDto dto) {
		if (dto != null) {
			if (Constants.DEL_FLAG_YES.equals(dto.getDeleteFlag())) {
				// 删除
				resWxMaterialImageTxtMapper.deleteByPrimaryKey(dto.getId());

			} else if (dto.getId() == null || dto.getId() < 0) {
				// 新增
				dto.setCreateTime(new Date());
				dto.setUpdateTime(dto.getCreateTime());
				dto.setDeleteFlag(Constants.DEL_FLAG_NO);
				resWxMaterialImageTxtMapper.insert(dto);
				if (dto.getDetailList() != null) {
					for (ResWxMaterialImageTxtDetail detail : dto
							.getDetailList()) {
						detail.setCreateTime(dto.getCreateTime());
						detail.setUpdateTime(dto.getUpdateTime());
						detail.setDeleteFlag(dto.getDeleteFlag());
						detail.setImageTxtId(dto.getId());
						resWxMaterialImageTxtDetailMapper.insert(detail);
					}
				}
			} else {
				// 修改

				ResWxMaterialImageTxt db = resWxMaterialImageTxtMapper
						.selectByPrimaryKey(dto.getId());
				dto.setCreateTime(db.getCreateTime());
				dto.setUpdateTime(new Date());
				dto.setDeleteFlag(db.getDeleteFlag());
				resWxMaterialImageTxtMapper.updateByPrimaryKey(dto);
				if (dto.getDetailList() != null) {
					for (ResWxMaterialImageTxtDetail detail : dto
							.getDetailList()) {
						detail.setCreateTime(dto.getCreateTime());
						detail.setUpdateTime(dto.getUpdateTime());
						detail.setDeleteFlag(dto.getDeleteFlag());
						detail.setImageTxtId(dto.getId());
						resWxMaterialImageTxtDetailMapper.insert(detail);
					}
				}
			}
		}
	}

	/**
	 * 根据id查询图文素材dto
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public ResWxMaterialImageTxtDto getImageTxtDto(Long id) {

		ResWxMaterialImageTxt temp = resWxMaterialImageTxtMapper
				.selectByPrimaryKey(id);
		if (temp != null) {
			ResWxMaterialImageTxtDto dto = new ResWxMaterialImageTxtDto();
			try {
				PropertyUtils.copyProperties(dto, temp);
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
			// List<ResWxMaterialImageTxtDetail> list =
			// resWxMaterialImageTxtDetailMapper
			// .listByImageTextId(id);
			// dto.setDetailList(list);
			return dto;
		}
		return null;
	}

	@Override
	public PageList<MaterialDto> listMaterialByPage(MaterialDto queryParam,
			PageBounds pageBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteWxSend(Long id) {
		// TODO Auto-generated method stub

	}

}
