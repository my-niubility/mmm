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
import com.nbl.jspbean.portion.AccountReverseBean;
import com.nbl.services.portion.PositiveService;

/**
 * @author gcs
 * @createdate 2016年7月21日
 * @version 1.0
 * @description  冲正流水控制层
 * 
 * */

@RequestMapping(value= "/portion")
@Controller
public class PositiveQueryController {

	private final static Logger logger = LoggerFactory.getLogger(PositiveQueryController.class); 
	
	@Resource
	private PositiveService positiveService;
	
	@RequestMapping(value= "/positiveQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/positiveQuery===");
		AccountReverseBean reqDto = new AccountReverseBean();
		String id = request.getParameter("reverseId");
		String orgId = request.getParameter("orgBookId");
		if(id == ""){
			
		}else {
			Integer reverseId = Integer.parseInt(id);//交易单号
			reqDto.setReverseId(reverseId);
		}
		if(orgId == ""){
			
		}else {
			Long orgBookId = Long.parseLong(orgId);//原记账Id
			reqDto.setOrgBookId(orgBookId);
		}
		
		String payId = request.getParameter("payId");//支付订单号
		String drCustId = request.getParameter("drCustId");//借方客户ID
		String crCustId = request.getParameter("crCustId");//贷方客户ID
		reqDto.setPayId(payId);
		reqDto.setDrCustId(drCustId);
		reqDto.setCrCustId(crCustId);
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<AccountReverseBean> pageVO = new PageVO<AccountReverseBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<AccountReverseBean> positiveList = positiveService.pageListQueryPositive(pageVO, reqDto);
		if(positiveList !=null && positiveList.size()>0){
			logger.info("/positiveList.size()==="+positiveList.size());
		}
		//查询总条数
		int count = positiveService.pageCountQueryPositive(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("positiveList", positiveList);
		request.getSession().setAttribute("positiveCount", count);
		request.getSession().setAttribute("chargeSize", size);
		
		return "/WEB-INF/view/portion/positive_query_body";
		
	}
	
	@RequestMapping(value= "/positive_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/positive_query_body===");
		
		AccountReverseBean reqDto = new AccountReverseBean();
		//每页展示数据条数
		PageVO<AccountReverseBean> pageVO = new PageVO<AccountReverseBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<AccountReverseBean> positiveList = positiveService.pageListQueryPositive(pageVO, reqDto);
		if(positiveList !=null && positiveList.size()>0){
			logger.info("/positiveList.size()==="+positiveList.size());
		}
		//查询总条数
		int count = positiveService.pageCountQueryPositive(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("positiveList", positiveList);
		request.getSession().setAttribute("positiveCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		return "/WEB-INF/view/portion/positive_query_body";
		
	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/positivePageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/positivePageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<AccountReverseBean> pageVO = (PageVO<AccountReverseBean>) request.getSession().getAttribute("pageVo");
		AccountReverseBean reqDto = (AccountReverseBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<AccountReverseBean> positiveList = positiveService.pageListQueryPositive(pageVO, reqDto);
		if(positiveList !=null && positiveList.size()>0){
			logger.info("/rechargeList.size()==="+positiveList.size());
		}
		request.getSession().setAttribute("positiveList", positiveList);
		
		return "/WEB-INF/view/portion/positive_query_body";
		
	}
	
	@RequestMapping(value= "/positiveDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/positive_query_detail===");
		
		Integer reverseId = Integer.parseInt(request.getParameter("id"));
		logger.info("-----交易流水号id----:{}",reverseId);
		AccountReverseBean cb = positiveService.positiveDetail(reverseId);
			
		request.setAttribute("positive", cb);
		
		return "/WEB-INF/view/portion/positive_query_detail";
		
	}
	
	@RequestMapping(value= "/toPositiveMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toPositiveMain===");
		return "/WEB-INF/view/portion/positive_query_main";
		
	}
	
	@RequestMapping(value= "/positive_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/positive_query_top===");
		return "/WEB-INF/view/portion/positive_query_top";
		
	}

}
