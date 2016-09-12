package com.nbl.services.payment;
/**
 * @author gcs
 * @createdate 2016年8月10日	
 * @version 1.0
 * 支付订单管理接口
 */

public interface PaymentService {
	
	/**
	 * @param cub
	 * 根据登录用户custId来查询用户实名个数
	 * 
	 * */
	public int queryCountPayment();
	
	/**
	 * @param cub
	 * 根据登录用户custId来查询用户未实名个数
	 * 
	 * */
	public int queryNoCountPayment();
	/**
	 * @param cub
	 * 根据登录用户custId来查询用户上月实名个数
	 * 
	 * */
	public int queryLastMonthCount();
	
	/**
	 * @param cub
	 * 根据登录用户custId来查询用户上月未实名个数
	 * 
	 * */
	public int queryNoLastMonthCount();
	/**
	 * @param cub
	 * 根据登录用户custId来查询本月用户实名个数
	 * 
	 * */
	public int queryMonthCount();
	
	/**
	 * @param cub
	 * 根据登录用户custId来查询本月用户未实名个数
	 * 
	 * */
	public int queryNoMonthCount();
	/**
	 * @param cub
	 * 根据登录用户custId来查询本周用户实名个数
	 * 
	 * */
	public int queryWeekCount();
	
	/**
	 * @param cub
	 * 根据登录用户custId来查询本周用户未实名个数
	 * 
	 * */
	public int queryNoWeekCount();
}
