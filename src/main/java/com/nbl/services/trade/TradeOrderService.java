package com.nbl.services.trade;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.trade.TradeOrderBean;

/**
 * @author gcs
 * @createdate 2016年7月19日
 * @version 1.0
 * @description  交易订单管理接口
 * 
 * */

public interface TradeOrderService {
	
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<TradeOrderBean> pageListQueryTradeOrder(PageVO<TradeOrderBean> pageVO,TradeOrderBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryTradeOrder(TradeOrderBean cb);
	
	/**
	 * @param id
	 * @return obj
	 * @description: 根据交易订单ID来查询订单明细
	 */
	public TradeOrderBean tradeOrderDetail(String id);
}
