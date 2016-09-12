package com.nbl.services.impl.product;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.product.PositionBean;
import com.nbl.service.manager.app.PositionApp;
import com.nbl.service.manager.dto.PositionReqDto;
import com.nbl.services.product.PositionService;

@Service("positionService")
public class PositionServiceImpl implements PositionService {
	
	private static final Logger logger = LoggerFactory.getLogger(PositionServiceImpl.class);
	
	@Resource
	private PositionApp positionApp;
	
	@Override
	public List<PositionBean> pageListQueryPosition(PageVO<PositionBean> pageVO, PositionBean cb) {
		PositionReqDto reqDto = new PositionReqDto();
		PageVO<PositionReqDto> pgVO = new PageVO<PositionReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<PositionReqDto> reqDtoList = positionApp.pageListQueryPosition(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<PositionReqDto>.size---------:{}",reqDtoList.size());
			List<PositionBean> retList = new ArrayList<PositionBean>();
			for (PositionReqDto dto : reqDtoList) {
				PositionBean perBean = new PositionBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<PositionBean>.id--------",dto.getId());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryPosition(PositionBean cb) {
		PositionReqDto reqDto = new PositionReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return positionApp.pageCountQueryPosition(reqDto);
	}

	@Override
	public PositionBean positionDetail(String id) {
		PositionReqDto reqDto = positionApp.positionDetail(id);
		PositionBean retBean = new PositionBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}

}
