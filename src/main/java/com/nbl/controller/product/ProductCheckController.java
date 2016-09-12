package com.nbl.controller.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value= "/product")
@Controller
public class ProductCheckController {

	private final static Logger logger = LoggerFactory.getLogger(ProductCheckController.class); 
	
	@RequestMapping(value= "/checkQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/checkQuery===");
		return "/WEB-INF/view/product/product_check_body";
		
	}

	@RequestMapping(value= "/toCheckMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toCheckMain===");
		return "/WEB-INF/view/product/product_check_main";
		
	}
	
	@RequestMapping(value= "/product_check_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/product_check_top===");
		return "/WEB-INF/view/product/product_check_top";
		
	}

	@RequestMapping(value= "/product_check_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/product_check_body===");
		return "/WEB-INF/view/product/product_check_body";
		
	}


}
