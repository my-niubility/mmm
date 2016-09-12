package com.nbl.services.portion;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.portion.AccountReverseBean;

/**
 * @author gcs
 * @createdate 2016年7月21日
 * @version 1.0
 * @description  冲正流水管理接口
 * 
 * */
public interface PositiveService {

	/**
	 * @param pageVO
	 * @param reqDto
	 * @return
	 * @description:分页查询
	 */
	public List<AccountReverseBean> pageListQueryPositive(PageVO<AccountReverseBean> pageVO,AccountReverseBean reqDto);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryPositive(AccountReverseBean cb);
	
	/**
	 * @param reverseId
	 * @return obj
	 * @description: 根据充值订单ID来查询订单明细
	 */
	public AccountReverseBean positiveDetail(Integer reverseId);
}
