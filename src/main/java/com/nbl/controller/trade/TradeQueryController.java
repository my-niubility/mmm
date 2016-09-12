package com.nbl.controller.trade;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.trade.TradeOrderBean;
import com.nbl.services.trade.TradeOrderService;

/**
 * @author gcs
 * @createdate 2016年7月19日
 * @version 1.0
 * * */

@RequestMapping(value= "/trade")
@Controller
public class TradeQueryController {

	private final static Logger logger = LoggerFactory.getLogger(TradeQueryController.class); 
	
	@Resource
	private TradeOrderService tradeOrderService;
	
	@RequestMapping(value= "/tradeQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/tradeQuery===");
		
		String id = request.getParameter("id");//交易ID
		String productId = request.getParameter("productId");//产品ID
		String payOrderNo = request.getParameter("payOrderNo");//支付订单号
	    String invenstType = request.getParameter("invenstType");//订单类型0:投资     1:协议转让    2:划款    3:融资人还款    4:资管人还款    5:资管人退款     6:补贴发放
		String orderStatus = request.getParameter("orderStatus");//订单状态  00:等待付款 01:支付成功	02:支付失败 	03:订单取消
		String purchaseCustId = request.getParameter("purchaseCustId");//投资人ID

		TradeOrderBean reqDto = new TradeOrderBean();
		reqDto.setId(id);
		reqDto.setProductId(productId);
		reqDto.setPayOrderNo(payOrderNo);
		//NO、9、  999 表示没有选择直接查询
		if("9".equals(invenstType)){
			reqDto.setInvenstType(null);
		}else{
			reqDto.setInvenstType(invenstType);
		}
		if("99".equals(orderStatus)){
			reqDto.setOrderStatus(null);
		}else{
			reqDto.setOrderStatus(orderStatus);
		}
		reqDto.setPurchaseCustId(purchaseCustId);
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<TradeOrderBean> pageVO = new PageVO<TradeOrderBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<TradeOrderBean> tradeOrderList = tradeOrderService.pageListQueryTradeOrder(pageVO, reqDto);
		if(tradeOrderList !=null && tradeOrderList.size()>0){
			logger.info("/tradeOrderList.size()==="+tradeOrderList.size());
		}
		//查询总条数
		int count = tradeOrderService.pageCountQueryTradeOrder(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("tradeOrderList", tradeOrderList);
		request.getSession().setAttribute("tradeOrderCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/trade/trade_query_body";
		
	}


	@RequestMapping(value= "/trade_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/trade_query_body===");
		
		TradeOrderBean reqDto = new TradeOrderBean();
		//每页展示数据条数
		PageVO<TradeOrderBean> pageVO = new PageVO<TradeOrderBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<TradeOrderBean> tradeOrderList = tradeOrderService.pageListQueryTradeOrder(pageVO, reqDto);
		if(tradeOrderList !=null && tradeOrderList.size()>0){
			logger.info("/tradeOrderList.size()==="+tradeOrderList.size());
		}
		//查询总条数
		int count = tradeOrderService.pageCountQueryTradeOrder(reqDto);
		logger.info("/查询交易信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("tradeOrderList", tradeOrderList);
		request.getSession().setAttribute("tradeOrderCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/trade/trade_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/tradeOrderPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/tradeOrderPageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<TradeOrderBean> pageVO = (PageVO<TradeOrderBean>) request.getSession().getAttribute("pageVo");
		TradeOrderBean reqDto = (TradeOrderBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<TradeOrderBean> tradeOrderList = tradeOrderService.pageListQueryTradeOrder(pageVO, reqDto);
		if(tradeOrderList !=null && tradeOrderList.size()>0){
			logger.info("/tradeOrderList.size()==="+tradeOrderList.size());
		}
		request.getSession().setAttribute("tradeOrderList", tradeOrderList);
		
		return "/WEB-INF/view/trade/trade_query_body";
		
	}
	@RequestMapping(value= "/tradeDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  querydetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/trade_query_detail===");
		String id = request.getParameter("id");
		logger.info("-----交易流水号id----:{}",id);
		TradeOrderBean cb = tradeOrderService.tradeOrderDetail(id);
			
		request.setAttribute("tradeOrder", cb);
		return "/WEB-INF/view/trade/trade_query_detail";
		
	}

	@RequestMapping(value= "/toTradeMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/queryMain===");
		return "/WEB-INF/view/trade/trade_query_main";
		
	}
	
	@RequestMapping(value= "/trade_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/trade_query_top===");
		return "/WEB-INF/view/trade/trade_query_top";
		
	}
	
	@RequestMapping(value= "/maxLimitQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMaxLimit(HttpServletRequest request, HttpServletResponse response){
		logger.info("/maxLimitQuery===");
		
		String minTradeTalAmt = request.getParameter("minTradeTalAmt");//最小区间值
		String maxTradeTalAmt = request.getParameter("maxTradeTalAmt");//最大区间值
		TradeOrderBean reqDto = new TradeOrderBean();
		if(StringUtils.isNotEmpty(minTradeTalAmt)){
			reqDto.setMinTradeTalAmt(Long.valueOf(minTradeTalAmt.trim()));
		}
		if(StringUtils.isNotEmpty(maxTradeTalAmt)){
			reqDto.setMaxTradeTalAmt(Long.valueOf(maxTradeTalAmt.trim()));
		}
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<TradeOrderBean> pageVO = new PageVO<TradeOrderBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<TradeOrderBean> tradeOrderList = tradeOrderService.pageListQueryTradeOrder(pageVO, reqDto);
		if(tradeOrderList !=null && tradeOrderList.size()>0){
			logger.info("/maxLimitList.size()==="+tradeOrderList.size());
		}
		//查询总条数
		int count = tradeOrderService.pageCountQueryTradeOrder(reqDto);
		logger.info("/查询单笔最大限额条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("tradeOrderList", tradeOrderList);
		request.getSession().setAttribute("tradeOrderCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/risk/maxLimit_query_body";
			
	}


	@RequestMapping(value= "/maxLimit_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMaxLimitBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/maxLimit_query_body===");
		
		TradeOrderBean reqDto = new TradeOrderBean();
		//每页展示数据条数
		PageVO<TradeOrderBean> pageVO = new PageVO<TradeOrderBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<TradeOrderBean> tradeOrderList = tradeOrderService.pageListQueryTradeOrder(pageVO, reqDto);
		if(tradeOrderList !=null && tradeOrderList.size()>0){
			logger.info("/tradeOrderList.size()==="+tradeOrderList.size());
		}
		//查询总条数
		int count = tradeOrderService.pageCountQueryTradeOrder(reqDto);
		logger.info("/查询交易信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("tradeOrderList", tradeOrderList);
		request.getSession().setAttribute("tradeOrderCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/risk/maxLimit_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/maxLimitPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMaxLimitPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/maxLimitPageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<TradeOrderBean> pageVO = (PageVO<TradeOrderBean>) request.getSession().getAttribute("pageVo");
		TradeOrderBean reqDto = (TradeOrderBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<TradeOrderBean> tradeOrderList = tradeOrderService.pageListQueryTradeOrder(pageVO, reqDto);
		if(tradeOrderList !=null && tradeOrderList.size()>0){
			logger.info("/tradeOrderList.size()==="+tradeOrderList.size());
		}
		request.getSession().setAttribute("tradeOrderList", tradeOrderList);
		
		return "/WEB-INF/view/risk/maxLimit_query_body";
		
	}

	@RequestMapping(value= "/toMaxLimitMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMaxLimitMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toMaxLimitMain===");
		return "/WEB-INF/view/risk/maxLimit_query_main";
		
	}
	
	@RequestMapping(value= "/maxLimit_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMaxLimitTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/maxLimit_query_top===");
		return "/WEB-INF/view/risk/maxLimit_query_top";
		
	}
}
