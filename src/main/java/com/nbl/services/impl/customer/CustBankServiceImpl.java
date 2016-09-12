package com.nbl.services.impl.customer;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.customer.CustBankBean;
import com.nbl.service.manager.app.CustBankApp;
import com.nbl.service.manager.dto.CustBankReqDto;
import com.nbl.services.customer.CustBankService;

@Service("custBankService")
public class CustBankServiceImpl implements CustBankService {
	private static final Logger logger = LoggerFactory.getLogger(CustBankServiceImpl.class);
 	@Resource
	private CustBankApp custBankApp;
	
	@Override
	public List<CustBankBean> pageListQueryCustBankCard(PageVO<CustBankBean> pageVO, CustBankBean cb) {
		CustBankReqDto reqDto = new CustBankReqDto();
		PageVO<CustBankReqDto> pgVO = new PageVO<CustBankReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<CustBankReqDto> reqDtoList = custBankApp.pageListQueryCustBankCard(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<CustBankReqDto>.size---------:{}",reqDtoList.size());
			List<CustBankBean> retList = new ArrayList<CustBankBean>();
			for (CustBankReqDto dto : reqDtoList) {
				CustBankBean perBean = new CustBankBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<CustBankBean>.custId--------",dto.getCustId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryCustBank(CustBankBean cb) {
		CustBankReqDto reqDto = new CustBankReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return custBankApp.pageCountQueryCustBank(reqDto);
	}

	@Override
	public CustBankBean custBankDetail(String id) {
		CustBankReqDto reqDto = custBankApp.custBankDetail(id);
		CustBankBean retBean = new CustBankBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}

}
