package com.nbl.jspbean.task;
/**
 * @author gcs
 * @createdate 2016年7月29日	
 * @version 1.0
 * 对应工作日期表的实体类
 */

public class TDayBean {
	
	private String day;

    private Short festivalFlag;

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day == null ? null : day.trim();
    }

    public Short getFestivalFlag() {
        return festivalFlag;
    }

    public void setFestivalFlag(Short festivalFlag) {
        this.festivalFlag = festivalFlag;
    }

	@Override
	public String toString() {
		return "TDayBean [day=" + day + ", festivalFlag=" + festivalFlag + "]";
	}
    
    
}
