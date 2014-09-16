package com.shili.lu.common.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.shili.lu.common.model.ResAttachment;

public interface ResAttachmentServiceI {
	/**
	 * 保存附件
	 * 
	 * @param resAttachment
	 * @return
	 */
	public Integer insert(ResAttachment resAttachment);

	/**
	 * 更新附件
	 * 
	 * @param resAttachment
	 * @return
	 */
	public Integer update(ResAttachment resAttachment);

	/**
	 * 删除附件信息
	 * 
	 * @param id
	 * @return
	 */
	public Integer delete(Long id);

	/**
	 * 根据关联类型和关联ID删除附件信息
	 * 
	 * @param RelType
	 * @param relId
	 * @return
	 */
	public Integer deleteByRel(ResAttachment resAttachment);

	/**
	 * 根据主键获取附件信息
	 * 
	 * @param id
	 * @return
	 */
	public ResAttachment getByPrimaryKey(Long id);

	/**
	 * 根据关联关系获得附件信息 关联关系：关联类型，关联ID
	 * 
	 * @param resAttachment
	 * @return
	 */
	public List<ResAttachment> getByRel(ResAttachment resAttachment);

	/**
	 * 保存附件
	 * 
	 * @param file
	 *            附件
	 * @param limit_size
	 *            单个文件大小限制
	 * @param limit_type
	 *            文件类型限制
	 * @return
	 */
	public ResAttachment saveFile(MultipartFile file, Long limit_size,
			String[] limit_type, HttpServletRequest request);

}
