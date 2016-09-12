package com.nbl.controller.trade;

import java.util.ArrayList;
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
import com.nbl.jspbean.trade.PositionBean;
import com.nbl.jspbean.trade.RefundBean;
import com.nbl.services.trade.TradeService;

@RequestMapping(value = "/trade")
@Controller
public class RefundQueryController {

	private final static Logger logger = LoggerFactory.getLogger(RefundQueryController.class);
	private String refundStatus = null;
	private RefundBean rb = null;
	private static String REFUND_QUERY = "1";
	@Resource
	private TradeService tradeService;

	@RequestMapping(value = "/refundQuery", method = { RequestMethod.POST, RequestMethod.GET })
	public String query(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/refundQuery===");

		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String financeId = request.getParameter("financeId");

		RefundBean reqDto = new RefundBean();

		if (!REFUND_QUERY.equals(refundStatus)) {
			List<String> productStatus = new ArrayList<String>();
			productStatus.add("05");
			reqDto.setProductStatusCond(productStatus);
		}

		reqDto.setProductId(productId);
		reqDto.setProductName(productName);
		reqDto.setFinanceId(financeId);

		// 根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<RefundBean> pageVO = new PageVO<RefundBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		// 默认查询分页条数查询
		List<RefundBean> list = tradeService.queryRefundInfo(pageVO, reqDto);
		if (list != null && list.size() > 0) {
			logger.info("/refundList.size()===" + list.size());
		}
		// 根据相同查询条件计算总数据条数
		int count = tradeService.queryRefundInfoCount(reqDto);
		logger.info("/根据相同查询条件计算总数据条数==" + count);
		// 设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("refundList", list);
		request.getSession().setAttribute("refundCount", count);
		request.getSession().setAttribute("refundSize", size);

		return "/WEB-INF/view/trade/refund_query_body";

	}

	@RequestMapping(value = "/toRefundMain", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryMain(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/toRefundMain===");
		refundStatus = request.getParameter("refundStatus");
		return "/WEB-INF/view/trade/refund_query_main";

	}

	@RequestMapping(value = "/refund_query_top", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryTop(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/refund_query_top===");
		return "/WEB-INF/view/trade/refund_query_top";

	}

	@RequestMapping(value = "/refund_query_body", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryBody(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/refund_query_body===");

		RefundBean reqDto = new RefundBean();
		if (!REFUND_QUERY.equals(refundStatus)) {
			List<String> productStatus = new ArrayList<String>();
			productStatus.add("05");
			reqDto.setProductStatusCond(productStatus);
		}

		// 根据前端每页展示数据条数
		PageVO<RefundBean> pageVO = new PageVO<RefundBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		// 默认查询分页条数查询
		List<RefundBean> list = tradeService.queryRefundInfo(pageVO, reqDto);
		if (list != null && list.size() > 0) {
			logger.info("/根据默认条件计算总数据条数chargeList.size()===" + list.size());
		}
		// 根据相同查询条件计算总数据条数
		int count = tradeService.queryRefundInfoCount(reqDto);
		logger.info("/根据默认条件计算总数据条数==" + count);
		// 设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("refundList", list);
		request.getSession().setAttribute("refundCount", count);
		request.getSession().setAttribute("refundSize", 8);

		return "/WEB-INF/view/trade/refund_query_body";

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/refundPageList", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryrefundPage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/refundPageList===");

		// 设置session参数（session级别查询条件）
		PageVO<RefundBean> pageVO = (PageVO<RefundBean>) request.getSession().getAttribute("pageVo");
		RefundBean reqDto = (RefundBean) request.getSession().getAttribute("reqDto");
		// 偏移量
		int offset = request.getParameter("pager.offset") == null ? 0 : Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset===" + offset);
		List<RefundBean> refundList = tradeService.queryRefundInfo(pageVO, reqDto);
		if (refundList != null && refundList.size() > 0) {
			logger.info("/refundList.size()===" + refundList.size());
		}
		request.getSession().setAttribute("refundList", refundList);

		return "/WEB-INF/view/trade/refund_query_body";

	}

	@RequestMapping(value = "/refundDetail", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryDetail(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/refund_query_detail===");
		String id = request.getParameter("id");
		logger.info("-----refund id----:{}", id);
		rb = tradeService.queryRefundDetail(id);
		PositionBean reqDto = new PositionBean();
		reqDto.setProductId(rb.getProductId());
		List<String> holdStatus = new ArrayList<String>();
		holdStatus.add("07");
		reqDto.setHoldStatusCond(holdStatus);

		int investorNum = tradeService.queryInvestorInfoCount(reqDto);

		request.getSession().setAttribute("rb", rb);
		request.getSession().setAttribute("investorNum", Integer.toString(investorNum));

		// query T_position
		if (!REFUND_QUERY.equals(refundStatus)) {
			// 根据前端每页展示数据条数
			PageVO<PositionBean> pageVO = new PageVO<PositionBean>();
			pageVO.setStartSize(0);
			pageVO.setSize(8);
			// 设置session参数（session级别查询条件）
			request.getSession().setAttribute("pageVo", pageVO);
			request.getSession().setAttribute("reqDto", reqDto);
			request.getSession().setAttribute("positionCount", 0);
			request.getSession().setAttribute("positionSize", 8);
		}else{
			// 根据前端每页展示数据条数
			PageVO<PositionBean> pageVO = new PageVO<PositionBean>();
			pageVO.setStartSize(0);
			pageVO.setSize(8);
			// 设置session参数（session级别查询条件）
			request.getSession().setAttribute("pageVo", pageVO);
			request.getSession().setAttribute("reqDto", reqDto);
			request.getSession().setAttribute("positionCount", 0);
			request.getSession().setAttribute("positionSize", 8);
		}

		request.getSession().setAttribute("positionList", null);

		return "/WEB-INF/view/trade/refund_query_detail";
	}

	@RequestMapping(value = "/investorsRefundQuery", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryInvestors(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/investorsRefundQuery===");
		PositionBean reqDto = (PositionBean) request.getSession().getAttribute("reqDto");
		// 根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<PositionBean> pageVO = new PageVO<PositionBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		// 默认查询分页条数查询
		List<PositionBean> list = tradeService.queryInvestorInfo(pageVO, reqDto);
		if (list != null && list.size() > 0) {
			logger.info("/positionList.size()===" + list.size());
		}
		// 根据相同查询条件计算总数据条数
		int count = tradeService.queryInvestorInfoCount(reqDto);
		logger.info("/根据相同查询条件计算总数据条数==" + count);
		// 设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("positionList", list);
		request.getSession().setAttribute("positionCount", count);
		request.getSession().setAttribute("positionSize", size);

		return "/WEB-INF/view/trade/refund_query_detail";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/positionList", method = { RequestMethod.POST, RequestMethod.GET })
	public String querypositionPage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/positionList===");

		// 设置session参数（session级别查询条件）
		PageVO<PositionBean> pageVO = (PageVO<PositionBean>) request.getSession().getAttribute("pageVo");
		PositionBean reqDto = (PositionBean) request.getSession().getAttribute("reqDto");
		// 偏移量
		int offset = request.getParameter("pager.offset") == null ? 0 : Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset===" + offset);
		List<PositionBean> positionList = tradeService.queryInvestorInfo(pageVO, reqDto);
		if (positionList != null && positionList.size() > 0) {
			logger.info("/positionList.size()===" + positionList.size());
		}
		request.getSession().setAttribute("positionList", positionList);

		int count = tradeService.queryInvestorInfoCount(reqDto);
		logger.info("/根据默认条件计算总数据条数==" + count);
		request.getSession().setAttribute("positionCount", count);

		return "/WEB-INF/view/trade/refund_query_detail";

	}

	@RequestMapping(value = "/refundApply", method = { RequestMethod.POST, RequestMethod.GET })
	public String refundApply(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/refundApply===");
		// 调用第三方接口还款
		queryInvestors(request, response);
		return "/WEB-INF/view/trade/refund_query_detail";
	}

}
