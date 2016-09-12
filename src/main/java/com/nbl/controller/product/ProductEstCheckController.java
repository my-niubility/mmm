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
import com.nbl.service.business.constant.ProductAuditResult;
import com.nbl.service.business.constant.ProductAuditType;
import com.nbl.service.business.constant.ProductStatus;
import com.nbl.service.business.dto.req.ProductAuditReqDto;
import com.nbl.services.product.ProductCheckService;
import com.nbl.services.product.PublishProductService;

/**
 * @author Donald
 * @createdate 2016年7月26日
 * @version 1.0 
 * @description :产品成立审核
 */
@RequestMapping(value= "/estcheck")
@Controller
public class ProductEstCheckController {

	private final static Logger logger = LoggerFactory.getLogger(ProductEstCheckController.class); 
	
	@Resource
	private PublishProductService publishProductService;
	
	@Resource
	private ProductCheckService productCheckService;
	
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
		
		cb.setProductStatus(ProductStatus.PRODUCT_STATUS04.getValue());//募结待审核
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

		return "/WEB-INF/view/product/product_estcheck_body";
		
	}

	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:默认进入处理
	 */
	@RequestMapping(value= "/product_estcheck_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/product_estcheck_body===");
		
		//默认查询
		StandardProductBean cb = new StandardProductBean();
		//根据前端每页展示数据条数
		PageVO<StandardProductBean> pageVO = new PageVO<StandardProductBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		cb.setProductStatus(ProductStatus.PRODUCT_STATUS04.getValue());//募结待审核
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
		
		return "/WEB-INF/view/product/product_estcheck_body";
		
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
		
		return "/WEB-INF/view/product/product_estcheck_body";
		
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
		
		return "/WEB-INF/view/product/product_estcheck_detail";
		
	}
	
	@RequestMapping(value= "/checkResult",method = {RequestMethod.POST, RequestMethod.GET})
	public String  checkResult(HttpServletRequest request, HttpServletResponse response){
		
		String productId = request.getParameter("productId");//产品
		String checkPerson = request.getParameter("checkPerson");//审核人
		String checkResult = request.getParameter("checkResult");//审核状态 0 失败 、1成功
		String failureMessage = request.getParameter("failureMessage");//失败原因
		logger.info("审核人：{}，审核产品：{}，审核状态：{}，失败原因：{}",checkPerson,productId,checkResult,failureMessage);
		
		ProductAuditReqDto reqDto = new ProductAuditReqDto();
		reqDto.setAuditUserId(checkPerson);
		reqDto.setDescription(failureMessage);
		reqDto.setProductId(productId);
		reqDto.setType(ProductAuditType.RAISE_AUDIT);
		reqDto.setPassed("1".equals(checkResult)?ProductAuditResult.PASSED:ProductAuditResult.NOTPASSED);
		boolean addFlag = productCheckService.productEstablishAudit(reqDto);
		if(addFlag){
			//成功
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}else{
			//失败
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}
		request.setAttribute("productName", reqDto.getProductId());
		
		return "/WEB-INF/view/product/standard_rs_Product";
		
	}
	
	@RequestMapping(value= "/toQueryMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/queryMain===");
		return "/WEB-INF/view/product/product_estcheck_main";
		
	}
	
	@RequestMapping(value= "/product_estcheck_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/product_estcheck_top===");
		return "/WEB-INF/view/product/product_estcheck_top";
		
	}


}
