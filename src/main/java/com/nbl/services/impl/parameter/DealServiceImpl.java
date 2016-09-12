
package com.nbl.services.impl.parameter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.DealTypeBean;
import com.nbl.service.manager.app.DealTypeApp;
import com.nbl.service.manager.dto.DealTypeDto;
import com.nbl.services.impl.task.BillBalanceServiceImpl;
import com.nbl.services.parameter.DealService;

/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 实现业务步骤场景查询接口
 */
@Service("dealService")
public class DealServiceImpl implements DealService {
	
	private static final Logger logger = LoggerFactory.getLogger(BillBalanceServiceImpl.class);
	
	@Resource
	private DealTypeApp dealTypeApp;
	
	/* (non-Javadoc)
	 * @see com.zlebank.services.deal.DealService#pageListQueryDeal(com.zlebank.common.vo.PageVO, com.zlebank.jspbean.deal.DealTypeBean)
	 */
	@Override
	public List<DealTypeBean> pageListQueryDeal(PageVO<DealTypeBean> pageVO, DealTypeBean cb) {
		DealTypeDto reqDto = new DealTypeDto();
		PageVO<DealTypeDto> pgVO = new PageVO<DealTypeDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<DealTypeDto> reqDtoList = dealTypeApp.pageListQueryDeal(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<DealTypeDto>.size---------:{}",reqDtoList.size());
			List<DealTypeBean> retList = new ArrayList<DealTypeBean>();
			for (DealTypeDto dto : reqDtoList) {
				DealTypeBean perBean = new DealTypeBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<DealTypeBean>.optCode--------",dto.getOptCode());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	/* (non-Javadoc)
	 * @see com.zlebank.services.deal.DealService#pageCountQueryDeal(com.zlebank.jspbean.deal.DealTypeBean)
	 */
	@Override
	public int pageCountQueryDeal(DealTypeBean cb) {
		DealTypeDto reqDto = new DealTypeDto();
		BeanUtils.copyProperties(cb, reqDto);
		return dealTypeApp.pageCountQueryDeal(reqDto);
	}


}
