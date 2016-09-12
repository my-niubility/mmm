package com.nbl.services.impl.trade;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.trade.TradeOrderBean;
import com.nbl.service.manager.app.TradeOrderApp;
import com.nbl.service.manager.dto.TradeOrderReqDto;
import com.nbl.services.trade.TradeOrderService;

@Service("tradeOrderService")
public class TradeOrderServiceImpl implements TradeOrderService {
	
	private static final Logger logger = LoggerFactory.getLogger(TradeOrderServiceImpl.class);
	
	@Resource
	private TradeOrderApp tradeOrderApp;
	
	@Override
	public List<TradeOrderBean> pageListQueryTradeOrder(PageVO<TradeOrderBean> pageVO, TradeOrderBean cb) {
		TradeOrderReqDto reqDto = new TradeOrderReqDto();
		PageVO<TradeOrderReqDto> pgVO = new PageVO<TradeOrderReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<TradeOrderReqDto> reqDtoList = tradeOrderApp.pageListQueryTradeOrder(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<TradeOrderReqDto>.size---------:{}",reqDtoList.size());
			List<TradeOrderBean> retList = new ArrayList<TradeOrderBean>();
			for (TradeOrderReqDto dto : reqDtoList) {
				TradeOrderBean perBean = new TradeOrderBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<TradeOrderBean>.id--------",dto.getId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryTradeOrder(TradeOrderBean cb) {
		TradeOrderReqDto reqDto = new TradeOrderReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return tradeOrderApp.pageCountQueryTradeOrder(reqDto);
	}

	@Override
	public TradeOrderBean tradeOrderDetail(String id) {
		TradeOrderReqDto reqDto = tradeOrderApp.tradeOrderDetail(id);
		TradeOrderBean retBean = new TradeOrderBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}

}
