/**
 * 
 */
package com.shili.lu.common.service;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shili.lu.common.dao.ResDictMapper;
import com.shili.lu.common.dto.ResDictDto;
import com.shili.lu.common.model.ResDict;
import com.shili.lu.common.util.Constants;

/**
 * 字典service
 * 
 * @author lumingwen
 * 
 * 
 */
@Service("resDictService")
public class ResDictServiceImpl implements ResDictServiceI {

	/**
	 * 字典dao
	 */
	@Autowired
	private ResDictMapper resDictMapper;

	/**
	 * 根据类型查询所有字典
	 * 
	 * @param type
	 * @return
	 */
	@Override
	public List<ResDict> listAllDictByType(String type) {
		ResDict param = new ResDict();
		param.setType(type);
		return resDictMapper.listAllDict(param);
	}

	/**
	 * 分页查询字典目录
	 * 
	 * @param param
	 * @param pageBounds
	 * @return
	 */
	@Override
	public PageList<ResDictDto> listDictContentByPage(ResDict param,
			PageBounds pageBounds) {
		return resDictMapper.listDictContentByPage(param, pageBounds);
	}

	/**
	 * 插入字典
	 * 
	 * @param dict
	 */
	@Override
	public void insertDict(ResDict dict) {
		if (dict != null) {
			// dict.setEname(PinyinConvertUtils.getFullPinyin(dict.getCname()));
			// dict.setPyszm(PinyinConvertUtils.getFirstPinyin(dict.getCname()));
			// dict.setShortPy(PinyinConvertUtils.getShortPinyin(dict.getCname()));
		}
		resDictMapper.insert(dict);
	}

	/**
	 * 级联删除字典
	 * 
	 * @param id
	 */
	@Override
	public void removeDict(Long id) {
		ResDict param = new ResDict();
		param.setPid(id);
		List<ResDict> list = resDictMapper.listAllDict(param);
		if (CollectionUtils.isNotEmpty(list)) {
			for (ResDict dict : list) {
				removeDict(dict.getId());
			}
		}
		resDictMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 修改字典(仅name)
	 * 
	 * @param dict
	 */
	@Override
	public void updateDict(ResDict dict) {
		ResDict db = resDictMapper.selectByPrimaryKey(dict.getId());
		if (db != null) {
			db.setCname(dict.getCname());
			db.setEname(dict.getEname());
			db.setPyszm(dict.getPyszm());
			db.setShortPy(dict.getShortPy());
			db.setUpdateTime(new Date());
			resDictMapper.updateByPrimaryKey(db);
		}
	}

	/**
	 * 修改字典(所有字段)
	 * 
	 * @param dict
	 */
	@Override
	public void updateFullDict(ResDict dict) {
		if (dict != null) {
			// dict.setEname(PinyinConvertUtils.getFullPinyin(dict.getCname()));
			// dict.setPyszm(PinyinConvertUtils.getFirstPinyin(dict.getCname()));
			// dict.setShortPy(PinyinConvertUtils.getShortPinyin(dict.getCname()));
			resDictMapper.updateByPrimaryKey(dict);
		}

	}

	/**
	 * 根据id查询字典
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public ResDict getDictById(Long id) {
		return resDictMapper.selectByPrimaryKey(id);
	}

	/**
	 * 新增、修改、删除、启用、停用,字典内容
	 * 
	 * @param dto
	 */
	@Override
	public Long editDictContent(ResDictDto dto) {
		if (dto != null) {
			if (dto.getId() == null || dto.getId() <= 0) {
				// 新增
				dto.setCreateTime(new Date());
				dto.setUpdateTime(dto.getCreateTime());
				dto.setDeleteFlag(Constants.DEL_FLAG_NO);
				dto.setStatus(Constants.DICT_STAUTS_ENABLE);
				resDictMapper.insert(dto);
			} else {
				if (Constants.DEL_FLAG_YES.equals(dto.getDeleteFlag())) {
					// 删除
					dto.setParam(resDictMapper.getAllChildIds(dto.getId()));
					resDictMapper.cascadeDelete(dto);
				} else if (dto.getStatus() != null) {
					// 启用/停用
					dto.setParam(resDictMapper.getAllChildIds(dto.getId()));
					resDictMapper.cascadeUpdateStauts(dto);
				} else if (dto.getHotStatus() != null) {
					// 是否热门
					ResDict db = resDictMapper.selectByPrimaryKey(dto.getId());
					db.setUpdateTime(new Date());
					db.setHotStatus(dto.getHotStatus());
					resDictMapper.updateByPrimaryKey(db);
				} else {
					// 修改
					ResDict db = resDictMapper.selectByPrimaryKey(dto.getId());
					dto.setCreateTime(db.getCreateTime());
					dto.setUpdateTime(new Date());
					dto.setDeleteFlag(db.getDeleteFlag());
					dto.setStatus(db.getStatus());
					dto.setType(db.getType());
					dto.setPid(db.getPid());
					resDictMapper.updateByPrimaryKey(dto);
				}
			}
			return dto.getId();
		}
		return null;
	}

	@Override
	public List<ResDict> listAllDictByType(String type, Long pid) {
		ResDict param = new ResDict();
		param.setType(type);
		param.setPid(pid);
		param.setStatus(Constants.DICT_STAUTS_ENABLE);
		return resDictMapper.listAllDict(param);
	}

	@Override
	public List<ResDict> queryNewsType(ResDict r) {
		return resDictMapper.listAllDict(r);
	}

	@Override
	public List<ResDict> getDictByTypeName(String type, String typeName) {
		// TODO Auto-generated method stub
		ResDict param = new ResDict();
		param.setType(type);
		param.setCname(typeName);
		return resDictMapper.listAllDict(param);
	}

	@Override
	public List<ResDict> getAllMenu(String type, int hot_status) {
		ResDict param = new ResDict();
		param.setType(type);
		param.setHotStatus(hot_status);
		return resDictMapper.listAllDict(param);
	}

	@Override
	public List<ResDict> getDetailAllMenu(String type, int hot_status,
			Long content_type_id) {
		ResDict param = new ResDict();
		param.setType(type);
		param.setHotStatus(hot_status);
		param.setPid(content_type_id);
		return resDictMapper.listAllDetailDict(param);
	}
}
