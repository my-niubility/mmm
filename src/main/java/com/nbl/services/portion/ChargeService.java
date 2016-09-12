package com.nbl.services.portion;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.portion.ChargeBean;

/**
 * @author Donald
 * @createdate 2016年5月6日
 * @version 1.0 
 * @description :份额记账流水查询接口
 */
public interface ChargeService {
	
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<ChargeBean> pageListQueryCharge(PageVO<ChargeBean> pageVO,ChargeBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryCharge(ChargeBean cb);
	
	/**
	 * @param chargeId
	 * @return
	 * @description:记账流水明细查询
	 */
	public ChargeBean detailQueryCharge(String chargeId);
}
