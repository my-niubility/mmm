package com.nbl.services.parameter;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.BankTypeBean;

/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 银行卡对应的接口层
 */

public interface BankTypeService {
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<BankTypeBean> pageListQueryBankType(PageVO<BankTypeBean> pageVO,BankTypeBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryBankType(BankTypeBean cb);
}
