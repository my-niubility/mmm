package com.nbl.services.product;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.product.PositionBean;

/**
 * @author gcs
 * @createdate 2016年7月22日
 * @version 1.0
 * @description  冲正流水管理接口
 * 
 * */
public interface PositionService {
	
	/**
	 * @param pageVO
	 * @param reqDto
	 * @return
	 * @description:分页查询
	 */
	public List<PositionBean> pageListQueryPosition(PageVO<PositionBean> pageVO,PositionBean reqDto);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryPosition(PositionBean cb);
	
	/**
	 * @param id
	 * @return obj
	 * @description: 根据充值订单ID来查询订单明细
	 */
	public PositionBean positionDetail(String id);
}
