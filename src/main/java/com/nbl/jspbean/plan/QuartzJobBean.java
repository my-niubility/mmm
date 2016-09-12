package com.nbl.jspbean.plan;

public class QuartzJobBean {
	
	private String jName;
	
	private String jGroup;
	
	private String cron;
	
	private String tName;
	
	private String tGroup;
	
	private String currStatus;
	
	private String preTime;
	
	private String nextTime;
	
	private String startTime;
	
	private String endTime;

	public String getjName() {
		return jName;
	}

	public void setjName(String jName) {
		this.jName = jName;
	}

	public String getjGroup() {
		return jGroup;
	}

	public void setjGroup(String jGroup) {
		this.jGroup = jGroup;
	}

	public String getCron() {
		return cron;
	}

	public void setCron(String cron) {
		this.cron = cron;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String gettGroup() {
		return tGroup;
	}

	public void settGroup(String tGroup) {
		this.tGroup = tGroup;
	}

	public String getCurrStatus() {
		return currStatus;
	}

	public void setCurrStatus(String currStatus) {
		this.currStatus = currStatus;
	}

	public String getPreTime() {
		return preTime;
	}

	public void setPreTime(String preTime) {
		this.preTime = preTime;
	}

	public String getNextTime() {
		return nextTime;
	}

	public void setNextTime(String nextTime) {
		this.nextTime = nextTime;
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

}
