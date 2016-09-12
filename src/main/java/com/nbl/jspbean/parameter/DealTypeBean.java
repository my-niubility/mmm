package com.nbl.jspbean.parameter;

import java.util.Date;

/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 业务场景步骤表对应的实体Bean
 */

public class DealTypeBean {
	
	private String optCode;

	private String stepKey;
	
	private String ruleId;

    private String dealName;

    private String showName;

    private String choiceCode;

    private Date createDate;

    private Date updateDate;

    public String getRuleId() {
        return ruleId;
    }

    public void setRuleId(String ruleId) {
        this.ruleId = ruleId == null ? null : ruleId.trim();
    }

    public String getDealName() {
        return dealName;
    }

    public void setDealName(String dealName) {
        this.dealName = dealName == null ? null : dealName.trim();
    }

    public String getShowName() {
        return showName;
    }

    public void setShowName(String showName) {
        this.showName = showName == null ? null : showName.trim();
    }

    public String getChoiceCode() {
        return choiceCode;
    }

    public void setChoiceCode(String choiceCode) {
        this.choiceCode = choiceCode == null ? null : choiceCode.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

	public String getOptCode() {
		return optCode;
	}

	public void setOptCode(String optCode) {
		this.optCode = optCode;
	}

	public String getStepKey() {
		return stepKey;
	}

	public void setStepKey(String stepKey) {
		this.stepKey = stepKey;
	}

	@Override
	public String toString() {
		return "DealTypeBean [optCode=" + optCode + ", stepKey=" + stepKey + ", ruleId=" + ruleId + ", dealName="
				+ dealName + ", showName=" + showName + ", choiceCode=" + choiceCode + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + "]";
	}
    
    
}
