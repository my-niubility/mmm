package com.nbl.jspbean.product;

/**
 * @author Donald
 * @createdate 2016年4月11日
 * @version 1.0 
 * @description :项目发布时--项目要素bean
 */
public class SolarProjectPublishBean {
	//项目名称
	private String projectName;
	//项目收益描述
	private String projectBenefit;
	//项目概况
	private String projectIntro;
	//项目当前状态描述
	private String projectStaMess;
	//租赁物所有权描述
	private String rentRights;
	//租赁物跟踪情况描述
	private String rentTraceMess;
	//租赁物运维情况描述
	private String rentOperateMess;
	//项目所有在地地图
	private byte[] projectMap;
	//项目真实环境1
	private byte[] projectEnv1;
	//项目真实环境2
	private byte[] projectEnv2;
	//项目真实环境3
	private byte[] projectEnv3;
	//项目真实环境4
	private byte[] projectEnv4;
	//项目其他描述1
	private String projectRemark1;
	//项目其他描述2
	private String projectRemark2;
	//项目其他描述3
	private String projectRemark3;
	//项目其他描述4
	private String projectRemark4;
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectBenefit() {
		return projectBenefit;
	}
	public void setProjectBenefit(String projectBenefit) {
		this.projectBenefit = projectBenefit;
	}
	public String getProjectIntro() {
		return projectIntro;
	}
	public void setProjectIntro(String projectIntro) {
		this.projectIntro = projectIntro;
	}
	public String getProjectStaMess() {
		return projectStaMess;
	}
	public void setProjectStaMess(String projectStaMess) {
		this.projectStaMess = projectStaMess;
	}
	public String getRentRights() {
		return rentRights;
	}
	public void setRentRights(String rentRights) {
		this.rentRights = rentRights;
	}
	public String getRentTraceMess() {
		return rentTraceMess;
	}
	public void setRentTraceMess(String rentTraceMess) {
		this.rentTraceMess = rentTraceMess;
	}
	public String getRentOperateMess() {
		return rentOperateMess;
	}
	public void setRentOperateMess(String rentOperateMess) {
		this.rentOperateMess = rentOperateMess;
	}
	public byte[] getProjectMap() {
		return projectMap;
	}
	public void setProjectMap(byte[] projectMap) {
		this.projectMap = projectMap;
	}
	public byte[] getProjectEnv1() {
		return projectEnv1;
	}
	public void setProjectEnv1(byte[] projectEnv1) {
		this.projectEnv1 = projectEnv1;
	}
	public byte[] getProjectEnv2() {
		return projectEnv2;
	}
	public void setProjectEnv2(byte[] projectEnv2) {
		this.projectEnv2 = projectEnv2;
	}
	public byte[] getProjectEnv3() {
		return projectEnv3;
	}
	public void setProjectEnv3(byte[] projectEnv3) {
		this.projectEnv3 = projectEnv3;
	}
	public byte[] getProjectEnv4() {
		return projectEnv4;
	}
	public void setProjectEnv4(byte[] projectEnv4) {
		this.projectEnv4 = projectEnv4;
	}
	public String getProjectRemark1() {
		return projectRemark1;
	}
	public void setProjectRemark1(String projectRemark1) {
		this.projectRemark1 = projectRemark1;
	}
	public String getProjectRemark2() {
		return projectRemark2;
	}
	public void setProjectRemark2(String projectRemark2) {
		this.projectRemark2 = projectRemark2;
	}
	public String getProjectRemark3() {
		return projectRemark3;
	}
	public void setProjectRemark3(String projectRemark3) {
		this.projectRemark3 = projectRemark3;
	}
	public String getProjectRemark4() {
		return projectRemark4;
	}
	public void setProjectRemark4(String projectRemark4) {
		this.projectRemark4 = projectRemark4;
	}
	@Override
	public String toString() {
		return "SolarProjectPublishBean [projectName=" + projectName + ", projectBenefit=" + projectBenefit
				+ ", projectIntro=" + projectIntro + ", projectStaMess=" + projectStaMess + ", rentRights=" + rentRights
				+ ", rentTraceMess=" + rentTraceMess + ", rentOperateMess=" + rentOperateMess + ", projectRemark1="
				+ projectRemark1 + ", projectRemark2=" + projectRemark2 + ", projectRemark3=" + projectRemark3
				+ ", projectRemark4=" + projectRemark4 + "]";
	}
	
}
