package com.shili.lu.common.dao;

import java.util.List;

import com.shili.lu.common.model.ResAttachment;

public interface ResAttachmentMapper {
	int deleteByPrimaryKey(Long id);

	int deleteByRel(ResAttachment resAttachment);

	int insert(ResAttachment record);

	ResAttachment selectByPrimaryKey(Long id);

	List<ResAttachment> selectByRel(ResAttachment record);

	int updateByPrimaryKey(ResAttachment record);
}