package com.nbl.controller.parameter;

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
import com.nbl.controller.task.TrialBalanceController;
import com.nbl.jspbean.parameter.AccountRuleBean;
import com.nbl.services.parameter.AccountRuleServier;

/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 记账规则查询控制层
 */
@RequestMapping("rule")
@Controller
public class AccountRuleController {
private final static Logger logger = LoggerFactory.getLogger(TrialBalanceController.class); 
	
	@Resource
	private AccountRuleServier accountRuleServier;
	
	@RequestMapping(value="/accRuleQuery",method = {RequestMethod.POST,RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("---accRuleQuery---");
		
		String accountType = request.getParameter("accountType");//	记账类型 	0：业务记账 	1：其他
		String payerSubjectNo = request.getParameter("payerSubjectNo");//付款方科目
		String payeeSubjectNo = request.getParameter("payeeSubjectNo");//收款方科目
		
		AccountRuleBean reqDto = new AccountRuleBean();
		if ("9".equals(accountType)) {
			reqDto.setAccountType(null);
		} else {
			reqDto.setAccountType(accountType);
		}
		reqDto.setPayerSubjectNo(payerSubjectNo);
		reqDto.setPayeeSubjectNo(payeeSubjectNo);
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<AccountRuleBean> pageVO = new PageVO<AccountRuleBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<AccountRuleBean> accRuleList = accountRuleServier.pageListQueryAccRule(pageVO, reqDto);
		if(accRuleList !=null && accRuleList.size()>0){
			logger.info("/accRuleList.size()==="+accRuleList.size());
		}
		//查询总条数
		int count = accountRuleServier.pageCountQueryAccRule(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("accRuleList", accRuleList);
		request.getSession().setAttribute("accRuleCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/parameter/accRule_query_body";
	}
	
	@RequestMapping(value= "/accRule_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/accRule_query_body===");
		
		AccountRuleBean reqDto = new AccountRuleBean();
		//每页展示数据条数
		PageVO<AccountRuleBean> pageVO = new PageVO<AccountRuleBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<AccountRuleBean> accRuleList = accountRuleServier.pageListQueryAccRule(pageVO, reqDto);
		if(accRuleList !=null && accRuleList.size()>0){
			logger.info("/accRuleList.size()==="+accRuleList.size());
		}
		//查询总条数
		int count = accountRuleServier.pageCountQueryAccRule(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("accRuleList", accRuleList);
		request.getSession().setAttribute("accRuleCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/parameter/accRule_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/accRulePageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/accRulePageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<AccountRuleBean> pageVO = (PageVO<AccountRuleBean>) request.getSession().getAttribute("pageVo");
		AccountRuleBean reqDto = (AccountRuleBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<AccountRuleBean> accRuleList = accountRuleServier.pageListQueryAccRule(pageVO, reqDto);
		if(accRuleList !=null && accRuleList.size()>0){
			logger.info("/accRuleList.size()==="+accRuleList.size());
		}
		request.getSession().setAttribute("accRuleList", accRuleList);
		
		return "/WEB-INF/view/parameter/accRule_query_body";
		
	}
	
	@RequestMapping(value= "/toAccRuleMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toAccRuleMain===");
		return "/WEB-INF/view/parameter/accRule_query_main";
		
	}
	
	@RequestMapping(value= "/accRule_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/accRule_query_top===");
		return "/WEB-INF/view/parameter/accRule_query_top";
		
	}
}
