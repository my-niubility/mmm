package com.nbl.controller.portion;

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
import com.nbl.jspbean.portion.ChargeBean;
import com.nbl.services.portion.ChargeService;
import com.nbl.utils.TextFormater;

@RequestMapping(value= "/portion")
@Controller
public class ChargeQueryController {

	private final static Logger logger = LoggerFactory.getLogger(ChargeQueryController.class);
	
	@Resource
	private ChargeService chargeService;
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:提交查询
	 */
	@RequestMapping(value= "/chargeQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/chargeQuery===");
		String bookId = request.getParameter("bookId");
		String accountDateS = request.getParameter("accountDateS");
		String accountDateE = request.getParameter("accountDateE");
		String orderId = request.getParameter("orderId");
		String paymentId = request.getParameter("paymentId");
		String accStatus = request.getParameter("accStatus");
		
		ChargeBean reqDto = new ChargeBean();
		if(bookId == null || "".equals(bookId)){
			reqDto.setBookId(null);
		}else{
			reqDto.setBookId(Integer.valueOf(bookId));
		}
		
		reqDto.setAccountDateS(accountDateS);
		reqDto.setAccountDateE(accountDateE);
		reqDto.setOrderId(orderId);
		reqDto.setPayId(paymentId);
		if("00".equals(accStatus)){
			reqDto.setBookState("00");
		}else if("01".equals(accStatus)){
			reqDto.setBookState("01");
		}else{
			reqDto.setBookState(null);
		}
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<ChargeBean> pageVO = new PageVO<ChargeBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数=="+size);
		//默认查询分页条数查询
		List<ChargeBean> chargeList = chargeService.pageListQueryCharge(pageVO, reqDto);
		if(chargeList !=null && chargeList.size()>0){
			logger.info("/chargeList.size()==="+chargeList.size());
		}
		//根据相同查询条件计算总数据条数
		int count = chargeService.pageCountQueryCharge(reqDto);
		logger.info("/根据相同查询条件计算总数据条数=="+count);
		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("chargeList", chargeList);
		request.getSession().setAttribute("chargeCount", count);
		request.getSession().setAttribute("chargeSize", size);
		
		return "/WEB-INF/view/portion/charge_query_body";
		
	}

	@RequestMapping(value= "/toChargeMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toChargeMain===");
		return "/WEB-INF/view/portion/charge_query_main";
		
	}
	
	@RequestMapping(value= "/charge_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/charge_query_top===");
		return "/WEB-INF/view/portion/charge_query_top";
		
	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面首次进入默认查询
	 */
	@RequestMapping(value= "/charge_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/charge_query_body===");
		
		ChargeBean reqDto = new ChargeBean();
		
		//根据前端每页展示数据条数
		PageVO<ChargeBean> pageVO = new PageVO<ChargeBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<ChargeBean> chargeList = chargeService.pageListQueryCharge(pageVO, reqDto);
		if(chargeList !=null && chargeList.size()>0){
			logger.info("/根据默认条件计算总数据条数chargeList.size()==="+chargeList.size());
		}
		//根据相同查询条件计算总数据条数
		int count = chargeService.pageCountQueryCharge(reqDto);
		logger.info("/根据默认条件计算总数据条数=="+count);
		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("chargeList", chargeList);
		request.getSession().setAttribute("chargeCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/portion/charge_query_body";

	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面明细查询
	 */
	@RequestMapping(value= "/chargeDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/charge_query_detail===");
		String bookId = request.getParameter("bookId");
		logger.info("/查询明细bookId==="+bookId);
		ChargeBean cb = chargeService.detailQueryCharge(bookId);
		String bookTime = TextFormater.format(cb.getBookTime(), "yyyy-MM-dd HH:mm:ss");
		request.setAttribute("cb", cb);
		request.setAttribute("bookTime", bookTime);
		
		return "/WEB-INF/view/portion/charge_query_detail";
		
	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/chargePageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryChargePage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/chargePageList===");
		
		//设置session参数（session级别查询条件）
		PageVO<ChargeBean> pageVO = (PageVO<ChargeBean>) request.getSession().getAttribute("pageVo");
		ChargeBean reqDto = (ChargeBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<ChargeBean> chargeList = chargeService.pageListQueryCharge(pageVO, reqDto);
		if(chargeList !=null && chargeList.size()>0){
			logger.info("/chargeList.size()==="+chargeList.size());
		}
		request.getSession().setAttribute("chargeList", chargeList);
		
		return "/WEB-INF/view/portion/charge_query_body";
		
	}


}
