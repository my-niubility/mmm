package com.nbl.controller.echarts;

import java.util.HashMap;
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

import com.nbl.services.payment.PaymentService;
import com.nbl.utils.json.ResponseJson;

/**
 * @author gcs
 * @createdate 2016年8月5日	
 * @version 1.0
 * 实名投资转化率
 */
@RequestMapping("verifyTranslate")
@Controller
public class VerifyTranslateController {
	
	private final static Logger logger = LoggerFactory.getLogger(VerifyTranslateController.class); 
	
	@Resource
	private PaymentService paymentService;
	
	@Resource(name="ehCacheManager")
	private EhCacheManager ehCacheManager;
	
	@RequestMapping(value= "/echarts",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/verifyTranslate===echarts");
		
		return "/WEB-INF/view/echarts/verifyTranslate";
		
	}
	
	@RequestMapping(value= "/query",method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody ResponseJson  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/verifyTranslate===query");
		
		String startTime = request.getParameter("startTime");//开始时间  用于后期的扩展
		String endTime = request.getParameter("endTime");//结束时间 用于后期的扩展
		ResponseJson json = new ResponseJson();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		Cache<String, Map<String, Object>> cache = ehCacheManager.getCache("echartAll");
		
		int certCount = paymentService.queryCountPayment();
		int noCertCount = paymentService.queryNoCountPayment();
		int lastMonthCount = paymentService.queryLastMonthCount();
		int noLastMonthCount = paymentService.queryNoLastMonthCount();
		int MonthCount = paymentService.queryMonthCount();
		int noMonthCount = paymentService.queryNoMonthCount();
		int weekCount = paymentService.queryWeekCount();
		int noWeekCount = paymentService.queryNoWeekCount();
		jsonMap.put("certCount", certCount);
		jsonMap.put("noCertCount", noCertCount);
		jsonMap.put("lastMonthCount", lastMonthCount);
		jsonMap.put("noLastMonthCount", noLastMonthCount);
		jsonMap.put("MonthCount", MonthCount);
		jsonMap.put("noMonthCount", noMonthCount);
		jsonMap.put("weekCount", weekCount);
		jsonMap.put("noWeekCount", noWeekCount);
		
		//把结果集放到缓存中
		cache.put("all", jsonMap);
		
		logger.info("------paymentService--【echartsAll】----"+cache.values());
		return json.success(jsonMap);
		
	}
}
