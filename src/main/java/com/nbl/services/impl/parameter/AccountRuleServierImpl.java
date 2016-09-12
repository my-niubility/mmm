package com.nbl.services.impl.parameter;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.AccountRuleBean;
import com.nbl.service.manager.app.AccountRuleApp;
import com.nbl.service.manager.dto.AccountRuleDto;
import com.nbl.services.impl.task.BillBalanceServiceImpl;
import com.nbl.services.parameter.AccountRuleServier;
/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 实现对应manager层的接口
 */

@Service("accountRuleServier")
public class AccountRuleServierImpl implements AccountRuleServier {
	
	private static final Logger logger = LoggerFactory.getLogger(BillBalanceServiceImpl.class);
	
	@Resource
	private AccountRuleApp accountRuleApp;
	
	/* (non-Javadoc)
	 * @see com.zlebank.services.parameter.AccountRuleServier#pageListQueryAccRule(com.zlebank.common.vo.PageVO, com.zlebank.jspbean.parameter.AccountRuleBean)
	 */
	@Override
	public List<AccountRuleBean> pageListQueryAccRule(PageVO<AccountRuleBean> pageVO, AccountRuleBean cb) {
		AccountRuleDto reqDto = new AccountRuleDto();
		PageVO<AccountRuleDto> pgVO = new PageVO<AccountRuleDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<AccountRuleDto> reqDtoList = accountRuleApp.pageListQueryAccRule(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<AccountRuleDto>.size---------:{}",reqDtoList.size());
			List<AccountRuleBean> retList = new ArrayList<AccountRuleBean>();
			for (AccountRuleDto dto : reqDtoList) {
				AccountRuleBean perBean = new AccountRuleBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<AccountRuleBean>.ruleId--------",dto.getRuleId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	/* (non-Javadoc)
	 * @see com.zlebank.services.parameter.AccountRuleServier#pageCountQueryAccRule(com.zlebank.jspbean.parameter.AccountRuleBean)
	 */
	@Override
	public int pageCountQueryAccRule(AccountRuleBean cb) {
		AccountRuleDto reqDto = new AccountRuleDto();
		BeanUtils.copyProperties(cb, reqDto);
		return accountRuleApp.pageCountQueryAccRule(reqDto);
	}

}
