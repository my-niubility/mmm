package com.nbl.controller.trade;

import java.util.ArrayList;
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
import com.nbl.jspbean.trade.IncomeBean;
import com.nbl.jspbean.trade.PrdRepTrmBean;
import com.nbl.services.trade.TradeService;

/**
 * @author gcs
 * @createdate 2016年9月8日	
 * @version 1.0
 * 所有还款查询信息
 */
@RequestMapping(value = "/trade")
@Controller
public class RepayAllQueryController {
	
	private final static Logger logger = LoggerFactory.getLogger(RepayQueryController.class);
	private String repayStatus = null;
	private PrdRepTrmBean prb = null;
	private static String REPAY_QUERY = "1";
	@Resource
	private TradeService tradeService;

	@RequestMapping(value = "/repayAllQuery", method = { RequestMethod.POST, RequestMethod.GET })
	public String query(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/repayAllQuery===");
		String repayType = request.getParameter("repayType");
		String repayTerm = request.getParameter("repayTerm");
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String repayCustName = request.getParameter("repayCustName");
		String repayCustId = request.getParameter("repayCustId");

		PrdRepTrmBean reqDto = new PrdRepTrmBean();

		if (!REPAY_QUERY.equals(repayStatus)) {
			List<Short> isFinish = new ArrayList<Short>();
			isFinish.add(new Short("0"));
			isFinish.add(new Short("2"));
			reqDto.setIsFinishCond(isFinish);
		}
		if (!"9".equals(repayType)) {
			reqDto.setRepayType(repayType);
		}
		if (StringUtils.isNotBlank(repayTerm)) {
			reqDto.setRepayTerm(Long.parseLong(repayTerm));
		}
		reqDto.setProductId(productId);
		reqDto.setProductName(productName);
		reqDto.setRepayCustName(repayCustName);
		reqDto.setRepayCustId(repayCustId);

		// 根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<PrdRepTrmBean> pageVO = new PageVO<PrdRepTrmBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		// 默认查询分页条数查询
		List<PrdRepTrmBean> repayList = tradeService.queryPrdRepTrm(pageVO, reqDto);
		if (repayList != null && repayList.size() > 0) {
			logger.info("/repayList.size()===" + repayList.size());
		}
		// 根据相同查询条件计算总数据条数
		int count = tradeService.queryPrdRepTrmCount(reqDto);
		logger.info("/根据相同查询条件计算总数据条数==" + count);
		// 设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("repayList", repayList);
		request.getSession().setAttribute("repayCount", count);
		request.getSession().setAttribute("repaySize", size);

		return "/WEB-INF/view/trade/repayAll_query_body";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/repayAllPageList", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryRepayPage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/repayPageList===");

		// 设置session参数（session级别查询条件）
		PageVO<PrdRepTrmBean> pageVO = (PageVO<PrdRepTrmBean>) request.getSession().getAttribute("pageVo");
		PrdRepTrmBean reqDto = (PrdRepTrmBean) request.getSession().getAttribute("reqDto");
		// 偏移量
		int offset = request.getParameter("pager.offset") == null ? 0 : Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset===" + offset);
		List<PrdRepTrmBean> repayList = tradeService.queryPrdRepTrm(pageVO, reqDto);
		if (repayList != null && repayList.size() > 0) {
			logger.info("/repayList.size()===" + repayList.size());
		}
		request.getSession().setAttribute("repayList", repayList);

		return "/WEB-INF/view/trade/repayAll_query_body";

	}

	@RequestMapping(value = "/toRepayAllMain", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryMain(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/toRepayAllMain===");
		repayStatus = request.getParameter("repayStatus");
		return "/WEB-INF/view/trade/repayAll_query_main";

	}

	@RequestMapping(value = "/repayAll_query_top", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryTop(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/repayAll_query_top===");
		return "/WEB-INF/view/trade/repayAll_query_top";

	}

	@RequestMapping(value = "/repayAll_query_body", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryBody(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/repayAll_query_body===");

		PrdRepTrmBean reqDto = new PrdRepTrmBean();
		if (!REPAY_QUERY.equals(repayStatus)) {
			List<Short> isFinish = new ArrayList<Short>();
			isFinish.add(new Short("0"));
			isFinish.add(new Short("2"));
			reqDto.setIsFinishCond(isFinish);
		}

		// 根据前端每页展示数据条数
		PageVO<PrdRepTrmBean> pageVO = new PageVO<PrdRepTrmBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		// 默认查询分页条数查询
		List<PrdRepTrmBean> accountList = tradeService.queryPrdRepTrm(pageVO, reqDto);
		if (accountList != null && accountList.size() > 0) {
			logger.info("/根据默认条件计算总数据条数chargeList.size()===" + accountList.size());
		}
		// 根据相同查询条件计算总数据条数
		int count = tradeService.queryPrdRepTrmCount(reqDto);
		logger.info("/根据默认条件计算总数据条数==" + count);
		// 设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("repayList", accountList);
		request.getSession().setAttribute("repayCount", count);
		request.getSession().setAttribute("repaySize", 8);

		return "/WEB-INF/view/trade/repayAll_query_body";

	}

	@RequestMapping(value = "/repayAllDetail", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryDetail(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/repay_query_detail===");
		String id = request.getParameter("id");
		logger.info("-----repay id----:{}", id);
		prb = tradeService.queryPrdRepTrmDetail(id);
		IncomeBean reqDto = new IncomeBean();
		reqDto.setProjectId(prb.getProductId());
		reqDto.setProIncomeTerm(prb.getRepayTerm());
		reqDto.setEnabled("1");
		//reqDto.setIsFinish("0");
		String investorNum = tradeService.getInvestorNum(reqDto);

		request.getSession().setAttribute("prdRepTrm", prb);
		request.getSession().setAttribute("investorNum", investorNum);

		// query T_INCOME
		if (!REPAY_QUERY.equals(repayStatus)) {
			// 根据前端每页展示数据条数
			PageVO<IncomeBean> pageVO = new PageVO<IncomeBean>();
			pageVO.setStartSize(0);
			pageVO.setSize(8);
			// 设置session参数（session级别查询条件）
			request.getSession().setAttribute("pageVo", pageVO);
			request.getSession().setAttribute("reqDto", reqDto);
			request.getSession().setAttribute("incomeCount", 0);
			request.getSession().setAttribute("incomeSize", 8);
		}else {
			// 根据前端每页展示数据条数
			PageVO<IncomeBean> pageVO = new PageVO<IncomeBean>();
			pageVO.setStartSize(0);
			pageVO.setSize(8);
			// 设置session参数（session级别查询条件）
			request.getSession().setAttribute("pageVo", pageVO);
			request.getSession().setAttribute("reqDto", reqDto);
			request.getSession().setAttribute("incomeCount", 0);
			request.getSession().setAttribute("incomeSize", 8);
		}

		request.getSession().setAttribute("incomeList", null);
		
		return "/WEB-INF/view/trade/repayAll_query_detail";
	}

	@RequestMapping(value = "/investorsAllQuery", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryInvestors(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/investorsQuery===");
		IncomeBean reqDto = (IncomeBean) request.getSession().getAttribute("reqDto");
		// 根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<IncomeBean> pageVO = new PageVO<IncomeBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		// 默认查询分页条数查询
		List<IncomeBean> list = tradeService.queryInvestorInfo(pageVO, reqDto);
		if (list != null && list.size() > 0) {
			logger.info("/incomeList.size()===" + list.size());
		}
		// 根据相同查询条件计算总数据条数
		String investorNum = tradeService.getInvestorNum(reqDto);
		int count = Integer.parseInt(investorNum);
		logger.info("/根据相同查询条件计算总数据条数==" + count);
		// 设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("incomeList", list);
		request.getSession().setAttribute("incomeCount", count);
		request.getSession().setAttribute("incomeSize", size);

		return "/WEB-INF/view/trade/repayAll_query_detail";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/incomeAllList", method = { RequestMethod.POST, RequestMethod.GET })
	public String queryIncomePage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/incomeAllList===");

		// 设置session参数（session级别查询条件）
		PageVO<IncomeBean> pageVO = (PageVO<IncomeBean>) request.getSession().getAttribute("pageVo");
		IncomeBean reqDto = (IncomeBean) request.getSession().getAttribute("reqDto");
		// 偏移量
		int offset = request.getParameter("pager.offset") == null ? 0 : Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset===" + offset);
		List<IncomeBean> incomeList = tradeService.queryInvestorInfo(pageVO, reqDto);
		if (incomeList != null && incomeList.size() > 0) {
			logger.info("/incomeList.size()===" + incomeList.size());
		}
		request.getSession().setAttribute("incomeList", incomeList);

		String investorNum = tradeService.getInvestorNum(reqDto);
		int count = Integer.parseInt(investorNum);
		logger.info("/根据默认条件计算总数据条数==" + count);
		request.getSession().setAttribute("incomeCount", count);

		return "/WEB-INF/view/trade/repayAll_query_detail";

	}

}
