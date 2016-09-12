package com.nbl.jspbean.product;

/**
 * @author Donald
 * @createdate 2016年4月11日
 * @version 1.0 
 * @description :项目发布时--租赁物要素bean
 */
public class RentRigsterBean {

	//租赁物名称
	private String rentName;
	//所属承租人
	private String extendsId;
	//租赁物单价
	private String rentUnit;
	//租赁物描述
	private String rentMessage;
	//租赁物供应商
	private String rentProduce;
	//租赁物供应商介绍
	private String produceIntro;
	//其他情况描述1
	private String otherRemark1;
	//其他情况描述2
	private String otherRemark2;
	//其他情况描述3
	private String otherRemark3;
	public String getRentName() {
		return rentName;
	}
	public void setRentName(String rentName) {
		this.rentName = rentName;
	}
	public String getExtendsId() {
		return extendsId;
	}
	public void setExtendsId(String extendsId) {
		this.extendsId = extendsId;
	}
	public String getRentUnit() {
		return rentUnit;
	}
	public void setRentUnit(String rentUnit) {
		this.rentUnit = rentUnit;
	}
	public String getRentMessage() {
		return rentMessage;
	}
	public void setRentMessage(String rentMessage) {
		this.rentMessage = rentMessage;
	}
	public String getRentProduce() {
		return rentProduce;
	}
	public void setRentProduce(String rentProduce) {
		this.rentProduce = rentProduce;
	}
	public String getProduceIntro() {
		return produceIntro;
	}
	public void setProduceIntro(String produceIntro) {
		this.produceIntro = produceIntro;
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
		return "RentRigsterBean [rentName=" + rentName + ", extendsId=" + extendsId + ", rentUnit=" + rentUnit
				+ ", rentMessage=" + rentMessage + ", rentProduce=" + rentProduce + ", produceIntro=" + produceIntro
				+ ", otherRemark1=" + otherRemark1 + ", otherRemark2=" + otherRemark2 + ", otherRemark3=" + otherRemark3
				+ "]";
	}

	
}
