package com.nbl.services.customer;



/**
 * @author gcs
 * @createdate 2016年8月8日	
 * @version 1.0
 * 登录帐户接口管理
 */
public interface CustUserService {
	/**
	 * 根据登录用户custId来查询用户实名个数
	 * 
	 * */
	public int queryCountCustUser();
	
	/**
	 * 根据登录用户custId来查询用户未实名个数
	 * 
	 * */
	public int queryNoCountCustUser();
	/**
	 * 根据登录用户custId来查询上月用户实名个数
	 * 
	 * */
	public int queryLastMonthCount();
	
	/**
	 * 根据登录用户custId来查询上月用户未实名个数
	 * 
	 * */
	public int queryNoLastMonthCount();
	/**
	 * 根据登录用户custId来查询本月用户实名个数
	 * 
	 * */
	public int queryMonthCount();
	
	/**
	 * 根据登录用户custId来查询本月用户未实名个数
	 * 
	 * */
	public int queryNoMonthCount();
	/**
	 * 根据登录用户custId来查询上周用户实名个数
	 * 
	 * */
	public int queryWeekCount();
	
	/**
	 * 根据登录用户custId来查询上周用户未实名个数
	 * 
	 * */
	public int queryNoWeekCount();
}
