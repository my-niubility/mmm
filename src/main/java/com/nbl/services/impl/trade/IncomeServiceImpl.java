package com.nbl.services.impl.trade;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.trade.IncomeBean;
import com.nbl.service.manager.app.IncomeApp;
import com.nbl.service.manager.dto.IncomeDto;
import com.nbl.services.trade.IncomeService;
@Service("incomeService")
public class IncomeServiceImpl implements IncomeService {
	
	private static final Logger logger = LoggerFactory.getLogger(TradeOrderServiceImpl.class);
	
	@Resource
	private IncomeApp incomeApp;
	
	@Override
	public List<IncomeBean> pageListQueryIncome(PageVO<IncomeBean> pageVO, IncomeBean cb) {
		IncomeDto reqDto = new IncomeDto();
		PageVO<IncomeDto> pgVO = new PageVO<IncomeDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<IncomeDto> reqDtoList = incomeApp.pageListQueryIncome(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<IncomeDto>.size---------:{}",reqDtoList.size());
			List<IncomeBean> retList = new ArrayList<IncomeBean>();
			for (IncomeDto dto : reqDtoList) {
				IncomeBean perBean = new IncomeBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<IncomeBean>.id--------",dto.getId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryIncome(IncomeBean cb) {
		IncomeDto reqDto = new IncomeDto();
		BeanUtils.copyProperties(cb, reqDto);
		return incomeApp.pageCountQueryIncome(reqDto);
	}

	@Override
	public IncomeBean incomeDetail(String id) {
		IncomeDto reqDto = incomeApp.incomeDetail(id);
		IncomeBean retBean = new IncomeBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}

	

}
