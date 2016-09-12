package com.nbl.controller.trade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value= "/trade")
@Controller
public class FundtransferQueryController {

	private final static Logger logger = LoggerFactory.getLogger(FundtransferQueryController.class); 
	
	@RequestMapping(value= "/fundtransferQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/fundtransferQuery===");
		return "/WEB-INF/view/trade/fundtransfer_query_body";
		
	}

	@RequestMapping(value= "/toFundtransferMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toFundtransferMain===");
		return "/WEB-INF/view/trade/fundtransfer_query_main";
		
	}
	
	@RequestMapping(value= "/fundtransfer_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/fundtransfer_query_top===");
		return "/WEB-INF/view/trade/fundtransfer_query_top";
		
	}

	@RequestMapping(value= "/fundtransfer_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/fundtransfer_query_body===");
		return "/WEB-INF/view/trade/fundtransfer_query_body";
		
	}

	@RequestMapping(value= "/fundtransferDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/fundtransfer_query_detail===");
		return "/WEB-INF/view/trade/fundtransfer_query_detail";
		
	}


}
