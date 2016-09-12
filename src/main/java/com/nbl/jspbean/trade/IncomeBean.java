package com.nbl.jspbean.trade;

import java.util.Date;

public class IncomeBean {

	private String id;

	private String custId;

	private String projectId;

	private String positionId;

	private String custName;

	private String projectName;

	private Long earning;

	private Long capital;

	private Long amt;

	private String earningStr;

	private String capitalStr;

	private String amtStr;

	private String accountDate;

	private String repayMode;

	private String incomeType;

	private Long proIncomeTerm;

	private String isFinish;

	private String enabled;

	private String remark;

	private Date createDate;

	public String getEarningStr() {
		return earningStr;
	}

	public void setEarningStr(String earningStr) {
		this.earningStr = earningStr;
	}

	public String getCapitalStr() {
		return capitalStr;
	}

	public void setCapitalStr(String capitalStr) {
		this.capitalStr = capitalStr;
	}

	public String getAmtStr() {
		return amtStr;
	}

	public void setAmtStr(String amtStr) {
		this.amtStr = amtStr;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getPositionId() {
		return positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Long getEarning() {
		return earning;
	}

	public void setEarning(Long earning) {
		this.earning = earning;
	}

	public Long getCapital() {
		return capital;
	}

	public void setCapital(Long capital) {
		this.capital = capital;
	}

	public Long getAmt() {
		return amt;
	}

	public void setAmt(Long amt) {
		this.amt = amt;
	}

	public String getAccountDate() {
		return accountDate;
	}

	public void setAccountDate(String accountDate) {
		this.accountDate = accountDate;
	}

	public String getRepayMode() {
		return repayMode;
	}

	public void setRepayMode(String repayMode) {
		this.repayMode = repayMode;
	}

	public String getIncomeType() {
		return incomeType;
	}

	public void setIncomeType(String incomeType) {
		this.incomeType = incomeType;
	}

	public Long getProIncomeTerm() {
		return proIncomeTerm;
	}

	public void setProIncomeTerm(Long proIncomeTerm) {
		this.proIncomeTerm = proIncomeTerm;
	}

	public String getIsFinish() {
		return isFinish;
	}

	public void setIsFinish(String isFinish) {
		this.isFinish = isFinish;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "IncomeBean [id=" + id + ", custId=" + custId + ", projectId=" + projectId + ", positionId=" + positionId + ", custName=" + custName + ", projectName=" + projectName + ", earning="
				+ earning + ", capital=" + capital + ", amt=" + amt + ", earningStr=" + earningStr + ", capitalStr=" + capitalStr + ", amtStr=" + amtStr + ", accountDate=" + accountDate
				+ ", repayMode=" + repayMode + ", incomeType=" + incomeType + ", proIncomeTerm=" + proIncomeTerm + ", isFinish=" + isFinish + ", enabled=" + enabled + ", remark=" + remark
				+ ", createDate=" + createDate + "]";
	}

}
