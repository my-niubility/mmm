package com.nbl.controller.task;

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
import com.nbl.jspbean.task.BillBalanceBean;
import com.nbl.services.task.BillBalanceService;


/**
 * @author gcs
 * @createdate 2016年7月25日	
 * @version 1.0
 * 试算日终控制层
 */

@RequestMapping("task")
@Controller
public class TrialBalanceController {
	
	private final static Logger logger = LoggerFactory.getLogger(TrialBalanceController.class); 
	
	@Resource
	private BillBalanceService billBalanceService;
	
	@RequestMapping(value="/balanceQuery",method = {RequestMethod.POST,RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("---balanceQuery---");
		
		String custId = request.getParameter("custId");//客户号
		String merchantId = request.getParameter("merchantId");//商户号
		String projectId = request.getParameter("projectId");//项目编号
		
		BillBalanceBean reqDto = new BillBalanceBean();
		reqDto.setCustId(custId);
		reqDto.setMerchantId(merchantId);
		reqDto.setProjectId(projectId);
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<BillBalanceBean> pageVO = new PageVO<BillBalanceBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<BillBalanceBean> balanceList = billBalanceService.pageListQueryBalance(pageVO, reqDto);
		if(balanceList !=null && balanceList.size()>0){
			logger.info("/balanceList.size()==="+balanceList.size());
		}
		//查询总条数
		int count = billBalanceService.pageCountQueryBalance(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("balanceList", balanceList);
		request.getSession().setAttribute("balanceCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/task/balance_query_body";
	}
	
	@RequestMapping(value= "/balance_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/balance_query_body===");
		
		BillBalanceBean reqDto = new BillBalanceBean();
		//每页展示数据条数
		PageVO<BillBalanceBean> pageVO = new PageVO<BillBalanceBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<BillBalanceBean> balanceList = billBalanceService.pageListQueryBalance(pageVO, reqDto);
		if(balanceList !=null && balanceList.size()>0){
			logger.info("/balanceList.size()==="+balanceList.size());
		}
		//查询总条数
		int count = billBalanceService.pageCountQueryBalance(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("balanceList", balanceList);
		request.getSession().setAttribute("balanceCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/task/balance_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/balancePageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/balancePageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<BillBalanceBean> pageVO = (PageVO<BillBalanceBean>) request.getSession().getAttribute("pageVo");
		BillBalanceBean reqDto = (BillBalanceBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<BillBalanceBean> balanceList = billBalanceService.pageListQueryBalance(pageVO, reqDto);
		if(balanceList !=null && balanceList.size()>0){
			logger.info("/balanceList.size()==="+balanceList.size());
		}
		request.getSession().setAttribute("balanceList", balanceList);
		
		return "/WEB-INF/view/task/balance_query_body";
		
	}
	@RequestMapping(value= "/balanceDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  querydetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/balance_query_detail===");
		Integer id = Integer.parseInt(request.getParameter("id"));
		logger.info("-----交易流水号id----:{}",id);
		BillBalanceBean cb = billBalanceService.BalanceDetail(id);
			
		request.setAttribute("balance", cb);
		return "/WEB-INF/view/task/balance_query_detail";
		
	}

	@RequestMapping(value= "/toBanlanceMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toBanlanceMain===");
		return "/WEB-INF/view/task/balance_query_main";
		
	}
	
	@RequestMapping(value= "/balance_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/balance_query_top===");
		return "/WEB-INF/view/task/balance_query_top";
		
	}
	
}
