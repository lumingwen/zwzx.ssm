package com.shili.lu.common.model;

import java.util.Date;

/**
 * 字典
 * 
 * @author zhangxujun
 * 
 * 
 */
public class ResDict {

	/**
	 * 主键
	 */
	private Long id;

	/**
	 * 字典类型,参考常量类Constants中的DICT_*
	 */
	private String type;

	/**
	 * 中文名
	 */
	private String cname;

	/**
	 * 英文名
	 */
	private String ename;

	/**
	 * 拼音首字母
	 */
	private String pyszm;

	/**
	 * 父id,0表示顶级
	 */
	private Long pid;

	/**
	 * 排序,数字越大越靠前
	 */
	private Integer orderIndex;

	/**
	 * 创建时间
	 */
	private Date createTime;

	/**
	 * 更新时间
	 */
	private Date updateTime;

	/**
	 * 删除标记
	 */
	private Integer deleteFlag;

	/**
	 * 拼音首字母简拼
	 */
	private String shortPy;
	
	/**
	 * 代码
	 */
	private String code;
	
	/**
	 * 状态
	 */
	private Integer status;
	/**
	 * 热门状态
	 */
	private Integer hotStatus;
	
	
	public String getShortPy() {
		return shortPy;
	}

	public void setShortPy(String shortPy) {
		this.shortPy = shortPy;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname == null ? null : cname.trim();
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename == null ? null : ename.trim();
	}

	public String getPyszm() {
		return pyszm;
	}

	public void setPyszm(String pyszm) {
		this.pyszm = pyszm == null ? null : pyszm.trim();
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public Integer getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(Integer orderIndex) {
		this.orderIndex = orderIndex;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getCode() {
	    return code;
	}

	public void setCode(String code) {
	    this.code = code;
	}

	public Integer getStatus() {
	    return status;
	}

	public void setStatus(Integer status) {
	    this.status = status;
	}

	public Integer getHotStatus() {
	    return hotStatus;
	}

	public void setHotStatus(Integer hotStatus) {
	    this.hotStatus = hotStatus;
	}
	
	
}