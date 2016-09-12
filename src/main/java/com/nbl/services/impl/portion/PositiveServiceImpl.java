package com.nbl.services.impl.portion;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.portion.AccountReverseBean;
import com.nbl.service.manager.app.PositiveApp;
import com.nbl.service.manager.dto.AccountReverseDto;
import com.nbl.services.impl.trade.TradeOrderServiceImpl;
import com.nbl.services.portion.PositiveService;

@Service("positiveService")
public class PositiveServiceImpl implements PositiveService {
	
	private static final Logger logger = LoggerFactory.getLogger(TradeOrderServiceImpl.class);
	
	@Resource
	private PositiveApp positiveApp;
	
	@Override
	public List<AccountReverseBean> pageListQueryPositive(PageVO<AccountReverseBean> pageVO,
			AccountReverseBean cb) {
			AccountReverseDto reqDto = new AccountReverseDto();
			PageVO<AccountReverseDto> pgVO = new PageVO<AccountReverseDto>();
			BeanUtils.copyProperties(pageVO, pgVO);
			BeanUtils.copyProperties(cb, reqDto);
			List<AccountReverseDto> reqDtoList = positiveApp.pageListQueryPositive(pgVO, reqDto);
			if(reqDtoList !=null && reqDtoList.size()>0){
				logger.info("---------List<AccountReverseDto>.size---------:{}",reqDtoList.size());
				List<AccountReverseBean> retList = new ArrayList<AccountReverseBean>();
				for (AccountReverseDto dto : reqDtoList) {
					AccountReverseBean perBean = new AccountReverseBean();
					BeanUtils.copyProperties(dto, perBean);
					logger.info("--------List<AccountReverseBean>.reverseId--------",dto.getReverseId());
					retList.add(perBean);
				}
				return retList;
			}else {
				return null;
			}
	}

	@Override
	public int pageCountQueryPositive(AccountReverseBean cb) {
		AccountReverseDto reqDto = new AccountReverseDto();
		BeanUtils.copyProperties(cb, reqDto);
		return positiveApp.pageCountQueryPositive(reqDto);
	}

	@Override
	public AccountReverseBean positiveDetail(Integer reverseId) {
		AccountReverseDto reqDto = positiveApp.positiveDetail(reverseId);
		AccountReverseBean retBean = new AccountReverseBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}

}
