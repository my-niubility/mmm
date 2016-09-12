package com.nbl.jspbean.product;

import java.io.Serializable;

/**
 * @author Donald
 * @createdate 2016年4月9日
 * @version 1.0 
 * @description :项目发布时--产品要素bean
 */
public class SolarProductPublishBean implements Serializable{
	
	private static final long serialVersionUID = -2365010780920027924L;
	//产品编号
	private String productId;
	//产品名称
	private String productName;
	//产品类型
	private String productType;
	//项目步骤
	private String projectStep;
	//产品募集开始日期
	private String startdt;
	//产品规模
	private String scale;
	//产品单价
	private String unitcost;
	//产品年化利率
	private String rate;
	//产品持有期限
	private String holdday;
	//产品锁定期限
	private String lockday;
	//产品记租方式
	private String rentType;
	//返租日期（每月的某一天）
	private String backday;
	//产品正常回购日期
	private String nonbackday;
	//产品合同到期日
	private String contrday;
	//预计产生碳豆
	private String carbon;
	//项目地址描述
	private String proAddress;
	//项目规模描述
	private String proScaleMess;
	//转移方式
	private String transfer;

	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getProjectStep() {
		return projectStep;
	}
	public void setProjectStep(String projectStep) {
		this.projectStep = projectStep;
	}
	public String getStartdt() {
		return startdt;
	}
	public void setStartdt(String startdt) {
		this.startdt = startdt;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getUnitcost() {
		return unitcost;
	}
	public void setUnitcost(String unitcost) {
		this.unitcost = unitcost;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getHoldday() {
		return holdday;
	}
	public void setHoldday(String holdday) {
		this.holdday = holdday;
	}
	public String getLockday() {
		return lockday;
	}
	public void setLockday(String lockday) {
		this.lockday = lockday;
	}
	public String getRentType() {
		return rentType;
	}
	public void setRentType(String rentType) {
		this.rentType = rentType;
	}
	public String getBackday() {
		return backday;
	}
	public void setBackday(String backday) {
		this.backday = backday;
	}
	public String getNonbackday() {
		return nonbackday;
	}
	public void setNonbackday(String nonbackday) {
		this.nonbackday = nonbackday;
	}
	public String getContrday() {
		return contrday;
	}
	public void setContrday(String contrday) {
		this.contrday = contrday;
	}
	public String getCarbon() {
		return carbon;
	}
	public void setCarbon(String carbon) {
		this.carbon = carbon;
	}
	public String getProAddress() {
		return proAddress;
	}
	public void setProAddress(String proAddress) {
		this.proAddress = proAddress;
	}
	public String getProScaleMess() {
		return proScaleMess;
	}
	public void setProScaleMess(String proScaleMess) {
		this.proScaleMess = proScaleMess;
	}
	public String getTransfer() {
		return transfer;
	}
	public void setTransfer(String transfer) {
		this.transfer = transfer;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "SolarProductPublishBean [productId=" + productId + ", productName=" + productName + ", productType="
				+ productType + ", projectStep=" + projectStep + ", startdt=" + startdt + ", scale=" + scale
				+ ", unitcost=" + unitcost + ", rate=" + rate + ", holdday=" + holdday + ", lockday=" + lockday
				+ ", rentType=" + rentType + ", backday=" + backday + ", nonbackday=" + nonbackday + ", contrday="
				+ contrday + ", carbon=" + carbon + ", proAddress=" + proAddress + ", proScaleMess=" + proScaleMess
				+ ", transfer=" + transfer + "]";
	}
	
}
