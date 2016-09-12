package com.nbl.controller.customer;

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
import com.nbl.jspbean.customer.PersonAndUserBean;
import com.nbl.services.customer.CustPersonService;

/**
 * @author gcs
 * @createdate 2016年7月8日
 * @version 1.0
 * @description  个人客户管理控制层
 * 
 * */

@RequestMapping(value="/customer")
@Controller
public class CustomerManageController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerManageController.class);
	@Resource
	private CustPersonService custPersonService;
	/**
	 * @param request
	 * @param response
	 * @return
	 * @deprecated:提交查询
	 * */
	@RequestMapping(value="/custPerQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("/custPerQuery===");
		String registeredType = request.getParameter("registeredType");//注册类型  gateway:网关   portal:门户
		String credentialsType = request.getParameter("credentialsType");//证件类型 P01：居民身份证  P04：军人证  P31：护照  C01：营业执照  C09：组织机构代码证
		String name = request.getParameter("name");//姓名
	    String identityCardNumber = request.getParameter("identityCardNumber");//证件号码
		String status = request.getParameter("status");//冻结状态  effective:有效的 frozen:冻结的
		String certStatus = request.getParameter("certStatus");//认证状态 0：没认证 1：已认证 2：认证中 3：认证失败
		String regChanCode = request.getParameter("regChanCode");//注册渠道编码  001：门户网站 002：ios手机客户端 003：android手机客户端 004：微信 005：微博  006：其他
		
		PersonAndUserBean reqDto = new PersonAndUserBean();
		//NO、9、  999 表示没有选择直接查询
		if("NO".equals(registeredType)){
			reqDto.setRegisteredType(null);
		}else{
			reqDto.setRegisteredType(registeredType);
		}
		if("NO".equals(credentialsType)){
			reqDto.setCredentialsType(null);
		}else{
			reqDto.setCredentialsType(credentialsType);
		}
		reqDto.setName(name);
		reqDto.setIdentityCardNumber(identityCardNumber);
		if ("NO".equals(status)) {
			reqDto.setStatus(null);
		} else {
			reqDto.setStatus(status);
		}
		if ("9".equals(certStatus)) {
			reqDto.setCertStatus(null);
		} else {
			reqDto.setCertStatus(certStatus);
		}
		if ("NO".equals(regChanCode)) {
			reqDto.setRegChanCode(null);
		} else {
			reqDto.setRegChanCode(regChanCode);
		}
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<PersonAndUserBean> pageVO = new PageVO<PersonAndUserBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<PersonAndUserBean> custPersonList = custPersonService.pageListQueryCustPerson(pageVO, reqDto);
		if(custPersonList !=null && custPersonList.size()>0){
			logger.info("/custPersonList.size()==="+custPersonList.size());
		}
		//查询总条数
		int count = custPersonService.pageCountQueryCustPerson(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("custPersonList", custPersonList);
		request.getSession().setAttribute("custPersonCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/customer/custPerson_query_body";
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面首次进入默认查询
	 * */
	
	@RequestMapping(value="/custPerson_query_body",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryBody(HttpServletRequest request,HttpServletResponse response){
		logger.info("/custPerson_query_body---");
		PersonAndUserBean reqDto = new PersonAndUserBean();
		
		//每页展示数据条数
		PageVO<PersonAndUserBean> pageVO = new PageVO<PersonAndUserBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<PersonAndUserBean> custPersonList = custPersonService.pageListQueryCustPerson(pageVO, reqDto);
		if(custPersonList !=null && custPersonList.size()>0){
			logger.info("/custPersonList.size()==="+custPersonList.size());
		}
		//查询总条数
		int count = custPersonService.pageCountQueryCustPerson(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("custPersonList", custPersonList);
		request.getSession().setAttribute("custPersonCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		return "/WEB-INF/view/customer/custPerson_query_body";
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/custPersonPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/custPersonPageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<PersonAndUserBean> pageVO = (PageVO<PersonAndUserBean>) request.getSession().getAttribute("pageVo");
		PersonAndUserBean reqDto = (PersonAndUserBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<PersonAndUserBean> custPersonList = custPersonService.pageListQueryCustPerson(pageVO, reqDto);
		if(custPersonList !=null && custPersonList.size()>0){
			logger.info("/custPersonList.size()==="+custPersonList.size());
		}
		request.getSession().setAttribute("custPersonList", custPersonList);
		
		return "/WEB-INF/view/customer/custPerson_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:根据身份证号查询个人详情
	 */
	@RequestMapping(value= "/custPersonDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  modifyPass(HttpServletRequest request, HttpServletResponse response){
		logger.info("/-----查询个人客户明细custPersonDetail-----");
		String id = request.getParameter("id");
		logger.info("-----根据身份证号id----:{}",id);
		PersonAndUserBean cb = custPersonService.custPersonDetail(id);
			
		request.setAttribute("custPerson", cb);
		return "/WEB-INF/view/customer/custPerson_query_detail";
		
	}
	
	
	@RequestMapping(value="/toCustPerMain",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryMain(HttpServletRequest request,HttpServletResponse response){
		logger.info("/toCustPerMain---");
		return "/WEB-INF/view/customer/custPerson_query_main";
	}
	
	@RequestMapping(value="/custPerson_query_top",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryTop(HttpServletRequest request,HttpServletResponse response){
		logger.info("/custPerson_query_top---");
		return "/WEB-INF/view/customer/custPerson_query_top";
	}
}
