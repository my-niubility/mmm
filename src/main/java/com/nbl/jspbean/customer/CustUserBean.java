package com.nbl.jspbean.customer;

import java.util.Date;

/**
 * @author gcs
 * @createdate 2016年8月8日	
 * @version 1.0
 * manager层登录用户对应的实体类
 */

public class CustUserBean {
	
	private String id;

    private String loginName;

    private String password;

    private String mobile;

    private String email;

    private String emailActivateCode;

    private Short enabled;

    private Date periodStart;

    private Date periodEnd;

    private Date createDate;
    
    private Date loginDate;

    private String custId;

    private String custType;

    private Date lastUpdatePasswordTime;

    private Date lastLoginLockTime;

    private String description;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailActivateCode() {
		return emailActivateCode;
	}

	public void setEmailActivateCode(String emailActivateCode) {
		this.emailActivateCode = emailActivateCode;
	}

	public Short getEnabled() {
		return enabled;
	}

	public void setEnabled(Short enabled) {
		this.enabled = enabled;
	}

	public Date getPeriodStart() {
		return periodStart;
	}

	public void setPeriodStart(Date periodStart) {
		this.periodStart = periodStart;
	}

	public Date getPeriodEnd() {
		return periodEnd;
	}

	public void setPeriodEnd(Date periodEnd) {
		this.periodEnd = periodEnd;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustType() {
		return custType;
	}

	public void setCustType(String custType) {
		this.custType = custType;
	}

	public Date getLastUpdatePasswordTime() {
		return lastUpdatePasswordTime;
	}

	public void setLastUpdatePasswordTime(Date lastUpdatePasswordTime) {
		this.lastUpdatePasswordTime = lastUpdatePasswordTime;
	}

	public Date getLastLoginLockTime() {
		return lastLoginLockTime;
	}

	public void setLastLoginLockTime(Date lastLoginLockTime) {
		this.lastLoginLockTime = lastLoginLockTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "CustUserBean [id=" + id + ", loginName=" + loginName + ", password=" + password + ", mobile=" + mobile
				+ ", email=" + email + ", emailActivateCode=" + emailActivateCode + ", enabled=" + enabled
				+ ", periodStart=" + periodStart + ", periodEnd=" + periodEnd + ", createDate=" + createDate
				+ ", loginDate=" + loginDate + ", custId=" + custId + ", custType=" + custType
				+ ", lastUpdatePasswordTime=" + lastUpdatePasswordTime + ", lastLoginLockTime=" + lastLoginLockTime
				+ ", description=" + description + "]";
	}
    
	
    
}
