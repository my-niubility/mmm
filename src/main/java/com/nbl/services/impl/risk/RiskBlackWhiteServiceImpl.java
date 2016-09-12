
package com.nbl.services.impl.risk;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.risk.RiskBlackWhiteBean;
import com.nbl.service.manager.app.RiskBlackWhiteApp;
import com.nbl.service.manager.dto.RiskBlackWhiteDto;
import com.nbl.services.risk.RiskBlackWhiteService;
/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * manager层黑白名单对应的接口实现
 */
@Service("riskBlackWhiteService")
public class RiskBlackWhiteServiceImpl implements RiskBlackWhiteService {
	
	private static final Logger logger = LoggerFactory.getLogger(RiskBlackWhiteServiceImpl.class);
	
	@Resource
	private RiskBlackWhiteApp riskBlackWhiteApp;
		
	@Override
	public List<RiskBlackWhiteBean> pageListQueryBlackWhite(PageVO<RiskBlackWhiteBean> pageVO, RiskBlackWhiteBean cb) {
		RiskBlackWhiteDto reqDto = new RiskBlackWhiteDto();
		PageVO<RiskBlackWhiteDto> pgVO = new PageVO<RiskBlackWhiteDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<RiskBlackWhiteDto> reqDtoList = riskBlackWhiteApp.pageListQueryBlackWhite(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<RiskBlackWhiteDto>.size---------:{}",reqDtoList.size());
			List<RiskBlackWhiteBean> retList = new ArrayList<RiskBlackWhiteBean>();
			for (RiskBlackWhiteDto dto : reqDtoList) {
				RiskBlackWhiteBean perBean = new RiskBlackWhiteBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<RiskBlackWhiteBean>.custId--------",dto.getCustId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryBlackWhite(RiskBlackWhiteBean cb) {
		RiskBlackWhiteDto reqDto = new RiskBlackWhiteDto();
		BeanUtils.copyProperties(cb, reqDto);
		return riskBlackWhiteApp.pageCountQueryBlackWhite(reqDto);
	}

	

}
