package com.nbl.services.task;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.task.BillBalanceBean;

/**
 * @author gcs
 * @createdate 2016年7月25日	
 * @version 1.0
 * 试算平衡管理接口
 */
public interface BillBalanceService {
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<BillBalanceBean> pageListQueryBalance(PageVO<BillBalanceBean> pageVO,BillBalanceBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryBalance(BillBalanceBean cb);
	
	/**
	 * @param id
	 * @return obj
	 * @description: 根据交易订单ID来查询订单明细
	 */
	public BillBalanceBean BalanceDetail(Integer id);
}
