/**
 * 
 */
package com.shili.lu.image.service;

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
 * @author lumw
 * 
 * 
 */
@Service("imageMaterialService")
public class ImageMaterialServiceImpl implements ImageMaterialServiceI {

	
}
