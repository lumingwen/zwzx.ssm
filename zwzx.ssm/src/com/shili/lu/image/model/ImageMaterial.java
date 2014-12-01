package com.shili.lu.image.model;

import java.util.Date;

public class ImageMaterial {
    private Long id;

	private String title;

	private String source;

	private Date createTime;

	private Date updateTime;

	private Long imageId;

	private Integer deleteFlag;
	
	private Integer height;
	
	private String ava;
	
	private String unm;
	
	private String albid;
	
	private String albnm;
	
	private Integer favc;
	
	private Integer zanc;
	private Integer repc;
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source == null ? null : source.trim();
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

	public Long getImageId() {
		return imageId;
	}

	public void setImageId(Long imageId) {
		this.imageId = imageId;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public String getAva() {
		return ava;
	}

	public void setAva(String ava) {
		this.ava = ava;
	}

	public String getUnm() {
		return unm;
	}

	public void setUnm(String unm) {
		this.unm = unm;
	}

	public String getAlbid() {
		return albid;
	}

	public void setAlbid(String albid) {
		this.albid = albid;
	}

	public String getAlbnm() {
		return albnm;
	}

	public void setAlbnm(String albnm) {
		this.albnm = albnm;
	}

	public Integer getFavc() {
		return favc;
	}

	public void setFavc(Integer favc) {
		this.favc = favc;
	}

	public Integer getZanc() {
		return zanc;
	}

	public void setZanc(Integer zanc) {
		this.zanc = zanc;
	}

	public Integer getRepc() {
		return repc;
	}

	public void setRepc(Integer repc) {
		this.repc = repc;
	}
	
}