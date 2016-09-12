package com.nbl.services.impl.customer;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.customer.CustEnterpriseBean;
import com.nbl.service.manager.app.CustEnterpriseApp;
import com.nbl.service.manager.dto.CustEnterpriReqDto;
import com.nbl.services.customer.CustEnterpriseService;
@Service("enterpriseService")
public class CustEnterpriseServiceImpl implements CustEnterpriseService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustEnterpriseServiceImpl.class);
	
	@Resource
	private CustEnterpriseApp custEnterpriseApp;
	
	@Override
	public List<CustEnterpriseBean> pageListQueryEnterprise(PageVO<CustEnterpriseBean> pageVO, CustEnterpriseBean cb) {
		CustEnterpriReqDto reqDto = new CustEnterpriReqDto();
		PageVO<CustEnterpriReqDto> pgVO = new PageVO<CustEnterpriReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<CustEnterpriReqDto> reqDtoList = custEnterpriseApp.pageListQueryEnterprise(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<CustEnterpriReqDto>.size---------:{}",reqDtoList.size());
			List<CustEnterpriseBean> retList = new ArrayList<CustEnterpriseBean>();
			for (CustEnterpriReqDto dto : reqDtoList) {
				CustEnterpriseBean perBean = new CustEnterpriseBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<CustEnterpriseBean>.name--------",dto.getName());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryEnterprise(CustEnterpriseBean cb) {
		CustEnterpriReqDto reqDto = new CustEnterpriReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return custEnterpriseApp.pageCountQueryEnterprise(reqDto);
	}
	

	@Override
	public CustEnterpriseBean detailQueryEnterprise(String id) {
		CustEnterpriReqDto reqDto = custEnterpriseApp.detailQueryEnterprise(id);
		CustEnterpriseBean retBean = new CustEnterpriseBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}

	@Override
	public boolean enterpriseCheckQuery(String name) {
		return custEnterpriseApp.enterpriseCheckQuery(name);
	}

	@Override
	public boolean enterpriseAdd(CustEnterpriseBean cb) {
		CustEnterpriReqDto reqDto = new CustEnterpriReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return custEnterpriseApp.enterpriseAdd(reqDto);
	}

}
