/**
 * 
 */
package com.shili.lu.news.dto;

import java.util.List;

import com.shili.lu.news.model.ResWxMaterialImageTxt;
import com.shili.lu.news.model.ResWxMaterialImageTxtDetail;

/**
 * 图文素材dto
 * 
 * @author zhangxujun
 * 
 * 
 */
public class ResWxMaterialImageTxtDto extends ResWxMaterialImageTxt {

	/**
	 * 图文素材详细
	 */
	private List<ResWxMaterialImageTxtDetail> detailList;

	public List<ResWxMaterialImageTxtDetail> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<ResWxMaterialImageTxtDetail> detailList) {
		this.detailList = detailList;
	}

}
