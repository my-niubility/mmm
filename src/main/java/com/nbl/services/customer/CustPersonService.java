package com.nbl.services.customer;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.customer.CustPersonBean;
import com.nbl.jspbean.customer.PersonAndUserBean;

/**
 * @author gcs
 * @createdate 2016年7月8日
 * @version 1.0
 * @description  客户管理接口
 * 
 * */
public interface CustPersonService {
	
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<PersonAndUserBean> pageListQueryCustPerson(PageVO<PersonAndUserBean> pageVO,PersonAndUserBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:查询所有客户Id
	 */
	public List<CustPersonBean> listQueryCustPersonId();
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryCustPerson(PersonAndUserBean cb);
	
	/**
	 * @param identityCardNumber
	 * @return obj
	 * @description: 根据身份证号查询个人客户明细
	 */
	public PersonAndUserBean custPersonDetail(String identityCardNumber);
	
	/**
	 * 统计所有渠道个数
	 * */
	public List<CustPersonBean> listCount();
	/**
	 * 统计上月所有渠道个数
	 * */
	public List<CustPersonBean> listLastMonthCount();
	/**
	 * 统计本月所有渠道个数
	 * */
	public List<CustPersonBean> listMonthCount();
	/**
	 * 统计本周所有渠道个数
	 * */
	public List<CustPersonBean> listWeekCount();
	
	/**
	 * 统计所有省份注册人数
	 * */
	public List<CustPersonBean> listAreaCount();
	/**
	 * 统计上月所有省份注册人数
	 * */
	public List<CustPersonBean> listLastMonthAreaCount();
	/**
	 * 统计本月所有省份注册人数
	 * */
	public List<CustPersonBean> listMonthAreaCount();
	/**
	 * 统计本周所有省份注册人数
	 * */
	public List<CustPersonBean> listWeekAreaCount();
}
