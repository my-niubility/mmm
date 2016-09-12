package com.nbl.jspbean.risk;

import java.util.Date;

/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 对应黑白单实体类
 */

public class RiskBlackWhiteBean {
	private String id;

    private String custId;

    private String bwType;

    private String type;

    private Date createdTime;

    private String description;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId == null ? null : custId.trim();
    }

    public String getBwType() {
        return bwType;
    }

    public void setBwType(String bwType) {
        this.bwType = bwType == null ? null : bwType.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

	@Override
	public String toString() {
		return "RiskBlackWhiteBean [id=" + id + ", custId=" + custId + ", bwType=" + bwType + ", type=" + type
				+ ", createdTime=" + createdTime + ", description=" + description + "]";
	}
    
}
