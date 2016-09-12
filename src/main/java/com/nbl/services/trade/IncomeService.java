package com.nbl.services.trade;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.trade.IncomeBean;

/**
 * @author gcs
 * @createdate 2016年7月22日
 * @version 1.0
 * @description  投资利息管理接口
 * 
 * */

public interface IncomeService {
	/**
	 * @param pageVO
	 * @param reqDto
	 * @return
	 * @description:分页查询
	 */
	public List<IncomeBean> pageListQueryIncome(PageVO<IncomeBean> pageVO,IncomeBean reqDto);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryIncome(IncomeBean cb);
	
	/**
	 * @param id
	 * @return obj
	 * @description: 根据流水ID来查询明细
	 */
	public IncomeBean incomeDetail(String id);
}
