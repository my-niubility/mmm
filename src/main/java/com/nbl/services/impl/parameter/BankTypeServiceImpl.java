package com.nbl.services.impl.parameter;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.BankTypeBean;
import com.nbl.service.manager.app.BankTypeApp;
import com.nbl.service.manager.dto.BankTypeDto;
import com.nbl.services.parameter.BankTypeService;
/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 实现对应的银行类别接口
 */
@Service("bankTypeService")
public class BankTypeServiceImpl implements BankTypeService {
	
	private static final Logger logger = LoggerFactory.getLogger(BankTypeServiceImpl.class);
	
	@Resource
	private BankTypeApp bankTypeApp;
	
	@Override
	public List<BankTypeBean> pageListQueryBankType(PageVO<BankTypeBean> pageVO, BankTypeBean cb) {
		BankTypeDto reqDto = new BankTypeDto();
		PageVO<BankTypeDto> pgVO = new PageVO<BankTypeDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<BankTypeDto> reqDtoList = bankTypeApp.pageListQueryBankType(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<BankTypeDto>.size---------:{}",reqDtoList.size());
			List<BankTypeBean> retList = new ArrayList<BankTypeBean>();
			for (BankTypeDto dto : reqDtoList) {
				BankTypeBean perBean = new BankTypeBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<BankTypeBean>.bankName--------",dto.getBankName());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryBankType(BankTypeBean cb) {
		BankTypeDto reqDto = new BankTypeDto();
		BeanUtils.copyProperties(cb, reqDto);
		return bankTypeApp.pageCountQueryBankType(reqDto);
	}

}
