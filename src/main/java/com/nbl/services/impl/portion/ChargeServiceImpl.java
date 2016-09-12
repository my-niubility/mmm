package com.nbl.services.impl.portion;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.portion.ChargeBean;
import com.nbl.service.business.app.ChargeApp;
import com.nbl.service.business.dto.req.ChargeReqDto;
import com.nbl.service.business.dto.res.ChargeResDto;
import com.nbl.services.portion.ChargeService;

@Service("chargeService")
public class ChargeServiceImpl implements ChargeService {
	
	@Resource
	private ChargeApp chargeApp;


	@Override
	public List<ChargeBean> pageListQueryCharge(PageVO<ChargeBean> pageVO, ChargeBean cb) {
		
		PageVO<ChargeReqDto> pgVO = new PageVO<ChargeReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		ChargeReqDto reqDto = new ChargeReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		
		List<ChargeResDto> resDtoList = chargeApp.pageListQueryCharge(pgVO, reqDto);
		if(resDtoList !=null && resDtoList.size()>0){
			
			List<ChargeBean> retList = new ArrayList<ChargeBean>();
			
			for(ChargeResDto dto : resDtoList){
				ChargeBean cbean = new ChargeBean();
				BeanUtils.copyProperties(dto, cbean);
				retList.add(cbean);
			}
			return retList;
		}else{
			return null;
		}
		
	}

	@Override
	public int pageCountQueryCharge(ChargeBean cb) {
		ChargeReqDto reqDto = new ChargeReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return chargeApp.pageCountQueryCharge(reqDto);
	}

	@Override
	public ChargeBean detailQueryCharge(String chargeId) {
		
		ChargeResDto resDto = chargeApp.detailQueryCharge(chargeId);
		ChargeBean cb = new ChargeBean();
		BeanUtils.copyProperties(resDto,cb);
		
		return cb;
	}

}
