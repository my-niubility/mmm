package com.nbl.controller.product;

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
import com.nbl.jspbean.product.PositionBean;
import com.nbl.services.product.PositionService;

@RequestMapping(value= "/product")
@Controller
public class ProductPositionController {

	private final static Logger logger = LoggerFactory.getLogger(ProductPositionController.class); 
	
	@Resource
	private PositionService positionService;
	
	@RequestMapping(value= "/positionQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/positionQuery===");
		String productId = request.getParameter("productId");//产品ID
		String orderId = request.getParameter("orderId");//交易流水ID
		String custId = request.getParameter("custId");//持仓人ID
	    String subjectType = request.getParameter("subjectType");//资产负债标识（00 资产 01 负债）
		String positionCustType = request.getParameter("positionCustType");//持仓人类型	00：资管	01：投资 	02：其他应付
		String holdStatus = request.getParameter("holdStatus");//持有状态（00：持有01：转让中02：转让等待中 03：已转让 04：已退款05：已还款 06：持仓在途 07：待退款）
		
		PositionBean reqDto = new PositionBean();
		reqDto.setProductId(productId);
		reqDto.setOrderId(orderId);
		reqDto.setCustId(custId);
		
		//NO、9、  999 表示没有选择直接查询
		if("99".equals(subjectType)){
			reqDto.setSubjectType(null);
		}else{
			reqDto.setSubjectType(subjectType);
		}
		if("99".equals(positionCustType)){
			reqDto.setPositionCustType(null);
		}else{
			reqDto.setPositionCustType(positionCustType);
		}
		if("99".equals(holdStatus)){
			reqDto.setHoldStatus(null);
		}else{
			reqDto.setHoldStatus(holdStatus);
		}
		
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<PositionBean> pageVO = new PageVO<PositionBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<PositionBean> positionList = positionService.pageListQueryPosition(pageVO, reqDto);
		if(positionList !=null && positionList.size()>0){
			logger.info("/positionList.size()==="+positionList.size());
		}
		//查询总条数
		int count = positionService.pageCountQueryPosition(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("positionList", positionList);
		request.getSession().setAttribute("positionCount", count);
		request.getSession().setAttribute("chargeSize", size);
		
		return "/WEB-INF/view/product/product_position_body";
		
	}
	
	@RequestMapping(value= "/product_position_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/product_position_body===");
		
		PositionBean reqDto = new PositionBean();
		//每页展示数据条数
		PageVO<PositionBean> pageVO = new PageVO<PositionBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<PositionBean> positionList = positionService.pageListQueryPosition(pageVO, reqDto);
		if(positionList !=null && positionList.size()>0){
			logger.info("/positionList.size()==="+positionList.size());
		}
		//查询总条数
		int count = positionService.pageCountQueryPosition(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("positionList", positionList);
		request.getSession().setAttribute("positionCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/product/product_position_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/positionPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/positionPageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<PositionBean> pageVO = (PageVO<PositionBean>) request.getSession().getAttribute("pageVo");
		PositionBean reqDto = (PositionBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<PositionBean> positionList = positionService.pageListQueryPosition(pageVO, reqDto);
		if(positionList !=null && positionList.size()>0){
			logger.info("/positionList.size()==="+positionList.size());
		}
		request.getSession().setAttribute("positionList", positionList);
		
		return "/WEB-INF/view/product/product_position_body";
		
	}

	@RequestMapping(value= "/positionDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  positionDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/positionDetail===");
		
		String id = request.getParameter("id");
		logger.info("-----交易持仓流水号id----:{}",id);
		PositionBean cb = positionService.positionDetail(id);
			
		request.setAttribute("position", cb);
		
		return "/WEB-INF/view/product/product_position_detail";
		
	}
	

	@RequestMapping(value= "/toPositionMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toPositionMain===");
		return "/WEB-INF/view/product/product_position_main";
		
	}
	
	@RequestMapping(value= "/product_position_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/product_position_top===");
		return "/WEB-INF/view/product/product_position_top";
		
	}

}
