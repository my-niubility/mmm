package com.nbl.jspbean.portion;

import java.util.Date;

/**
 * @author Donald
 * @createdate 2016年5月6日
 * @version 1.0 
 * @description :记账流水bean
 */
public class ChargeBean {
	//记账流水号
    private Integer bookId;
    //记账起始日期(查询使用)
    private String accountDateS;
    //记账截止日期（查询使用）
    private String accountDateE;
    //记账日期
    private String accountDate;   
    //记账规则
    private String ruleId;
    //交易订单号
    private String orderId;
    //支付订单号
    private String payId;
    //交易编码
    private String optCode;
    //支付编码
    private String dealCode;
    //借方科目
    private String drSubjectNo;
    //借方客户ID
    private String drCustId;
    //贷方科目
    private String crSubjectNo;
    //贷方客户ID
    private String crCustId;
    //记账金额
    private Long amount;
    //记账时间
    private Date bookTime;
    //记账状态：00已记账；01已冲正
    private String bookState;
    //付款方借贷标志：借DR ；贷CR
    private String payerFlag;
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public String getAccountDateS() {
		return accountDateS;
	}
	public void setAccountDateS(String accountDateS) {
		this.accountDateS = accountDateS;
	}
	public String getAccountDateE() {
		return accountDateE;
	}
	public void setAccountDateE(String accountDateE) {
		this.accountDateE = accountDateE;
	}
	public String getRuleId() {
		return ruleId;
	}
	public void setRuleId(String ruleId) {
		this.ruleId = ruleId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getOptCode() {
		return optCode;
	}
	public void setOptCode(String optCode) {
		this.optCode = optCode;
	}
	public String getDealCode() {
		return dealCode;
	}
	public void setDealCode(String dealCode) {
		this.dealCode = dealCode;
	}
	public String getDrSubjectNo() {
		return drSubjectNo;
	}
	public void setDrSubjectNo(String drSubjectNo) {
		this.drSubjectNo = drSubjectNo;
	}
	public String getDrCustId() {
		return drCustId;
	}
	public void setDrCustId(String drCustId) {
		this.drCustId = drCustId;
	}
	public String getCrSubjectNo() {
		return crSubjectNo;
	}
	public void setCrSubjectNo(String crSubjectNo) {
		this.crSubjectNo = crSubjectNo;
	}
	public String getCrCustId() {
		return crCustId;
	}
	public void setCrCustId(String crCustId) {
		this.crCustId = crCustId;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Date getBookTime() {
		return bookTime;
	}
	public void setBookTime(Date bookTime) {
		this.bookTime = bookTime;
	}
	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	public String getPayerFlag() {
		return payerFlag;
	}
	public void setPayerFlag(String payerFlag) {
		this.payerFlag = payerFlag;
	}
	public String getAccountDate() {
		return accountDate;
	}
	public void setAccountDate(String accountDate) {
		this.accountDate = accountDate;
	}


}
