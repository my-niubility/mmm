package com.nbl.services.customer;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.customer.CustBankBean;

/**
 * @author gcs
 * @createdate 2016年7月12日
 * @version 1.0
 * @description 客户银行卡接口管理
 * 
 */
public interface CustBankService {
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<CustBankBean> pageListQueryCustBankCard(PageVO<CustBankBean> pageVO, CustBankBean cb);

	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryCustBank(CustBankBean cb);

	/**
	 * @param id
	 * @return obj
	 * @description: 根据ID查询银行卡信息
	 */
	public CustBankBean custBankDetail(String id);
}
