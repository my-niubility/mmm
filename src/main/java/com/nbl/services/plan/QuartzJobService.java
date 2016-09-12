package com.nbl.services.plan;

import java.util.List;

import com.nbl.jspbean.plan.QuartzJobBean;

public interface QuartzJobService {

	
	/**
	 * @param jName  job名字(请保证唯一性)
	 * @param jGroup  job组名(请保证唯一性)
	 * @param cron    cron时间表达式
	 * @param tName   trigger名字(请保证唯一性)
	 * @param tGroup  triggerjob组名(请保证唯一性)
	 * @param c  Job任务类
	 * @description:开始一个simpleSchedule()调度(创建一个新的定时任务)
	 */
	public void createSchedule(String jName,String jGroup,String cron,String tName,String tGroup,Class c);

	/**
	 * 暂停Job
	 * @param name job名字
	 * @param group  job组名
	 * @description:
	 */
	public void pauseJob(String name, String group);
	
	/**
	 * 恢复Job
	 * @param name  job名字
	 * @param group  job组名
	 * @description:
	 */
	public void resumeJob(String name, String group);
	
	/**
	 * 更新任务表达式
	 * @param name  trigger名字
	 * @param group  trigger组名
	 * @param cron  cron时间表达式
	 * @description:
	 */
	public void updateScheduleJob(String name, String group,String cron);
	
	/**
	 * @return
	 * @description:获取系统所有任务计划
	 */
	public List<QuartzJobBean> queryScheduleJobs();

}
