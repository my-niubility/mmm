package com.nbl.services.impl.withdraw;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.exception.MyBusinessCheckException;
import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.withdraw.WithdrawBean;
import com.nbl.service.manager.app.NewWithdrawApp;
import com.nbl.service.manager.dto.WithdrawReqDto;
import com.nbl.services.impl.trade.TradeOrderServiceImpl;
import com.nbl.services.withdraw.WithdrawService;

@Service("withdrawService")
public class WithdrawServiceImpl implements WithdrawService {
	
	private static final Logger logger = LoggerFactory.getLogger(TradeOrderServiceImpl.class);
	
	@Resource
	private NewWithdrawApp newWithdrawApp;
	
	@Override
	public List<WithdrawBean> pageListQueryWithdraw(PageVO<WithdrawBean> pageVO, WithdrawBean cb) {
		WithdrawReqDto reqDto = new WithdrawReqDto();
		PageVO<WithdrawReqDto> pgVO = new PageVO<WithdrawReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<WithdrawReqDto> reqDtoList = newWithdrawApp.pageListQueryWithdraw(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<WithdrawReqDto>.size---------:{}",reqDtoList.size());
			List<WithdrawBean> retList = new ArrayList<WithdrawBean>();
			for (WithdrawReqDto dto : reqDtoList) {
				WithdrawBean perBean = new WithdrawBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<WithdrawBean>.id--------",dto.getId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryWithdraw(WithdrawBean cb) {
		WithdrawReqDto reqDto = new WithdrawReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return newWithdrawApp.pageCountQueryWithdraw(reqDto);
	}

	@Override
	public WithdrawBean WithdrawDetail(String id) {
		WithdrawReqDto reqDto = newWithdrawApp.withdrawDetail(id);
		WithdrawBean retBean = new WithdrawBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}
	

	
	
}
