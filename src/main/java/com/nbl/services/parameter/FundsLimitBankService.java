package com.nbl.services.parameter;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.FundsLimitBankBean;

/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 银行资金限额接口管理 
 */

public interface FundsLimitBankService {
	
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<FundsLimitBankBean> pageListQueryFundsLimit(PageVO<FundsLimitBankBean> pageVO,FundsLimitBankBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryFundsLimit(FundsLimitBankBean cb);
}
