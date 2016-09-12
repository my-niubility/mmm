package com.nbl.services.recharge;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.recharge.RechargeBean;

/**
 * @author gcs
 * @createdate 2016年7月20日
 * @version 1.0
 * @description  充值订单管理接口
 * 
 * */
public interface RechargeService {
	/**
	 * @param pageVO
	 * @param reqDto
	 * @return
	 * @description:分页查询
	 */
	public List<RechargeBean> pageListQueryRecharge(PageVO<RechargeBean> pageVO,RechargeBean reqDto);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryRecharge(RechargeBean cb);
	
	/**
	 * @param id
	 * @return obj
	 * @description: 根据充值订单ID来查询订单明细
	 */
	public RechargeBean rechargeDetail(String id);
}
