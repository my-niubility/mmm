package com.nbl.services.trade;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.trade.IncomeBean;
import com.nbl.jspbean.trade.PositionBean;
import com.nbl.jspbean.trade.PrdRepTrmBean;
import com.nbl.jspbean.trade.RefundBean;

/**
 * @author Donald
 * @createdate 2016年5月6日
 * @version 1.0
 * @description :交易业务相关接口
 */
public interface TradeService {

	public List<PrdRepTrmBean> queryPrdRepTrm(PageVO<PrdRepTrmBean> pageVO, PrdRepTrmBean prtb);

	public int queryPrdRepTrmCount(PrdRepTrmBean prtb);

	public PrdRepTrmBean queryPrdRepTrmDetail(String id);

	public String getInvestorNum(IncomeBean prtb);

	public List<IncomeBean> queryInvestorInfo(PageVO<IncomeBean> pageVO, IncomeBean prtb);

	public List<RefundBean> queryRefundInfo(PageVO<RefundBean> pageVO, RefundBean prtb);

	public int queryRefundInfoCount(RefundBean rb);

	public RefundBean queryRefundDetail(String productId);

	public List<PositionBean> queryInvestorInfo(PageVO<PositionBean> pageVO, PositionBean pb);

	public int queryInvestorInfoCount(PositionBean pb);
	
	/**
	 * @param productId 
	 * @param id
	 * 还款更新所有数据状态
	 * */
	public boolean repayUpdate(String productId,String id);

}
