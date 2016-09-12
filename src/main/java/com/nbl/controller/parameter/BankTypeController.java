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
import com.nbl.jspbean.parameter.BankTypeBean;
import com.nbl.services.parameter.BankTypeService;

/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 银行卡类别控制层
 */
@RequestMapping("/bankType")
@Controller
public class BankTypeController {
	
	private static final Logger logger = LoggerFactory.getLogger(BankTypeController.class);
	
	@Resource 
	private BankTypeService bankTypeService;
	
	@RequestMapping(value="/bankTypeQuery",method = {RequestMethod.POST,RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("----bankTypeQuery----");
		
		String bankType = request.getParameter("bankType");//类别编号
		String bankName = request.getParameter("bankName");//名称
		
		BankTypeBean reqDto = new BankTypeBean();
		reqDto.setBankName(bankName);
		reqDto.setBankType(bankType);
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<BankTypeBean> pageVO = new PageVO<BankTypeBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<BankTypeBean> bankTypeList = bankTypeService.pageListQueryBankType(pageVO, reqDto);
		if(bankTypeList !=null && bankTypeList.size()>0){
			logger.info("/bankTypeList.size()==="+bankTypeList.size());
		}
		//查询总条数
		int count = bankTypeService.pageCountQueryBankType(reqDto);
		logger.info("/查询业务场景步骤条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("bankTypeList", bankTypeList);
		request.getSession().setAttribute("bankTypeCount", count);
		request.getSession().setAttribute("chargeSize", size);
		
		return "/WEB-INF/view/parameter/bankType_query_body";
	}
	
	@RequestMapping(value= "/bankType_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/bankType_query_body===");
		
		BankTypeBean reqDto = new BankTypeBean();
		//每页展示数据条数
		PageVO<BankTypeBean> pageVO = new PageVO<BankTypeBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<BankTypeBean> bankTypeList = bankTypeService.pageListQueryBankType(pageVO, reqDto);
		if(bankTypeList !=null && bankTypeList.size()>0){
			logger.info("/bankTypeList.size()==="+bankTypeList.size());
		}
		//查询总条数
		int count = bankTypeService.pageCountQueryBankType(reqDto);
		logger.info("/银行类别条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("bankTypeList", bankTypeList);
		request.getSession().setAttribute("bankTypeCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		
		return "/WEB-INF/view/parameter/bankType_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/bankTypePageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/bankTypePageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<BankTypeBean> pageVO = (PageVO<BankTypeBean>) request.getSession().getAttribute("pageVo");
		BankTypeBean reqDto = (BankTypeBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<BankTypeBean> bankTypeList = bankTypeService.pageListQueryBankType(pageVO, reqDto);
		if(bankTypeList !=null && bankTypeList.size()>0){
			logger.info("/bankTypeList.size()==="+bankTypeList.size());
		}
		request.getSession().setAttribute("bankTypeList", bankTypeList);
		
		return "/WEB-INF/view/parameter/bankType_query_body";
		
	}

	@RequestMapping(value= "/toBankTypeMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toBankTypeMain===");
		return "/WEB-INF/view/parameter/bankType_query_main";
		
	}
	
	@RequestMapping(value= "/bankType_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/bankType_query_top===");
		return "/WEB-INF/view/parameter/bankType_query_top";
		
	}
}
