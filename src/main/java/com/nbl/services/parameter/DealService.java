package com.nbl.services.parameter;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.DealTypeBean;

/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 业务场景步骤查询接口
 */

public interface DealService {

	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<DealTypeBean> pageListQueryDeal(PageVO<DealTypeBean> pageVO,DealTypeBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryDeal(DealTypeBean cb);
	
}
