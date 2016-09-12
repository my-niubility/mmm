package com.nbl.services.impl.recharge;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.recharge.RechargeBean;
import com.nbl.service.manager.app.NewRechargeApp;
import com.nbl.service.manager.dto.RechargeReqDto;
import com.nbl.services.impl.trade.TradeOrderServiceImpl;
import com.nbl.services.recharge.RechargeService;

@Service("rechargeService")
public class RechargeServiceImpl implements RechargeService {
	
	private static final Logger logger = LoggerFactory.getLogger(TradeOrderServiceImpl.class);
	
	@Resource
	private NewRechargeApp newRechargeApp;
	
	@Override
	public List<RechargeBean> pageListQueryRecharge(PageVO<RechargeBean> pageVO, RechargeBean cb) {
		RechargeReqDto reqDto = new RechargeReqDto();
		PageVO<RechargeReqDto> pgVO = new PageVO<RechargeReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<RechargeReqDto> reqDtoList = newRechargeApp.pageListQueryRecharge(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<RechargeReqDto>.size---------:{}",reqDtoList.size());
			List<RechargeBean> retList = new ArrayList<RechargeBean>();
			for (RechargeReqDto dto : reqDtoList) {
				RechargeBean perBean = new RechargeBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<RechargeBean>.id--------",dto.getId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryRecharge(RechargeBean cb) {
		RechargeReqDto reqDto = new RechargeReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return newRechargeApp.pageCountQueryRecharge(reqDto);
	}

	@Override
	public RechargeBean rechargeDetail(String id) {
		RechargeReqDto reqDto = newRechargeApp.rechargeDetail(id);
		RechargeBean retBean = new RechargeBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}

}
