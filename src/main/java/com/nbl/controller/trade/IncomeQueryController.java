package com.nbl.controller.trade;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.trade.IncomeBean;
import com.nbl.services.trade.IncomeService;

/**
 * @author gcs
 * @createdate 2016年7月22日
 * @version 1.0
 * * */

@RequestMapping(value= "/trade")
@Controller
public class IncomeQueryController {

	private final static Logger logger = LoggerFactory.getLogger(IncomeQueryController.class); 
	
	@Resource
	private IncomeService incomeService;
	
	@RequestMapping(value= "/incomeQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/incomeQuery===");
		String id = request.getParameter("id");//投资收入ID
		String custId = request.getParameter("custId");//客户ID
		String projectId = request.getParameter("projectId");//项目ID
	    String repayMode = request.getParameter("repayMode");//收益偿还方式 0：等额本息还款 1：一次还本付息 2: 等额本金 3：每月还息到期还本
		String incomeType = request.getParameter("incomeType");//收入类型（00：投资 01：转出 02：协议转让 03: 募集期利息
		String isFinish = request.getParameter("isFinish");//是否完成还款  0：未完成 1：已完成
		
		IncomeBean reqDto = new IncomeBean();
		reqDto.setId(id);
		reqDto.setCustId(custId);
		reqDto.setProjectId(projectId);
		
		//NO、9、  999 表示没有选择直接查询
		if("9".equals(repayMode)){
			reqDto.setRepayMode(null);
		}else{
			reqDto.setRepayMode(repayMode);
		}
		if("99".equals(incomeType)){
			reqDto.setIncomeType(null);
		}else{
			reqDto.setIncomeType(incomeType);
		}
		if("9".equals(isFinish)){
			reqDto.setIsFinish(null);
		}else{
			reqDto.setIsFinish(isFinish);
		}
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<IncomeBean> pageVO = new PageVO<IncomeBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<IncomeBean> incomeList = incomeService.pageListQueryIncome(pageVO, reqDto);
		if(incomeList !=null && incomeList.size()>0){
			logger.info("/incomeList.size()==="+incomeList.size());
		}
		//查询总条数
		int count = incomeService.pageCountQueryIncome(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("incomeList", incomeList);
		request.getSession().setAttribute("incomeCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/trade/income_query_body";
		
	}

	@RequestMapping(value= "/income_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/income_query_body===");
		
		IncomeBean reqDto = new IncomeBean();
		//每页展示数据条数
		PageVO<IncomeBean> pageVO = new PageVO<IncomeBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<IncomeBean> incomeList = incomeService.pageListQueryIncome(pageVO, reqDto);
		if(incomeList !=null && incomeList.size()>0){
			logger.info("/incomeList.size()==="+incomeList.size());
		}
		//查询总条数
		int count = incomeService.pageCountQueryIncome(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("incomeList", incomeList);
		request.getSession().setAttribute("incomeCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		return "/WEB-INF/view/trade/income_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/incomePageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/incomePageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<IncomeBean> pageVO = (PageVO<IncomeBean>) request.getSession().getAttribute("pageVo");
		IncomeBean reqDto = (IncomeBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<IncomeBean> incomeList = incomeService.pageListQueryIncome(pageVO, reqDto);
		if(incomeList !=null && incomeList.size()>0){
			logger.info("/incomeList.size()==="+incomeList.size());
		}
		request.getSession().setAttribute("incomeList", incomeList);
		
		return "/WEB-INF/view/trade/income_query_body";
		
	}
	
	@RequestMapping(value= "/incomeDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/income_query_detail===");
		
		String id = request.getParameter("id");
		logger.info("-----交易流水号id----:{}",id);
		IncomeBean cb = incomeService.incomeDetail(id);
			
		request.setAttribute("income", cb);
		
		return "/WEB-INF/view/trade/income_query_detail";
		
	}
	
	@RequestMapping(value= "/toIncomeMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toIncomeMain===");
		return "/WEB-INF/view/trade/income_query_main";
		
	}
	
	@RequestMapping(value= "/income_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/income_query_top===");
		return "/WEB-INF/view/trade/income_query_top";
		
	}

	

	


}
