package com.nbl.controller.product;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.product.StandardProductBean;
import com.nbl.service.business.constant.ProductStatus;
import com.nbl.services.product.PublishProductService;
import com.nbl.services.product.ShelfManagerService;
import com.nbl.utils.cache.ProductShelfCache;

/**
 * @author Donald
 * @createdate 2016年7月27日
 * @version 1.0 
 * @description :产品货架管理
 */
@RequestMapping(value= "/shelfmanager")
@Controller
public class ProductShelfManageController {

	private final static Logger logger = LoggerFactory.getLogger(ProductShelfManageController.class); 
	@Resource
	private PublishProductService publishProductService;
	
	@Resource
	private ProductShelfCache productShelfCache;
	
	@Resource
	private ShelfManagerService shelfManagerService;
	
	@RequestMapping(value= "/toManager")
	public String roleAdd(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toManager===");
		//查询待上架的产品信息
		StandardProductBean cb = new StandardProductBean();
		cb.setProductStatus(ProductStatus.PRODUCT_STATUS02.getValue());//待上架
		//根据前端每页展示数据条数
		PageVO<StandardProductBean> pageVO = new PageVO<StandardProductBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<StandardProductBean> upPruductList = publishProductService.queryListStandardProduct(pageVO, cb);
		if(upPruductList !=null && upPruductList.size()>0){
			logger.info("/待上架的产品数量upPruductList.size()==="+upPruductList.size());
		}
		
		//查询已经上架的产品信息
		List<StandardProductBean> offPruductList = shelfManagerService.getAllUpShelfProduct();
		if(offPruductList !=null && offPruductList.size()>0){
			logger.info("/已经上架的产品数量offPruductList.size()==="+offPruductList.size());
		}

		request.getSession().setAttribute("upPruductList", upPruductList);
		request.getSession().setAttribute("offPruductList", offPruductList);

		return "/WEB-INF/view/product/product_shelf_manager";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:新产品第一次上架或已上架产品管理
	 */
	@RequestMapping(value= "/upoffshelf")
	public String upshelf(HttpServletRequest request, HttpServletResponse response){
		logger.info("/upshelfQuery===");
		String upflag = request.getParameter("upflag");// 上架标识为0
		String offflag = request.getParameter("offflag");//下架标识为1
		String[] productAll = request.getParameterValues("productId");
		//货架NO1
		String[] offShelf1Value = request.getParameterValues("offshelf1");
		//货架NO1
		String[] upShelf1Value = request.getParameterValues("upshelf1");
		//货架NO2
		String[] offShelf2Value = request.getParameterValues("offshelf2");
		//货架NO2
		String[] upShelf2Value = request.getParameterValues("upshelf2");
		//货架NO3
		String[] offShelf3Value = request.getParameterValues("offshelf3");
		//货架NO3
		String[] upShelf3Value = request.getParameterValues("upshelf3");
		//货架NO4
		String[] offShelf4Value = request.getParameterValues("offshelf4");
		//货架NO4
		String[] upShelf4Value = request.getParameterValues("upshelf4");
		//货架NO5
		String[] offShelf5Value = request.getParameterValues("offshelf5");
		//货架NO5
		String[] upShelf5Value = request.getParameterValues("upshelf5");
		//货架NO6
		String[] offShelf6Value = request.getParameterValues("offshelf6");
		//货架NO6
		String[] upShelf6Value = request.getParameterValues("upshelf6");
		//货架NO7
		String[] offShelf7Value = request.getParameterValues("offshelf7");
		//货架NO7
		String[] upShelf7Value = request.getParameterValues("upshelf7");
		
		
		//处理新产品第一次上架
		if(StringUtils.isNoneEmpty(upflag) && upflag.equals("0")){
			if((upShelf1Value !=null && upShelf1Value.length>0) ||(upShelf2Value !=null && upShelf2Value.length>0)||(upShelf3Value !=null && upShelf3Value.length>0)||(upShelf4Value !=null && upShelf4Value.length>0)||(upShelf5Value !=null && upShelf5Value.length>0)||(upShelf6Value !=null && upShelf6Value.length>0)||(upShelf7Value !=null && upShelf7Value.length>0)){
				logger.info("--第一次新品上架处理逻辑------");
				shelfManagerService.setNewProductShelf(upShelf1Value, upShelf2Value, upShelf3Value, upShelf4Value, upShelf5Value, upShelf6Value, upShelf7Value);
			}
		}
		
		
		//处理已上架产品管理
		if(StringUtils.isNoneEmpty(offflag) && offflag.equals("1")){
			if((offShelf1Value !=null && offShelf1Value.length>0)||(offShelf2Value !=null && offShelf2Value.length>0)||(offShelf3Value !=null && offShelf3Value.length>0)||(offShelf4Value !=null && offShelf4Value.length>0)||(offShelf5Value !=null && offShelf5Value.length>0)||(offShelf6Value !=null && offShelf6Value.length>0)||(offShelf7Value !=null && offShelf7Value.length>0)||
					(offShelf1Value == null && offShelf2Value == null  && offShelf3Value == null && offShelf4Value == null && offShelf5Value == null && offShelf6Value == null && offShelf7Value == null )){
				logger.info("--已上架产品处理逻辑------");
				shelfManagerService.offAndUpProductShelf(offShelf1Value, offShelf2Value, offShelf3Value, offShelf4Value, offShelf5Value, offShelf6Value, offShelf7Value,productAll);
			}
		}
		
		upflag = "0";
		offflag = "1";
		//查询待上架的产品信息
		StandardProductBean cb = new StandardProductBean();
		cb.setProductStatus(ProductStatus.PRODUCT_STATUS02.getValue());//待上架
		//根据前端每页展示数据条数
		PageVO<StandardProductBean> pageVO = new PageVO<StandardProductBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<StandardProductBean> upPruductList = publishProductService.queryListStandardProduct(pageVO, cb);
		if(upPruductList !=null && upPruductList.size()>0){
			logger.info("/待上架的产品数量upPruductList.size()==="+upPruductList.size());
		}
		
		//查询已经上架的产品信息
		List<StandardProductBean> offPruductList = shelfManagerService.getAllUpShelfProduct();
		if(offPruductList !=null && offPruductList.size()>0){
			logger.info("/已经上架的产品数量offPruductList.size()==="+offPruductList.size());
		}

		request.getSession().setAttribute("upPruductList", upPruductList);
		request.getSession().setAttribute("offPruductList", offPruductList);

		return "/WEB-INF/view/product/product_shelf_manager";
	}
}
