package com.nbl.services.withdraw;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.withdraw.WithdrawBean;
/**
 * @author gcs
 * @createdate 2016年7月20日
 * @version 1.0
 * @description  提现订单管理接口
 * 
 * */
public interface WithdrawService {
	/**
	 * @param pageVO
	 * @param reqDto
	 * @return
	 * @description:分页查询
	 */
	public List<WithdrawBean> pageListQueryWithdraw(PageVO<WithdrawBean> pageVO,WithdrawBean reqDto);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryWithdraw(WithdrawBean cb);
	
	/**
	 * @param id
	 * @return obj
	 * @description: 根据充值订单ID来查询订单明细
	 */
	public WithdrawBean WithdrawDetail(String id);
}
