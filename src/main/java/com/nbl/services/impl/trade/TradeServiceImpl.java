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
import com.nbl.jspbean.trade.PositionBean;
import com.nbl.jspbean.trade.PrdRepTrmBean;
import com.nbl.jspbean.trade.RefundBean;
import com.nbl.service.manager.app.TradeProcessApp;
import com.nbl.service.manager.dto.IncomeDto;
import com.nbl.service.manager.dto.PositionDto;
import com.nbl.service.manager.dto.PrdRepTrmDto;
import com.nbl.service.manager.dto.PrdRepTrmRespDto;
import com.nbl.service.manager.dto.RefundDto;
import com.nbl.services.trade.TradeService;

@Service("tradeService")
public class TradeServiceImpl implements TradeService {

	private final static Logger logger = LoggerFactory.getLogger(TradeServiceImpl.class);

	@Resource
	private TradeProcessApp tradeProcessApp;

	@Override
	public List<PrdRepTrmBean> queryPrdRepTrm(PageVO<PrdRepTrmBean> pageVO, PrdRepTrmBean prtb) {
		PrdRepTrmDto prtd = new PrdRepTrmDto();
		PageVO<PrdRepTrmDto> newPageVO = new PageVO<PrdRepTrmDto>();
		BeanUtils.copyProperties(prtb, prtd);
		BeanUtils.copyProperties(pageVO, newPageVO);
		List<PrdRepTrmRespDto> newprtds = tradeProcessApp.queryPrdRepTrm(newPageVO, prtd);
		List<PrdRepTrmBean> retList = null;
		if (newprtds != null && newprtds.size() > 0) {
			logger.info("---------List<PrdRepTrmDto>.size---------:{}", newprtds.size());
			retList = new ArrayList<PrdRepTrmBean>();

			for (PrdRepTrmRespDto newprtd : newprtds) {
				PrdRepTrmBean retPrtb = new PrdRepTrmBean();
				BeanUtils.copyProperties(newprtd, retPrtb);
				retPrtb.setIsFinishResult(newprtd.getIsFinish());
				retList.add(retPrtb);
			}
		}
		return retList;
	}

	@Override
	public int queryPrdRepTrmCount(PrdRepTrmBean prtb) {
		PrdRepTrmDto prtd = new PrdRepTrmDto();
		BeanUtils.copyProperties(prtb, prtd);
		int count = tradeProcessApp.queryPrdRepTrmCount(prtd);
		return count;
	}

	@Override
	public PrdRepTrmBean queryPrdRepTrmDetail(String id) {
		PrdRepTrmRespDto prtd = tradeProcessApp.queryPrdRepTrmDetail(id);
		PrdRepTrmBean prtb = new PrdRepTrmBean();
		BeanUtils.copyProperties(prtd, prtb);
		prtb.setIsFinishResult(prtd.getIsFinish());
		return prtb;
	}

	@Override
	public String getInvestorNum(IncomeBean prtb) {
		IncomeDto reqDto = new IncomeDto();
		BeanUtils.copyProperties(prtb, reqDto);
		return tradeProcessApp.queryInvestorInfoCount(reqDto);
	}

	@Override
	public List<IncomeBean> queryInvestorInfo(PageVO<IncomeBean> pageVO, IncomeBean prtb) {

		IncomeDto reqDto = new IncomeDto();
		BeanUtils.copyProperties(prtb, reqDto);
		PageVO<IncomeDto> newPageVO = new PageVO<IncomeDto>();
		BeanUtils.copyProperties(pageVO, newPageVO);

		List<IncomeDto> respDtos = tradeProcessApp.queryInvestorInfo(newPageVO, reqDto);

		List<IncomeBean> retList = null;
		if (respDtos != null && respDtos.size() > 0) {
			logger.info("---------List<PrdRepTrmDto>.size---------:{}", respDtos.size());
			retList = new ArrayList<IncomeBean>();

			for (IncomeDto respDto : respDtos) {
				IncomeBean retPrtb = new IncomeBean();
				BeanUtils.copyProperties(respDto, retPrtb);
				retList.add(retPrtb);
			}
		}
		return retList;
	}

	@Override
	public List<RefundBean> queryRefundInfo(PageVO<RefundBean> pageVO, RefundBean prtb) {
		RefundDto prtd = new RefundDto();
		PageVO<RefundDto> newPageVO = new PageVO<RefundDto>();
		BeanUtils.copyProperties(prtb, prtd);
		BeanUtils.copyProperties(pageVO, newPageVO);
		List<RefundDto> newprtds = tradeProcessApp.queryRefundInfo(newPageVO, prtd);
		List<RefundBean> retList = null;
		if (newprtds != null && newprtds.size() > 0) {
			logger.info("---------List<PrdRepTrmDto>.size---------:{}", newprtds.size());
			retList = new ArrayList<RefundBean>();

			for (RefundDto newprtd : newprtds) {
				RefundBean retPrtb = new RefundBean();
				BeanUtils.copyProperties(newprtd, retPrtb);
				retList.add(retPrtb);
			}
		}
		return retList;
	}

	@Override
	public int queryRefundInfoCount(RefundBean rb) {
		RefundDto prtd = new RefundDto();
		BeanUtils.copyProperties(rb, prtd);
		int count = tradeProcessApp.queryRefundInfoCount(prtd);
		return count;
	}

	@Override
	public RefundBean queryRefundDetail(String productId) {
		RefundDto prtd = tradeProcessApp.queryRefundDetail(productId);
		RefundBean prtb = new RefundBean();
		BeanUtils.copyProperties(prtd, prtb);
		return prtb;
	}

	@Override
	public List<PositionBean> queryInvestorInfo(PageVO<PositionBean> pageVO, PositionBean pb) {

		PositionDto reqDto = new PositionDto();
		BeanUtils.copyProperties(pb, reqDto);
		PageVO<PositionDto> newPageVO = new PageVO<PositionDto>();
		BeanUtils.copyProperties(pageVO, newPageVO);

		List<PositionDto> respDtos = tradeProcessApp.queryInvestorInfo(newPageVO, reqDto);

		List<PositionBean> retList = null;
		if (respDtos != null && respDtos.size() > 0) {
			logger.info("---------List<PrdRepTrmDto>.size---------:{}", respDtos.size());
			retList = new ArrayList<PositionBean>();

			for (PositionDto respDto : respDtos) {
				PositionBean retPrtb = new PositionBean();
				BeanUtils.copyProperties(respDto, retPrtb);
				retList.add(retPrtb);
			}
		}
		return retList;
	}

	@Override
	public int queryInvestorInfoCount(PositionBean pb) {
		PositionDto reqDto = new PositionDto();
		BeanUtils.copyProperties(pb, reqDto);
		return tradeProcessApp.queryInvestorInfoCount(reqDto);
	}

	@Override
	public boolean repayUpdate(String productId, String id) {
		return tradeProcessApp.repayUpdate(productId,id);
	}

}
