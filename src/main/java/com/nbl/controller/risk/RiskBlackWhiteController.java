package com.nbl.controller.risk;

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
import com.nbl.jspbean.risk.RiskBlackWhiteBean;
import com.nbl.services.risk.RiskBlackWhiteService;

/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 黑白名单控制层
 */
@RequestMapping("/risk")
@Controller
public class RiskBlackWhiteController {
	
	private static final Logger logger = LoggerFactory.getLogger(RiskBlackWhiteController.class);
	
	@Resource
	private RiskBlackWhiteService riskBlackWhiteService;
	
	@RequestMapping(value="/blackWhiteQuery",method = {RequestMethod.POST,RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("----blackWhiteQuery----");
		
		String custId = request.getParameter("custId");//客户ID
		String bwType = request.getParameter("bwType");//黑白类型		BLACK:黑名单		WHITE:白名单
		String type = request.getParameter("type");//业务类型
		
		RiskBlackWhiteBean reqDto = new RiskBlackWhiteBean();
		reqDto.setCustId(custId);
		reqDto.setType(type);
		if ("NO".equals(bwType)) {
			reqDto.setBwType(null);
		} else {
			reqDto.setBwType(bwType);
		}
		if ("NO".equals(type)) {
			reqDto.setType(null);
		} else {
			reqDto.setType(bwType);
		}
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<RiskBlackWhiteBean> pageVO = new PageVO<RiskBlackWhiteBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<RiskBlackWhiteBean> blackWhiteList = riskBlackWhiteService.pageListQueryBlackWhite(pageVO, reqDto);
		if(blackWhiteList !=null && blackWhiteList.size()>0){
			logger.info("/blackWhiteList.size()==="+blackWhiteList.size());
		}
		//查询总条数
		int count = riskBlackWhiteService.pageCountQueryBlackWhite(reqDto);
		logger.info("/查询业务场景步骤条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("blackWhiteList", blackWhiteList);
		request.getSession().setAttribute("blackWhiteCount", count);
		request.getSession().setAttribute("chargeSize", size);
		
		return "/WEB-INF/view/risk/blackWhite_query_body";
	}
	
	@RequestMapping(value= "/blackWhite_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/blackWhite_query_body===");
		
		RiskBlackWhiteBean reqDto = new RiskBlackWhiteBean();
		//每页展示数据条数
		PageVO<RiskBlackWhiteBean> pageVO = new PageVO<RiskBlackWhiteBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<RiskBlackWhiteBean> blackWhiteList = riskBlackWhiteService.pageListQueryBlackWhite(pageVO, reqDto);
		if(blackWhiteList !=null && blackWhiteList.size()>0){
			logger.info("/blackWhiteList.size()==="+blackWhiteList.size());
		}
		//查询总条数
		int count = riskBlackWhiteService.pageCountQueryBlackWhite(reqDto);
		logger.info("/查询黑白名单条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("blackWhiteList", blackWhiteList);
		request.getSession().setAttribute("blackWhiteCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/risk/blackWhite_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/blackWhitePageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/blackWhitePageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<RiskBlackWhiteBean> pageVO = (PageVO<RiskBlackWhiteBean>) request.getSession().getAttribute("pageVo");
		RiskBlackWhiteBean reqDto = (RiskBlackWhiteBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<RiskBlackWhiteBean> blackWhiteList = riskBlackWhiteService.pageListQueryBlackWhite(pageVO, reqDto);
		if(blackWhiteList !=null && blackWhiteList.size()>0){
			logger.info("/blackWhiteList.size()==="+blackWhiteList.size());
		}
		request.getSession().setAttribute("blackWhiteList", blackWhiteList);
		
		return "/WEB-INF/view/risk/blackWhite_query_body";
		
	}

	@RequestMapping(value= "/toBlackWhiteMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toBlackWhiteMain===");
		return "/WEB-INF/view/risk/blackWhite_query_main";
		
	}
	
	@RequestMapping(value= "/blackWhite_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/blackWhite_query_top===");
		return "/WEB-INF/view/risk/blackWhite_query_top";
		
	}
}
