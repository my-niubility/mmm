
package com.nbl.services.impl.parameter;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.GeneralParameterBean;
import com.nbl.service.manager.app.GeneralParameterApp;
import com.nbl.service.manager.dto.GeneralParameterDto;
import com.nbl.services.parameter.GenParameterService;
/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 实现系统参数接口
 */

@Service("genParameterService")
public class GenParameterServiceImpl implements GenParameterService {
	
	private final static Logger logger = LoggerFactory.getLogger(GenParameterServiceImpl.class);
	
	@Resource
	private GeneralParameterApp generalParameterApp;
	
	/* (non-Javadoc)
	 * @see com.zlebank.services.parameter.GenParameterService#pageListQueryGenParameter(com.zlebank.common.vo.PageVO, com.zlebank.jspbean.parameter.GeneralParameterBean)
	 */
	@Override
	public List<GeneralParameterBean> pageListQueryGenParameter(PageVO<GeneralParameterBean> pageVO,
			GeneralParameterBean cb) {
		GeneralParameterDto reqDto = new GeneralParameterDto();
		PageVO<GeneralParameterDto> pgVO = new PageVO<GeneralParameterDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<GeneralParameterDto> reqDtoList = generalParameterApp.pageListQueryGenParameter(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<GeneralParameterDto>.size---------:{}",reqDtoList.size());
			List<GeneralParameterBean> retList = new ArrayList<GeneralParameterBean>();
			for (GeneralParameterDto dto : reqDtoList) {
				GeneralParameterBean perBean = new GeneralParameterBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<GeneralParameterBean>.code--------",dto.getCode());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	/* (non-Javadoc)
	 * @see com.zlebank.services.parameter.GenParameterService#pageCountQueryGenParameter(com.zlebank.jspbean.parameter.GeneralParameterBean)
	 */
	@Override
	public int pageCountQueryGenParameter(GeneralParameterBean cb) {
		GeneralParameterDto reqDto = new GeneralParameterDto();
		BeanUtils.copyProperties(cb, reqDto);
		return generalParameterApp.pageCountQueryGenParameter(reqDto);
	}

	/* (non-Javadoc)
	 * @see com.zlebank.services.parameter.GenParameterService#generalParameterModify(java.lang.String)
	 */
	@Override
	public GeneralParameterBean generalParameterDetail(Integer id) {
		GeneralParameterDto reqDto = generalParameterApp.generalParameterDetail(id);
		GeneralParameterBean retBean = new GeneralParameterBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}

	/* (non-Javadoc)
	 * @see com.zlebank.services.parameter.GenParameterService#generalParameterModify(java.lang.Integer, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public boolean generalParameterModify(Integer id, String code, String parName, String parValue, String reMark) {
		return generalParameterApp.generalParameterModify(id, code, parName, parValue, reMark);
	}


}
