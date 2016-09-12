package com.nbl.controller.product;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.dubbo.container.Main;
import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.customer.CustEnterpriseBean;
import com.nbl.jspbean.product.StandardProductBean;
import com.nbl.service.business.constant.RepayMode;
import com.nbl.services.customer.CustEnterpriseService;
import com.nbl.services.product.PublishProductService;
import com.nbl.utils.DateTimeUtils;

import ch.qos.logback.classic.net.SyslogAppender;

/**
 * @author Donald
 * @createdate 2016年7月13日
 * @version 1.0 
 * @description :发布标准系列产品
 */
@RequestMapping(value= "/publish")
@Controller
public class PublishStandardProductController {

	private final static Logger logger = LoggerFactory.getLogger(PublishStandardProductController.class); 
	
	@Resource
	private CustEnterpriseService enterpriseService;
	@Resource
	private PublishProductService publishProductService;

	@RequestMapping(value= "/project/standard_02",method = {RequestMethod.POST, RequestMethod.GET})
	public String  product02(HttpServletRequest request, HttpServletResponse response){
		logger.info("/project/standard_02===");
		//赋值
		StandardProductBean sp = this.setParameter(request);
		String productType = request.getParameter("productType");
		sp.setProductType(productType);
		logger.info("产品类型为           =   " + sp.getProductType());
		//默认查询
		CustEnterpriseBean cb = new CustEnterpriseBean();
		//根据前端每页展示数据条数
		PageVO<CustEnterpriseBean> pageVO = new PageVO<CustEnterpriseBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<CustEnterpriseBean> cbList = enterpriseService.pageListQueryEnterprise(pageVO, cb);
		if(cbList !=null && cbList.size()>0){
			logger.info("/根据默认条件计算总数据条数cbList.size()==="+cbList.size());
		}
		//根据相同查询条件计算总数据条数
		int count = enterpriseService.pageCountQueryEnterprise(cb);
		logger.info("/根据默认条件计算总数据条数=="+count);

		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", cb);

		request.getSession().setAttribute("cbList", cbList);
		request.getSession().setAttribute("accountCount", count);
		request.getSession().setAttribute("accountSize", 8);
		
		request.getSession().setAttribute("StandardProductBean", sp);
		
		return "/WEB-INF/view/product/standard_02_Product";
		
	}
	
	private StandardProductBean setParameter(HttpServletRequest request){
		
		StandardProductBean sp = new StandardProductBean();
		
		//获取页面数据
		String productName = request.getParameter("productName");//产品名称
		String startTime = request.getParameter("startTime");//募集开始时间
		String endTime = request.getParameter("endTime");//募集结束时间
		String productTittleType = request.getParameter("productTittleType");//产品小类
		String startdt = request.getParameter("startdt");//募集开始日期
		String enddt = request.getParameter("enddt");//募集结束日期
		String scale = request.getParameter("scale");//募集规模
		String unitcost = request.getParameter("unitcost");//产品单价
		String rate = request.getParameter("rate");//年化利率
		String scaleLimitFlag = request.getParameter("scaleLimitFlag");//投资上线标识 0 false 1 true
		String scaleLimit;
		if(scaleLimitFlag.equals("0")){
			scaleLimit = scale;
		}else{
			scaleLimit = request.getParameter("scaleLimit");//投资上线
		}
		String investMin = request.getParameter("investMin");//投资下限
		//0等额本息（月）2等额本金（月） 1一次还本付息（天） 3每月付息到期还本（月） 4每月付息到期还本（天）
		String rentMode = request.getParameter("rentMode"); 
		String holdday = request.getParameter("holdday");//融资期限
		String blockday = request.getParameter("blockday");//赎回锁定期：
		String transferFlag = request.getParameter("transferFlag");//0 true 1 false
		String tlockday = request.getParameter("tlockday");
		String rentType = request.getParameter("rentType");//计租方式 0次日记租 1成立记租
		String backday = request.getParameter("backday");//每月返租日期
		String nonbackday = request.getParameter("nonbackday");//正常回购日
		String contrday = request.getParameter("contrday");//合同到期日
		String establish = request.getParameter("establish");//空为 不限 1 比例 2 下线
		String xxEstabValue = request.getParameter("xxEstabValue");
		String blEstabValue = request.getParameter("blEstabValue");//不选为空
		String subsidyFlag = request.getParameter("subsidyFlag");//0不补贴 1 补贴
		String subsidyRate = request.getParameter("subsidyRate");//补贴利率
		String subsidyDay = request.getParameter("subsidyDay");//补贴天数
		String redType = request.getParameter("redType");//红包抵扣类型  01 抵扣券 02 总收益
		enddt = (endTime.substring(0, 10)).replace("-", "");
		int num = Integer.parseInt(holdday);
		if(rentMode.equals("1")){
			sp.setContrday(DateTimeUtils.dateAfter(enddt, num));
			sp.setBackday((DateTimeUtils.dateAfter(enddt, num)).substring(6, 8));//每月返回日期为最后两位
		}else if(rentMode.equals("4")){
			sp.setBackday(backday);
			sp.setContrday(DateTimeUtils.dateAfter(enddt, num));
		}else {
			sp.setBackday(backday);
			sp.setContrday(DateTimeUtils.dateMonth(enddt, num));
		}
		//前台如果没有传过来产品小类为标准产品
		if(StringUtils.isNotEmpty(productTittleType)){
			sp.setProductTittleType(productTittleType);
		}else{
			sp.setProductTittleType(null);
		}
		
		if("99".equals(redType)){
			sp.setRedType(null);
		}else{
			sp.setRedType(redType);
		}
		//还款方式是  1和4 剩余基数为1  其它的剩余期数为    融资期限
		if(rentMode.equals(RepayMode.ONCE.getValue()) || rentMode.equals(RepayMode.MODEPERIODREPAYREALDAY.getValue())){
			sp.setRemainTerms(1L);
		}else{
			sp.setRemainTerms(Long.parseLong(holdday));
		}
		
		sp.setBlEstabValue(blEstabValue);
		sp.setBlockday(blockday);
		
		
		sp.setEnddt(enddt);
		sp.setStartdt((startTime.substring(0, 10)).replace("-", ""));
		try {
			sp.setEndTime((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).parse(endTime));
			sp.setStartTime((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).parse(startTime));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		sp.setEstablish(establish);
		sp.setHoldday(holdday);
		sp.setNonbackday(nonbackday);
		sp.setProductName(productName);
		sp.setRate(rate);
		sp.setRentMode(rentMode);
		sp.setRentType(rentType);
		sp.setScale(scale);
		sp.setScaleLimit(scaleLimit);
		sp.setScaleLimitFlag(scaleLimitFlag);
		sp.setSubsidyFlag(subsidyFlag);
		sp.setSubsidyDay(subsidyDay);
		sp.setSubsidyRate(subsidyRate);
		sp.setTlockday(tlockday);
		sp.setTransferFlag(transferFlag);
		sp.setUnitcost(unitcost);
		sp.setXxEstabValue(xxEstabValue);
		sp.setInvestMin(Long.parseLong(investMin));
		sp.setFinancePortion(Long.parseLong(scale));
		
		return sp;
	}
	
	@RequestMapping(value= "/project/standard_03",method = {RequestMethod.POST, RequestMethod.GET})
	public String  product03(HttpServletRequest request, HttpServletResponse response){
		logger.info("/project/standard_03===");
		//赋值
		StandardProductBean sp = (StandardProductBean) request.getSession().getAttribute("StandardProductBean");
		
		String finChoice = request.getParameter("finChoice"); 
		//处理融资人Id、融资人名称
		String[] agr = finChoice.split(":");
		String financeId = agr[1];
		String financeName = agr[0];
		sp.setFinanceId(financeId);
		sp.setFinanceName(financeName);
		request.getSession().setAttribute("product", sp);

		return "/WEB-INF/view/product/standard_03_Product";
		
	}
	
	@RequestMapping(value= "/project/standard_pub",method = {RequestMethod.POST, RequestMethod.GET})
	public String  productPub(HttpServletRequest request, HttpServletResponse response){
		logger.info("/project/standard_pub===");
		//赋值
		StandardProductBean sp = (StandardProductBean) request.getSession().getAttribute("product");
		
		//保存
		boolean addFlag = publishProductService.publishStandard(sp);
		if(addFlag){
			//成功
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}else{
			//失败
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}

		request.setAttribute("productName", sp.getProductName());
		return "/WEB-INF/view/product/standard_rs_Product";
		
	}
	
	
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/project/standard_02/pageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryChargePage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/project/standard_02/pageList===");
		
		//设置session参数（session级别查询条件）
		PageVO<CustEnterpriseBean> pageVO = (PageVO<CustEnterpriseBean>) request.getSession().getAttribute("pageVo");
		CustEnterpriseBean cb = (CustEnterpriseBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<CustEnterpriseBean> cbList = enterpriseService.pageListQueryEnterprise(pageVO, cb);
		if(cbList !=null && cbList.size()>0){
			logger.info("/cbList.size()==="+cbList.size());
		}
		
		request.getSession().setAttribute("cbList", cbList);
		
		return "/WEB-INF/view/product/standard_02_Product";
		
	}
}
