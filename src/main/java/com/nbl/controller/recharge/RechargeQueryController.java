package com.nbl.controller.recharge;

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
import com.nbl.jspbean.recharge.RechargeBean;
import com.nbl.services.recharge.RechargeService;

/**
 * @author gcs
 * @createdate 2016年7月20日
 * @version 1.0
 * * */

@RequestMapping(value= "/recharge")
@Controller
public class RechargeQueryController {

	private final static Logger logger = LoggerFactory.getLogger(RechargeQueryController.class); 
	
	@Resource
	private RechargeService rechargeService;
	
	@RequestMapping(value= "/rechargeQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/rechargeQuery===");
		String id = request.getParameter("id");//充值ID
		String custId = request.getParameter("custId");//客户ID
		String status = request.getParameter("status");//提现状态 1：充值成功  2：处理中 3：充值失败  4:  受理成功
	    String rechargeType = request.getParameter("rechargeType");//充值方式  00：网银充值    01：快捷充值    02：线下转账    03：其他
	    RechargeBean reqDto = new RechargeBean();
		reqDto.setId(id);
		reqDto.setCustId(custId);
		//NO、9、  999 表示没有选择直接查询
		if("9".equals(status)){
			reqDto.setStatus(null);
		}else{
			reqDto.setStatus(status);
		}
		if("99".equals(rechargeType)){
			reqDto.setRechargeType(null);
		}else{
			reqDto.setRechargeType(rechargeType);
		}
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<RechargeBean> pageVO = new PageVO<RechargeBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<RechargeBean> rechargeList = rechargeService.pageListQueryRecharge(pageVO, reqDto);
		if(rechargeList !=null && rechargeList.size()>0){
			logger.info("/rechargeList.size()==="+rechargeList.size());
		}
		//查询总条数
		int count = rechargeService.pageCountQueryRecharge(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("rechargeList", rechargeList);
		request.getSession().setAttribute("rechargeCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/trade/recharge_query_body";
		
	}

	
	@RequestMapping(value= "/recharge_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/recharge_query_body===");
		
		RechargeBean reqDto = new RechargeBean();
		//每页展示数据条数
		PageVO<RechargeBean> pageVO = new PageVO<RechargeBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<RechargeBean> rechargeList = rechargeService.pageListQueryRecharge(pageVO, reqDto);
		if(rechargeList !=null && rechargeList.size()>0){
			logger.info("/rechargeList.size()==="+rechargeList.size());
		}
		//查询总条数
		int count = rechargeService.pageCountQueryRecharge(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("rechargeList", rechargeList);
		request.getSession().setAttribute("rechargeCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		return "/WEB-INF/view/trade/recharge_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/rechargePageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/rechargePageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<RechargeBean> pageVO = (PageVO<RechargeBean>) request.getSession().getAttribute("pageVo");
		RechargeBean reqDto = (RechargeBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<RechargeBean> rechargeList = rechargeService.pageListQueryRecharge(pageVO, reqDto);
		if(rechargeList !=null && rechargeList.size()>0){
			logger.info("/rechargeList.size()==="+rechargeList.size());
		}
		request.getSession().setAttribute("rechargeList", rechargeList);
		
		return "/WEB-INF/view/trade/recharge_query_body";
		
	}

	@RequestMapping(value= "/rechargeDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/recharge_query_detail===");
		
		String id = request.getParameter("id");
		logger.info("-----交易流水号id----:{}",id);
		RechargeBean cb = rechargeService.rechargeDetail(id);
			
		request.setAttribute("recharge", cb);
		return "/WEB-INF/view/trade/recharge_query_detail";
		
	}

	
	@RequestMapping(value= "/toRechargeMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toRechargeMain===");
		return "/WEB-INF/view/trade/recharge_query_main";
		
	}
	
	@RequestMapping(value= "/recharge_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/recharge_query_top===");
		return "/WEB-INF/view/trade/recharge_query_top";
		
	}

}
