package com.nbl.services.customer;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.customer.CustEnterpriseBean;
	/**
	 * @author gcs
	 * @createdate 2016-07-14
	 * @description 企业客户管理接口
	 * 
	 * */
public interface CustEnterpriseService {
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<CustEnterpriseBean> pageListQueryEnterprise(PageVO<CustEnterpriseBean> pageVO,CustEnterpriseBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryEnterprise(CustEnterpriseBean cb);
	
	/**
	 * @param name
	 * @return
	 * @description:登录账户明细查询
	 */
	public CustEnterpriseBean detailQueryEnterprise(String name);
	
	/**
	 * @param name  企业名称
	 * @return
	 * @description:账户是否存在检查
	 */
	public boolean enterpriseCheckQuery(String name);
	
	/**
	 * @param cb
	 * @return
	 * @description:账户增加
	 */
	public boolean enterpriseAdd(CustEnterpriseBean cb);
}
