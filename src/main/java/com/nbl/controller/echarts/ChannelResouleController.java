package com.nbl.controller.echarts;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbl.jspbean.customer.CustPersonBean;
import com.nbl.services.customer.CustPersonService;
import com.nbl.utils.json.ResponseJson;

/**
 * @author gcs
 * @createdate 2016年8月5日	
 * @version 1.0
 * 用户渠道来源
 */
@RequestMapping("channelResoule")
@Controller
public class ChannelResouleController {
	
	private final static Logger logger = LoggerFactory.getLogger(ChannelResouleController.class); 

	@Resource(name="ehCacheManager")
	private EhCacheManager ehCacheManager;
	
	@Resource
	private CustPersonService custPersonService;
	
	@RequestMapping(value= "/echarts",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/channelResoule===echarts");
		
		return "/WEB-INF/view/echarts/channelResoule";
		
	}
	
	@RequestMapping(value= "/query",method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody  ResponseJson queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/channelResoule===query");
		ResponseJson json = new ResponseJson();
		Map<String, List<CustPersonBean>> jsonMap = new HashMap<String, List<CustPersonBean>>();
		Cache<String, Map<String, List<CustPersonBean>>> cache =ehCacheManager.getCache("echartsAll");
		
		List<CustPersonBean> listCount = custPersonService.listCount();
		List<CustPersonBean> listLastMonthCount = custPersonService.listLastMonthCount();
		List<CustPersonBean> listMonthCount = custPersonService.listMonthCount();
		List<CustPersonBean> listWeekCount = custPersonService.listWeekCount();
		
		jsonMap.put("listCount", listCount);
		jsonMap.put("listLastMonthCount", listLastMonthCount);
		jsonMap.put("listMonthCount", listMonthCount);
		jsonMap.put("listWeekCount", listWeekCount);
		//把查询结果集放到缓存中
		cache.put("all", jsonMap);
		logger.info("------custPersonService--【echartsAll】----"+cache.values());
		
		return json.success(jsonMap);
	}
}
