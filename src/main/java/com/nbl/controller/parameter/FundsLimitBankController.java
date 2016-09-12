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
import com.nbl.jspbean.parameter.FundsLimitBankBean;
import com.nbl.services.parameter.FundsLimitBankService;

/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 银行资金限额控制层
 */
@RequestMapping("/fundsLimit")
@Controller
public class FundsLimitBankController {
	
	private static final Logger logger = LoggerFactory.getLogger(FundsLimitBankController.class);
	
	@Resource
	private FundsLimitBankService fundsLimitBankService;
	
	@RequestMapping(value="/fundsLimitQuery",method = {RequestMethod.POST,RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("----fundsLimitQuery----");
		
		String bankId = request.getParameter("bankId");//关联行别
		String cardType = request.getParameter("cardType");//银行卡类型 1、借记卡 2、贷记卡
		String channelType = request.getParameter("channelType");//渠道类型(枚举) 01 银联  02 直连
		String businessType = request.getParameter("businessType");//交易类型(枚举) 01 充值 02 提现 03 支付
		
		FundsLimitBankBean reqDto = new FundsLimitBankBean();
		reqDto.setBankId(bankId);
		//9、NO为未选择
		if ("9".equals(cardType)) {
			reqDto.setCardType(null);
		} else {
			reqDto.setCardType(cardType);
		}
		if ("NO".equals(channelType)) {
			reqDto.setChannelType(null);
		} else {
			reqDto.setChannelType(channelType);
		}
		if ("NO".equals(businessType)) {
			reqDto.setBusinessType(null);
		} else {
			reqDto.setBusinessType(businessType);
		}
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<FundsLimitBankBean> pageVO = new PageVO<FundsLimitBankBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<FundsLimitBankBean> fundsLimitList = fundsLimitBankService.pageListQueryFundsLimit(pageVO, reqDto);
		if(fundsLimitList !=null && fundsLimitList.size()>0){
			logger.info("/fundsLimitList.size()==="+fundsLimitList.size());
		}
		//查询总条数
		int count = fundsLimitBankService.pageCountQueryFundsLimit(reqDto);
		logger.info("/查询银行资金限额条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("fundsLimitList", fundsLimitList);
		request.getSession().setAttribute("fundsLimitCount", count);
		request.getSession().setAttribute("chargeSize", size);
		
		return "/WEB-INF/view/parameter/fundsLimit_query_body";
	}
	
	@RequestMapping(value= "/fundsLimit_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/fundsLimit_query_body===");
		
		FundsLimitBankBean reqDto = new FundsLimitBankBean();
		//每页展示数据条数
		PageVO<FundsLimitBankBean> pageVO = new PageVO<FundsLimitBankBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<FundsLimitBankBean> fundsLimitList = fundsLimitBankService.pageListQueryFundsLimit(pageVO, reqDto);
		if(fundsLimitList !=null && fundsLimitList.size()>0){
			logger.info("/fundsLimitList.size()==="+fundsLimitList.size());
		}
		//查询总条数
		int count = fundsLimitBankService.pageCountQueryFundsLimit(reqDto);
		logger.info("/查询业务场景步骤条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("fundsLimitList", fundsLimitList);
		request.getSession().setAttribute("fundsLimitCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/parameter/fundsLimit_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/fundsLimitPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/fundsLimitPageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<FundsLimitBankBean> pageVO = (PageVO<FundsLimitBankBean>) request.getSession().getAttribute("pageVo");
		FundsLimitBankBean reqDto = (FundsLimitBankBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<FundsLimitBankBean> fundsLimitList = fundsLimitBankService.pageListQueryFundsLimit(pageVO, reqDto);
		if(fundsLimitList !=null && fundsLimitList.size()>0){
			logger.info("/fundsLimitList.size()==="+fundsLimitList.size());
		}
		request.getSession().setAttribute("fundsLimitList", fundsLimitList);
		
		return "/WEB-INF/view/parameter/fundsLimit_query_body";
		
	}

	@RequestMapping(value= "/tofundsLimitMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/tofundsLimitMain===");
		return "/WEB-INF/view/parameter/fundsLimit_query_main";
		
	}
	
	@RequestMapping(value= "/fundsLimit_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/fundsLimit_query_top===");
		return "/WEB-INF/view/parameter/fundsLimit_query_top";
		
	}
}
