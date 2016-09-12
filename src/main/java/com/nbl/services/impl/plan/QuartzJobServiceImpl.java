package com.nbl.services.impl.plan;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.jspbean.plan.QuartzJobBean;
import com.nbl.service.manager.app.QuartzServiceApp;
import com.nbl.service.manager.dto.QuartzJobDto;
import com.nbl.service.manager.dto.QuartzJobTriggerDto;
import com.nbl.services.plan.QuartzJobService;
@Service("quartzJobService")
public class QuartzJobServiceImpl implements QuartzJobService {

	@Resource
	private QuartzServiceApp quartzServiceApp;
	
	@SuppressWarnings("rawtypes")
	@Override
	public void createSchedule(String jName, String jGroup, String cron, String tName, String tGroup, Class c) {
		quartzServiceApp.createSchedule(jName, jGroup, cron, tName, tGroup, c);
	}

	@Override
	public void pauseJob(String name, String group) {
		quartzServiceApp.pauseJob(name, group);
	}

	@Override
	public void resumeJob(String name, String group) {
		quartzServiceApp.resumeJob(name, group);
	}

	@Override
	public void updateScheduleJob(String name, String group, String cron) {
		quartzServiceApp.updateScheduleJob(name, group, cron);
	}

	@Override
	public List<QuartzJobBean> queryScheduleJobs() {
		
		List<QuartzJobDto> list = quartzServiceApp.queryScheduleJobs();
		
		List<QuartzJobBean> quartzList = new ArrayList<QuartzJobBean>();
		
		Iterator<QuartzJobDto> it = list.iterator();
		
		while(it.hasNext()){
			QuartzJobDto dto = it.next();
			
			Iterator<QuartzJobTriggerDto> trigIt = dto.getTriggerList().iterator();
			while(trigIt.hasNext()){
				QuartzJobBean jspBean = new QuartzJobBean();
				QuartzJobTriggerDto triDto = trigIt.next();
				jspBean.setjName(dto.getjName());
				jspBean.setjGroup(dto.getjGroup());
				BeanUtils.copyProperties(triDto,jspBean);
				quartzList.add(jspBean);
			}
		}
		
		return quartzList;
	}

}
