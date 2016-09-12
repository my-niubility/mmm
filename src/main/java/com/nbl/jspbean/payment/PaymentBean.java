/**
 * @author gcs
 * @createdate 2016年8月10日	
 * @version 1.0
 * 支付订单实体类
 */
package com.nbl.jspbean.payment;

import java.util.Date;

public class PaymentBean {
	
	private String id;

    private String payId;

    private String totalId;

    private String batchId;

    private String contractId;

    private String productId;

    private String productNane;

    private String fundsType;

    private Long tradeAmt;

    private String merchantId;

    private String payCustId;

    private String payCustName;

    private String payAccount;

    private String recCustId;

    private String recCustName;

    private String recAccount;

    private String payBankType;

    private String payBankCardNo;

    private String payDate;

    private String status;

    private String resultInfo;

    private String paymentType;

    private String checkStatus;

    private String unbalanceReason;

    private String retreatSource;

    private String remark;

    private Date createTime;
    //扩展字段  开始时间
    private String startTime;
    //扩展字段  结束时间
    private String endTime;
    
    private Date updateTime;

    private Long tradeTalAmt;

    private Long redEnvAmt;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getTotalId() {
		return totalId;
	}

	public void setTotalId(String totalId) {
		this.totalId = totalId;
	}

	public String getBatchId() {
		return batchId;
	}

	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}

	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductNane() {
		return productNane;
	}

	public void setProductNane(String productNane) {
		this.productNane = productNane;
	}

	public String getFundsType() {
		return fundsType;
	}

	public void setFundsType(String fundsType) {
		this.fundsType = fundsType;
	}

	public Long getTradeAmt() {
		return tradeAmt;
	}

	public void setTradeAmt(Long tradeAmt) {
		this.tradeAmt = tradeAmt;
	}

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	public String getPayCustId() {
		return payCustId;
	}

	public void setPayCustId(String payCustId) {
		this.payCustId = payCustId;
	}

	public String getPayCustName() {
		return payCustName;
	}

	public void setPayCustName(String payCustName) {
		this.payCustName = payCustName;
	}

	public String getPayAccount() {
		return payAccount;
	}

	public void setPayAccount(String payAccount) {
		this.payAccount = payAccount;
	}

	public String getRecCustId() {
		return recCustId;
	}

	public void setRecCustId(String recCustId) {
		this.recCustId = recCustId;
	}

	public String getRecCustName() {
		return recCustName;
	}

	public void setRecCustName(String recCustName) {
		this.recCustName = recCustName;
	}

	public String getRecAccount() {
		return recAccount;
	}

	public void setRecAccount(String recAccount) {
		this.recAccount = recAccount;
	}

	public String getPayBankType() {
		return payBankType;
	}

	public void setPayBankType(String payBankType) {
		this.payBankType = payBankType;
	}

	public String getPayBankCardNo() {
		return payBankCardNo;
	}

	public void setPayBankCardNo(String payBankCardNo) {
		this.payBankCardNo = payBankCardNo;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getResultInfo() {
		return resultInfo;
	}

	public void setResultInfo(String resultInfo) {
		this.resultInfo = resultInfo;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}

	public String getUnbalanceReason() {
		return unbalanceReason;
	}

	public void setUnbalanceReason(String unbalanceReason) {
		this.unbalanceReason = unbalanceReason;
	}

	public String getRetreatSource() {
		return retreatSource;
	}

	public void setRetreatSource(String retreatSource) {
		this.retreatSource = retreatSource;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getTradeTalAmt() {
		return tradeTalAmt;
	}

	public void setTradeTalAmt(Long tradeTalAmt) {
		this.tradeTalAmt = tradeTalAmt;
	}

	public Long getRedEnvAmt() {
		return redEnvAmt;
	}

	public void setRedEnvAmt(Long redEnvAmt) {
		this.redEnvAmt = redEnvAmt;
	}

	@Override
	public String toString() {
		return "PaymentBean [id=" + id + ", payId=" + payId + ", totalId=" + totalId + ", batchId=" + batchId
				+ ", contractId=" + contractId + ", productId=" + productId + ", productNane=" + productNane
				+ ", fundsType=" + fundsType + ", tradeAmt=" + tradeAmt + ", merchantId=" + merchantId + ", payCustId="
				+ payCustId + ", payCustName=" + payCustName + ", payAccount=" + payAccount + ", recCustId=" + recCustId
				+ ", recCustName=" + recCustName + ", recAccount=" + recAccount + ", payBankType=" + payBankType
				+ ", payBankCardNo=" + payBankCardNo + ", payDate=" + payDate + ", status=" + status + ", resultInfo="
				+ resultInfo + ", paymentType=" + paymentType + ", checkStatus=" + checkStatus + ", unbalanceReason="
				+ unbalanceReason + ", retreatSource=" + retreatSource + ", remark=" + remark + ", createTime="
				+ createTime + ", startTime=" + startTime + ", endTime=" + endTime + ", updateTime=" + updateTime
				+ ", tradeTalAmt=" + tradeTalAmt + ", redEnvAmt=" + redEnvAmt + "]";
	}
    
    
}
