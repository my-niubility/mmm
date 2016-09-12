package com.nbl.services.risk;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.risk.RiskBlackWhiteBean;

/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 风控黑白名单
 */

public interface RiskBlackWhiteService {
	
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<RiskBlackWhiteBean> pageListQueryBlackWhite(PageVO<RiskBlackWhiteBean> pageVO,RiskBlackWhiteBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryBlackWhite(RiskBlackWhiteBean cb);
}
