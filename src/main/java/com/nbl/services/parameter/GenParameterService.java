package com.nbl.services.parameter;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.parameter.GeneralParameterBean;

/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 参数配置查询接口
 */

public interface GenParameterService {
	
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<GeneralParameterBean> pageListQueryGenParameter(PageVO<GeneralParameterBean> pageVO,GeneralParameterBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryGenParameter(GeneralParameterBean cb);
	
	/**
	 * @param id
	 * @return
	 * 根据系统参数代码来修改数据
	 * 
	 * */
	public GeneralParameterBean generalParameterDetail(Integer id);
	/**
	 * @param id code parName parValue reMark
	 * @return
	 * 根据系统参数代码来修改数据
	 * 
	 * */
	public boolean generalParameterModify(Integer id,String code,String parName,String parValue,String reMark);
}
