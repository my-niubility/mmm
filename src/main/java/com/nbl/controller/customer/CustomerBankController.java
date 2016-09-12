package com.nbl.controller.customer;

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
import com.nbl.jspbean.customer.CustBankBean;
import com.nbl.services.customer.CustBankService;

/**
 * @author gcs
 * @createdate 2016-07-12
 * @description 客户银行卡管理控制层
 * 
 * */

@RequestMapping("/custBank")
@Controller
public class CustomerBankController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerBankController.class);
	
	@Resource
	private CustBankService custBankService;
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @deprecated:提交查询
	 * */
	@RequestMapping(value="/custBankQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("/custBankQuery===");
		String custId = request.getParameter("custId");//客户ID
		String cardName = request.getParameter("cardName");//银行户名
		String cardNo = request.getParameter("cardNo");//银行卡号
		
		CustBankBean reqDto = new CustBankBean();
		reqDto.setCustId(custId);
		reqDto.setCardName(cardName);
		reqDto.setCardNo(cardNo);
		//NO、9、  999 表示没有选择直接查询
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<CustBankBean> pageVO = new PageVO<CustBankBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<CustBankBean> custBankList = custBankService.pageListQueryCustBankCard(pageVO, reqDto);
		if(custBankList !=null && custBankList.size()>0){
			logger.info("/custBankList.size()==="+custBankList.size());
		}
		//查询总条数
		int count = custBankService.pageCountQueryCustBank(reqDto);
		logger.info("/查询客户银行卡信息==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("custBankList", custBankList);
		request.getSession().setAttribute("custBankCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/customer/custBank_query_body";
	}
	
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面首次进入默认查询
	 * */
	
	@RequestMapping(value="/custBank_query_body",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryBody(HttpServletRequest request,HttpServletResponse response){
		logger.info("/custBank_query_body---");
		
		//每页展示数据条数
		PageVO<CustBankBean> pageVO = new PageVO<CustBankBean>();
		pageVO.setSize(8);
		//查询总条数
		request.getSession().setAttribute("chargeSize", 8);
		return "/WEB-INF/view/customer/custBank_query_body";
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/custBankPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----custBankPageList-----");
		
		//设置session参数（session级别查询条件）
		PageVO<CustBankBean> pageVO = (PageVO<CustBankBean>) request.getSession().getAttribute("pageVo");
		CustBankBean reqDto = (CustBankBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<CustBankBean> custBankList = custBankService.pageListQueryCustBankCard(pageVO, reqDto);
		
		if(custBankList !=null && custBankList.size()>0){
			logger.info("/custBankList.size()==="+custBankList.size());
		}
		
		request.getSession().setAttribute("custBankList", custBankList);
		
		return "/WEB-INF/view/customer/custBank_query_body";
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:根据ID来查询银行卡信息
	 */
	@RequestMapping(value= "/custBankDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  modifyPass(HttpServletRequest request, HttpServletResponse response){
		logger.info("-----查询银行卡信息custBankDetail-----");
		String id = request.getParameter("id");
		logger.info("-----根据身份证号id----:{}",id);
		CustBankBean cb = custBankService.custBankDetail(id);
			
		request.setAttribute("custBank", cb);
		return "/WEB-INF/view/customer/custBank_query_detail";
		
	}
	
	@RequestMapping(value="/toCustBankMain",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryMain(HttpServletRequest request,HttpServletResponse response){
		logger.info("-----toCustBankMain-----");
		return "/WEB-INF/view/customer/custBank_query_main";
	}
	
	@RequestMapping(value="/custBank_query_top",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryTop(HttpServletRequest request,HttpServletResponse response){
		logger.info("---custBank_query_top---");
		return "/WEB-INF/view/customer/custBank_query_top";
	}
	
}
