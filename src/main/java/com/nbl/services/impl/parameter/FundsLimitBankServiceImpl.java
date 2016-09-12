/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 
 */
package com.nbl.services.impl.parameter;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.FundsLimitBankBean;
import com.nbl.service.manager.app.FundsLimitBankApp;
import com.nbl.service.manager.dto.FundsLimitBankDto;
import com.nbl.services.parameter.FundsLimitBankService;

@Service("fundsLimitBankService")
public class FundsLimitBankServiceImpl implements FundsLimitBankService {
	
	private static final Logger logger = LoggerFactory.getLogger(FundsLimitBankServiceImpl.class);
	@Resource
	private FundsLimitBankApp fundsLimitBankApp;
	
	@Override
	public List<FundsLimitBankBean> pageListQueryFundsLimit(PageVO<FundsLimitBankBean> pageVO, FundsLimitBankBean cb) {
		FundsLimitBankDto reqDto = new FundsLimitBankDto();
		PageVO<FundsLimitBankDto> pgVO = new PageVO<FundsLimitBankDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<FundsLimitBankDto> reqDtoList = fundsLimitBankApp.pageListQueryFundsLimit(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<FundsLimitBankDto>.size---------:{}",reqDtoList.size());
			List<FundsLimitBankBean> retList = new ArrayList<FundsLimitBankBean>();
			for (FundsLimitBankDto dto : reqDtoList) {
				FundsLimitBankBean perBean = new FundsLimitBankBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<FundsLimitBankBean>.bankId--------",dto.getBankId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryFundsLimit(FundsLimitBankBean cb) {
		FundsLimitBankDto reqDto = new FundsLimitBankDto();
		BeanUtils.copyProperties(cb, reqDto);
		return fundsLimitBankApp.pageCountQueryFundsLimit(reqDto);
	}

}
