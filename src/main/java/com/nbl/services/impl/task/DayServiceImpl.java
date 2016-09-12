
package com.nbl.services.impl.task;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.task.TDayBean;
import com.nbl.service.manager.app.DayApp;
import com.nbl.services.task.DayService;
/**
 * @author gcs
 * @createdate 2016年8月1日	
 * @version 1.0
 * 实现初始化日期接口
 */

@Service("dayService")
public class DayServiceImpl implements DayService {
	
	private static final Logger logger = LoggerFactory.getLogger(DayServiceImpl.class);
	
	@Resource
	private DayApp dayApp;
	
	@Override
	public void initDay(String initDay) {
		logger.info("----初始化日期接口----");
		dayApp.initDay(initDay);
	}
	
	@Override
	public boolean workDayTypeModify(String day, Short workDayType) {
		return dayApp.workDayTypeModify(day,workDayType);
	}

	@Override
	public boolean queryLikeDay(String initDay) {
		return dayApp.queryLikeDay(initDay);
	}

}
