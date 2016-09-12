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
import com.nbl.jspbean.parameter.DealTypeBean;
import com.nbl.services.parameter.DealService;



/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 业务场景步骤查询控制层
 */
@RequestMapping("deal")
@Controller
public class DealController {
	
	private static final Logger logger = LoggerFactory.getLogger(DealController.class);
	
	@Resource
	private DealService dealService; 
	
	@RequestMapping(value="/dealQuery",method = {RequestMethod.POST,RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("----dealQuery----");
		
		String optCode = request.getParameter("optCode");//业务编码
		String dealName = request.getParameter("dealName");//业务步骤名称
		
		DealTypeBean reqDto = new DealTypeBean();
		reqDto.setOptCode(optCode);
		reqDto.setDealName(dealName);
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<DealTypeBean> pageVO = new PageVO<DealTypeBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<DealTypeBean> dealList = dealService.pageListQueryDeal(pageVO, reqDto);
		if(dealList !=null && dealList.size()>0){
			logger.info("/dealList.size()==="+dealList.size());
		}
		//查询总条数
		int count = dealService.pageCountQueryDeal(reqDto);
		logger.info("/查询业务场景步骤条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("dealList", dealList);
		request.getSession().setAttribute("dealCount", count);
		request.getSession().setAttribute("chargeSize", size);
		
		return "/WEB-INF/view/parameter/deal_query_body";
	}
	
	@RequestMapping(value= "/deal_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/deal_query_body===");
		
		DealTypeBean reqDto = new DealTypeBean();
		//每页展示数据条数
		PageVO<DealTypeBean> pageVO = new PageVO<DealTypeBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<DealTypeBean> dealList = dealService.pageListQueryDeal(pageVO, reqDto);
		if(dealList !=null && dealList.size()>0){
			logger.info("/dealList.size()==="+dealList.size());
		}
		//查询总条数
		int count = dealService.pageCountQueryDeal(reqDto);
		logger.info("/查询业务场景步骤条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("dealList", dealList);
		request.getSession().setAttribute("dealCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/parameter/deal_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/dealPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/dealPageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<DealTypeBean> pageVO = (PageVO<DealTypeBean>) request.getSession().getAttribute("pageVo");
		DealTypeBean reqDto = (DealTypeBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<DealTypeBean> dealList = dealService.pageListQueryDeal(pageVO, reqDto);
		if(dealList !=null && dealList.size()>0){
			logger.info("/dealList.size()==="+dealList.size());
		}
		request.getSession().setAttribute("dealList", dealList);
		
		return "/WEB-INF/view/parameter/deal_query_body";
		
	}

	@RequestMapping(value= "/toDealMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toDealMain===");
		return "/WEB-INF/view/parameter/deal_query_main";
		
	}
	
	@RequestMapping(value= "/deal_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/deal_query_top===");
		return "/WEB-INF/view/parameter/deal_query_top";
		
	}
}
