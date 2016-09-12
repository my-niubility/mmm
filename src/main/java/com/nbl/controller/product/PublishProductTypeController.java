package com.nbl.controller.product;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbl.common.exception.MyBusinessRuntimeException;
import com.nbl.service.business.constant.ProductType;
import com.nbl.services.product.PublishProductService;

@RequestMapping(value= "/publish")
@Controller
public class PublishProductTypeController {

	private final static Logger logger = LoggerFactory.getLogger(PublishProductTypeController.class); 
	
	@Resource
	private PublishProductService publishSolarService;
	
	@RequestMapping(value= "/productType",method = {RequestMethod.POST, RequestMethod.GET})
	public String  productType(HttpServletRequest request, HttpServletResponse response){
		logger.info("/productType===");
		return "/WEB-INF/view/product/product_type";
		
	}
	
	@RequestMapping(value= "/selectType",method = {RequestMethod.POST, RequestMethod.GET})
	public String  selectType(HttpServletRequest request, HttpServletResponse response){
		
		String productType = request.getParameter("productType");
		logger.info("/selectType==:{}=",productType);

		if(ProductType.SOLAR.getValue().equals(productType)){
			
			request.getSession().setAttribute("productType",productType);
			return "/WEB-INF/view/product/pubSolar_01_Product";
		}else if(ProductType.ELECT.getValue().equals(productType)){
			
			request.getSession().setAttribute("productType",productType);
			return "/WEB-INF/view/product/elect_01_Product";
		}else if(ProductType.FUND.getValue().equals(productType)){
			
			request.getSession().setAttribute("productType",productType);
			return "/WEB-INF/view/product/fund_01_Product";
		}else if(ProductType.TRUST.getValue().equals(productType)){
			
			request.getSession().setAttribute("productType",productType);
			return "/WEB-INF/view/product/trust_01_Product";
		}else if(ProductType.ALLFUND.getValue().equals(productType)){
			
			request.getSession().setAttribute("productType",productType);
			return "/WEB-INF/view/product/allfund_01_Product";
		}else if(ProductType.STANDARD.getValue().equals(productType)){
			
			request.getSession().setAttribute("productType",productType);
			return "/WEB-INF/view/product/standard_01_Product";
		}else{
			throw new MyBusinessRuntimeException("");
		}
		
		
	}

}
