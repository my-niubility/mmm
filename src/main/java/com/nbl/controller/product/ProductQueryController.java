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
import com.nbl.jspbean.product.StandardProductBean;
import com.nbl.services.product.PublishProductService;

@RequestMapping(value= "/product")
@Controller
public class ProductQueryController {

	private final static Logger logger = LoggerFactory.getLogger(ProductQueryController.class); 
	
	@Resource
	private PublishProductService publishProductService;
 
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:提交查询处理
	 */
	@RequestMapping(value= "/productQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/productQuery===");
		
		String productId = request.getParameter("productId");
		String startdt = request.getParameter("startdt");
		String enddt = request.getParameter("enddt");
		String repayMode = request.getParameter("repayMode");
		String productType = request.getParameter("productType");
		String productStatus = request.getParameter("productStatus");
		
		StandardProductBean cb = new StandardProductBean();
		if(productId == null || "".equals(productId)){
			cb.setProductId(null);
		}else{
			cb.setProductId(productId);
		}
		
		if(startdt == null || "".equals(startdt)){
			cb.setStartdt(null);
		}else{
			cb.setStartdt(startdt);
		}
		
		if(enddt == null || "".equals(enddt)){
			cb.setEnddt(null);
		}else{
			cb.setEnddt(enddt);
		}
		
		if(repayMode ==null || "".equals(repayMode)||"9".equals(repayMode)){
			cb.setRentMode(null);
		}else{
			cb.setRentMode(repayMode);
		}
		
		if(productType ==null ||"".equals(productType)||"999".equals(productType)){
			cb.setProductType(null);
		}else{
			cb.setProductType(productType);
		}
		
		if(productStatus == null || "".equals(productStatus)||"00".equals(productStatus)){
			cb.setProductStatus(null);
		}else{
			cb.setProductStatus(productStatus);
		}
		
		//根据前端每页展示数据条数
		PageVO<StandardProductBean> pageVO = new PageVO<StandardProductBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<StandardProductBean> pruductList = publishProductService.queryListStandardProduct(pageVO, cb);
		if(pruductList !=null && pruductList.size()>0){
			logger.info("/pruductList.size()==="+pruductList.size());
		}
		//根据相同查询条件计算总数据条数
		int count = publishProductService.queryCountStandardProduct(cb);
		logger.info("/根据相同查询条件计算总数据条数=="+count);
		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", cb);
		request.getSession().setAttribute("pruductList", pruductList);
		request.getSession().setAttribute("productCount", count);
		request.getSession().setAttribute("pageSize", 8);

		return "/WEB-INF/view/product/product_query_body";
		
	}

	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:默认进入处理
	 */
	@RequestMapping(value= "/product_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/product_query_body===");
		
		//默认查询
		StandardProductBean cb = new StandardProductBean();
		//根据前端每页展示数据条数
		PageVO<StandardProductBean> pageVO = new PageVO<StandardProductBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<StandardProductBean> cbList = publishProductService.queryListStandardProduct(pageVO, cb);
		if(cbList !=null && cbList.size()>0){
			logger.info("/根据默认条件计算总数据条数cbList.size()==="+cbList.size());
		}
		//根据相同查询条件计算总数据条数
		int count = publishProductService.queryCountStandardProduct(cb);
		logger.info("/根据默认条件计算总数据条数=="+count);

		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", cb);

		request.getSession().setAttribute("pruductList", cbList);
		request.getSession().setAttribute("productCount", count);
		request.getSession().setAttribute("pageSize", 8);
		
		return "/WEB-INF/view/product/product_query_body";
		
	}


	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/productQuery/pageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryChargePage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/productQuery/pageList===");
		
		//设置session参数（session级别查询条件）
		PageVO<StandardProductBean> pageVO = (PageVO<StandardProductBean>) request.getSession().getAttribute("pageVo");
		StandardProductBean cb = (StandardProductBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<StandardProductBean> cbList = publishProductService.queryListStandardProduct(pageVO, cb);
		if(cbList !=null && cbList.size()>0){
			logger.info("/cbList.size()==="+cbList.size());
		}
		
		request.getSession().setAttribute("pruductList", cbList);
		
		return "/WEB-INF/view/product/product_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:产品明细查询
	 */
	@RequestMapping(value= "/productDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryProductDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/productDetail===");
		
		String productId = request.getParameter("productId");
		StandardProductBean cb = publishProductService.queryProductDetail(productId);
		request.setAttribute("product", cb);
		
		return "/WEB-INF/view/product/product_query_detail";
		
	}
	
	
	@RequestMapping(value= "/toQueryMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/queryMain===");
		return "/WEB-INF/view/product/product_query_main";
		
	}
	
	@RequestMapping(value= "/product_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/product_query_top===");
		return "/WEB-INF/view/product/product_query_top";
		
	}


}
