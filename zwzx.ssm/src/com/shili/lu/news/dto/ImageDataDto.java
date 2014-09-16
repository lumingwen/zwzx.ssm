/**
 * 
 */
package com.shili.lu.news.dto;

/**
 * 图片数据传输dto
 * @author zhangxujun
 * 
 *
 */
public class ImageDataDto {
    
    /**
     * 附件id
     */
    private Long attachmentId;
    
    /**
     * 素材id
     */
    private Long materialId;
    
    /**
     * 完整路径
     */
    private String fullpath;

    public Long getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Long attachmentId) {
        this.attachmentId = attachmentId;
    }

    public Long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Long materialId) {
        this.materialId = materialId;
    }

    public String getFullpath() {
        return fullpath;
    }

    public void setFullpath(String fullpath) {
        this.fullpath = fullpath;
    }
    
    

}
