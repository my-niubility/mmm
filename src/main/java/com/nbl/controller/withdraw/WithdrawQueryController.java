package com.nbl.controller.withdraw;

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
import com.nbl.jspbean.withdraw.WithdrawBean;
import com.nbl.services.withdraw.WithdrawService;

/**
 * @author gcs
 * @createdate 2016年7月20日
 * @version 1.0
 * @description  提现订单管理控制层
 * 
 * */

@RequestMapping(value= "/withdraw")
@Controller
public class WithdrawQueryController {

	private final static Logger logger = LoggerFactory.getLogger(WithdrawQueryController.class); 
	
	@Resource
	private WithdrawService withdrawService;
	
	@RequestMapping(value= "/withdrawQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/withdrawQuery===");
		String id = request.getParameter("id");//提现ID
		String custId = request.getParameter("custId");//客户ID
	    String status = request.getParameter("status");//提现状态 00：处理中   01：提现成功   02：提现失败   03：已受理
	    String withdrawType = request.getParameter("withdrawType");//充值方式  01：普通提现 02：快速提现
		
		WithdrawBean reqDto = new WithdrawBean();
		reqDto.setId(id);
		reqDto.setCustId(custId);
		//NO、9、  999 表示没有选择直接查询
		if("99".equals(status)){
			reqDto.setStatus(null);
		}else{
			reqDto.setStatus(status);
		}
		if("99".equals(withdrawType)){
			reqDto.setWithdrawType(null);
		}else{
			reqDto.setWithdrawType(withdrawType);
		}
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<WithdrawBean> pageVO = new PageVO<WithdrawBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<WithdrawBean> withdrawList = withdrawService.pageListQueryWithdraw(pageVO, reqDto);
		if(withdrawList !=null && withdrawList.size()>0){
			logger.info("/withdrawList.size()==="+withdrawList.size());
		}
		//查询总条数
		int count = withdrawService.pageCountQueryWithdraw(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("withdrawList", withdrawList);
		request.getSession().setAttribute("withdrawCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/trade/withdraw_query_body";
		
	}
	
	@RequestMapping(value= "/withdraw_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/withdraw_query_body===");
		
		WithdrawBean reqDto = new WithdrawBean();
		//每页展示数据条数
		PageVO<WithdrawBean> pageVO = new PageVO<WithdrawBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<WithdrawBean> withdrawList = withdrawService.pageListQueryWithdraw(pageVO, reqDto);
		if(withdrawList !=null && withdrawList.size()>0){
			logger.info("/withdrawList.size()==="+withdrawList.size());
		}
		//查询总条数
		int count = withdrawService.pageCountQueryWithdraw(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("withdrawList", withdrawList);
		request.getSession().setAttribute("withdrawCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/trade/withdraw_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/withdrawPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/withdrawPageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<WithdrawBean> pageVO = (PageVO<WithdrawBean>) request.getSession().getAttribute("pageVo");
		WithdrawBean reqDto = (WithdrawBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<WithdrawBean> withdrawList = withdrawService.pageListQueryWithdraw(pageVO, reqDto);
		if(withdrawList !=null && withdrawList.size()>0){
			logger.info("/withdrawList.size()==="+withdrawList.size());
		}
		request.getSession().setAttribute("withdrawList", withdrawList);
		
		return "/WEB-INF/view/trade/withdraw_query_body";
		
	}
	
	@RequestMapping(value= "/withdrawDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/withdraw_query_detail===");
		String id = request.getParameter("id");
		logger.info("-----交易流水号id----:{}",id);
		WithdrawBean cb = withdrawService.WithdrawDetail(id);
		request.setAttribute("withdraw", cb);
		return "/WEB-INF/view/trade/withdraw_query_detail";
		
	}
	
	@RequestMapping(value= "/toWithdrawMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toWithdrawMain===");
		return "/WEB-INF/view/trade/withdraw_query_main";
		
	}
	
	@RequestMapping(value= "/withdraw_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/withdraw_query_top===");
		return "/WEB-INF/view/trade/withdraw_query_top";
		
	}

	

	


}
