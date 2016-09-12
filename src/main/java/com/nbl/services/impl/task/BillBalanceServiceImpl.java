package com.nbl.services.impl.task;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.task.BillBalanceBean;
import com.nbl.service.manager.app.BillBalanceApp;
import com.nbl.service.manager.dto.BillBalanceReqDto;
import com.nbl.services.impl.trade.TradeOrderServiceImpl;
import com.nbl.services.task.BillBalanceService;
/**
 * @author gcs
 * @createdate 2016年7月25日	
 * @version 1.0
 * 对应接口Service中的业务逻辑
 */

@Service("billBalanceService")
public class BillBalanceServiceImpl implements BillBalanceService {
	
	private static final Logger logger = LoggerFactory.getLogger(BillBalanceServiceImpl.class);
	
	@Resource
	private BillBalanceApp billBalanceApp;
	
	/* (non-Javadoc)
	 * @see com.zlebank.services.task.BillBalanceService#pageListQueryBalance(com.zlebank.common.vo.PageVO, com.zlebank.jspbean.task.BillBalanceBean)
	 */
	@Override
	public List<BillBalanceBean> pageListQueryBalance(PageVO<BillBalanceBean> pageVO, BillBalanceBean cb) {
		BillBalanceReqDto reqDto = new BillBalanceReqDto();
		PageVO<BillBalanceReqDto> pgVO = new PageVO<BillBalanceReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<BillBalanceReqDto> reqDtoList = billBalanceApp.pageListQueryBalance(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<BillBalanceReqDto>.size---------:{}",reqDtoList.size());
			List<BillBalanceBean> retList = new ArrayList<BillBalanceBean>();
			for (BillBalanceReqDto dto : reqDtoList) {
				BillBalanceBean perBean = new BillBalanceBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<BillBalanceBean>.id--------",dto.getId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	/* (non-Javadoc)
	 * @see com.zlebank.services.task.BillBalanceService#pageCountQueryBalance(com.zlebank.jspbean.task.BillBalanceBean)
	 */
	@Override
	public int pageCountQueryBalance(BillBalanceBean cb) {
		BillBalanceReqDto reqDto = new BillBalanceReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return billBalanceApp.pageCountQueryBalance(reqDto);
	}

	/* (non-Javadoc)
	 * @see com.zlebank.services.task.BillBalanceService#BalanceDetail(java.lang.String)
	 */
	@Override
	public BillBalanceBean BalanceDetail(Integer id) {
		BillBalanceReqDto reqDto = billBalanceApp.BalanceDetail(id);
		BillBalanceBean retBean = new BillBalanceBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}


}
