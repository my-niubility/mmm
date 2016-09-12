package com.nbl.jspbean.party;

import java.util.Date;

public class PartyBean {
	
	//部门类型
	private String partyType;
	//部门编号
	private String partyNumber;
	//部门名称
	private String partyName;
	//所属上级部门名称
	private String partyParent;
	//部门描述
	private String partyDescription;
	//部门负责人
	private String partyPerson;
	//负责人电话
	private String phone;
	//创建时间
	private Date createTime;

	public String getPartyType() {
		return partyType;
	}

	public void setPartyType(String partyType) {
		this.partyType = partyType;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public String getPartyParent() {
		return partyParent;
	}

	public void setPartyParent(String partyParent) {
		this.partyParent = partyParent;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPartyDescription() {
		return partyDescription;
	}

	public void setPartyDescription(String partyDescription) {
		this.partyDescription = partyDescription;
	}

	public String getPartyPerson() {
		return partyPerson;
	}

	public void setPartyPerson(String partyPerson) {
		this.partyPerson = partyPerson;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPartyNumber() {
		return partyNumber;
	}

	public void setPartyNumber(String partyNumber) {
		this.partyNumber = partyNumber;
	}
	
	

}
