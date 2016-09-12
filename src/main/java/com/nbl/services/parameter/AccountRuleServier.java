package com.nbl.services.parameter;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.AccountRuleBean;

/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 记账规则管理接口
 */

public interface AccountRuleServier {
	
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<AccountRuleBean> pageListQueryAccRule(PageVO<AccountRuleBean> pageVO,AccountRuleBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryAccRule(AccountRuleBean cb);
}
