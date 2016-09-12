package com.nbl.jspbean.product;

/**
 * @author Donald
 * @createdate 2016年4月11日
 * @version 1.0 
 * @description :项目发布时--承租人要素bean
 */
public class FinanceExtendsBean {

	//承租人id
	private String financeId;
	//承租人名称
	private String financeName;
	//承租人简介
	private String financeIntro;
	//承租人所需租赁物描述
	private String rentMessage;
	//承租人所需租赁物数量
	private String rentTotal;
	//租赁物所有权转移方式
	private String rentTransfer;
	//担保方式说明
	private String guaranteeType;
	//其他情况描述1
	private String otherRemark1;
	//其他情况描述2
	private String otherRemark2;
	//其他情况描述3
	private String otherRemark3;
	public String getFinanceId() {
		return financeId;
	}
	public void setFinanceId(String financeId) {
		this.financeId = financeId;
	}
	public String getFinanceName() {
		return financeName;
	}
	public void setFinanceName(String financeName) {
		this.financeName = financeName;
	}
	public String getFinanceIntro() {
		return financeIntro;
	}
	public void setFinanceIntro(String financeIntro) {
		this.financeIntro = financeIntro;
	}
	public String getRentMessage() {
		return rentMessage;
	}
	public void setRentMessage(String rentMessage) {
		this.rentMessage = rentMessage;
	}
	public String getRentTotal() {
		return rentTotal;
	}
	public void setRentTotal(String rentTotal) {
		this.rentTotal = rentTotal;
	}
	public String getRentTransfer() {
		return rentTransfer;
	}
	public void setRentTransfer(String rentTransfer) {
		this.rentTransfer = rentTransfer;
	}
	public String getGuaranteeType() {
		return guaranteeType;
	}
	public void setGuaranteeType(String guaranteeType) {
		this.guaranteeType = guaranteeType;
	}
	public String getOtherRemark1() {
		return otherRemark1;
	}
	public void setOtherRemark1(String otherRemark1) {
		this.otherRemark1 = otherRemark1;
	}
	public String getOtherRemark2() {
		return otherRemark2;
	}
	public void setOtherRemark2(String otherRemark2) {
		this.otherRemark2 = otherRemark2;
	}
	public String getOtherRemark3() {
		return otherRemark3;
	}
	public void setOtherRemark3(String otherRemark3) {
		this.otherRemark3 = otherRemark3;
	}
	@Override
	public String toString() {
		return "FinanceExtendsBean [financeId=" + financeId + ", financeName=" + financeName + ", financeIntro="
				+ financeIntro + ", rentMessage=" + rentMessage + ", rentTotal=" + rentTotal + ", rentTransfer="
				+ rentTransfer + ", guaranteeType=" + guaranteeType + ", otherRemark1=" + otherRemark1
				+ ", otherRemark2=" + otherRemark2 + ", otherRemark3=" + otherRemark3 + "]";
	}

}
