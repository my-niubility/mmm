package com.nbl.jspbean.parameter;

import java.util.Date;

/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 对应页面记账规则查询实体类
 */

public class AccountRuleBean {
	
	private String ruleId;

    private String accountType;

    private String payerSubjectNo;

    private String payerFlag;

    private String payeeSubjectNo;

    private String payeeFlag;

    private Date updateTime;

    private String remark;

    public String getRuleId() {
        return ruleId;
    }

    public void setRuleId(String ruleId) {
        this.ruleId = ruleId == null ? null : ruleId.trim();
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType == null ? null : accountType.trim();
    }

    public String getPayerSubjectNo() {
        return payerSubjectNo;
    }

    public void setPayerSubjectNo(String payerSubjectNo) {
        this.payerSubjectNo = payerSubjectNo == null ? null : payerSubjectNo.trim();
    }

    public String getPayerFlag() {
        return payerFlag;
    }

    public void setPayerFlag(String payerFlag) {
        this.payerFlag = payerFlag == null ? null : payerFlag.trim();
    }

    public String getPayeeSubjectNo() {
        return payeeSubjectNo;
    }

    public void setPayeeSubjectNo(String payeeSubjectNo) {
        this.payeeSubjectNo = payeeSubjectNo == null ? null : payeeSubjectNo.trim();
    }

    public String getPayeeFlag() {
        return payeeFlag;
    }

    public void setPayeeFlag(String payeeFlag) {
        this.payeeFlag = payeeFlag == null ? null : payeeFlag.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	@Override
	public String toString() {
		return "AccountRuleBean [ruleId=" + ruleId + ", accountType=" + accountType + ", payerSubjectNo="
				+ payerSubjectNo + ", payerFlag=" + payerFlag + ", payeeSubjectNo=" + payeeSubjectNo + ", payeeFlag="
				+ payeeFlag + ", updateTime=" + updateTime + ", remark=" + remark + "]";
	}
    
    
}
