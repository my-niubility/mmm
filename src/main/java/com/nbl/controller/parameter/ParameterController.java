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
import com.nbl.jspbean.parameter.GeneralParameterBean;
import com.nbl.services.parameter.GenParameterService;

/**
 * @author gcs
 * @createdate 2016年7月26日	
 * @version 1.0
 * 参数配置查询控制层
 */

@RequestMapping("parameter")
@Controller
public class ParameterController {
	
	private static final Logger logger = LoggerFactory.getLogger(ParameterController.class);
	
	@Resource
	private GenParameterService genParameterService;
	
	@RequestMapping(value="/parameterQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("/parameterQuery===");
		String code = request.getParameter("code");//系统参数代码  
		String parName = request.getParameter("parName");//系统参数名称
		
		GeneralParameterBean reqDto = new GeneralParameterBean();
		reqDto.setCode(code);
		reqDto.setParName(parName);
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<GeneralParameterBean> pageVO = new PageVO<GeneralParameterBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<GeneralParameterBean> parameterList = genParameterService.pageListQueryGenParameter(pageVO, reqDto);
		if(parameterList !=null && parameterList.size()>0){
			logger.info("/parameterList.size()==="+parameterList.size());
		}
		//查询总条数
		int count = genParameterService.pageCountQueryGenParameter(reqDto);
		logger.info("/查询系统参数信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("parameterList", parameterList);
		request.getSession().setAttribute("parameterCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/parameter/parameter_query_body";
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面首次进入默认查询
	 * */
	
	@RequestMapping(value="/parameter_query_body",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryBody(HttpServletRequest request,HttpServletResponse response){
		logger.info("/parameter_query_body---");
		GeneralParameterBean reqDto = new GeneralParameterBean();
		
		//每页展示数据条数
		PageVO<GeneralParameterBean> pageVO = new PageVO<GeneralParameterBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<GeneralParameterBean> parameterList = genParameterService.pageListQueryGenParameter(pageVO, reqDto);
		if(parameterList !=null && parameterList.size()>0){
			logger.info("/parameterList.size()==="+parameterList.size());
		}
		//查询总条数
		int count = genParameterService.pageCountQueryGenParameter(reqDto);
		logger.info("/查询系统参数信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("parameterList", parameterList);
		request.getSession().setAttribute("parameterCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		return "/WEB-INF/view/parameter/parameter_query_body";
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/parameterPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/parameterPageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<GeneralParameterBean> pageVO = (PageVO<GeneralParameterBean>) request.getSession().getAttribute("pageVo");
		GeneralParameterBean reqDto = (GeneralParameterBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<GeneralParameterBean> parameterList = genParameterService.pageListQueryGenParameter(pageVO, reqDto);
		if(parameterList !=null && parameterList.size()>0){
			logger.info("/parameterList.size()==="+parameterList.size());
		}
		request.getSession().setAttribute("parameterList", parameterList);
		
		return "/WEB-INF/view/parameter/parameter_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:根据ID来修改信息
	 */
	@RequestMapping(value= "/parameterDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  detailParameter(HttpServletRequest request, HttpServletResponse response){
		logger.info("/-----查询个人客户明细parameterModify-----");
		Integer id = Integer.parseInt(request.getParameter("id"));
		logger.info("-----根据id来修改数据----:{}",id);
		GeneralParameterBean cb = genParameterService.generalParameterDetail(id);
			
		request.setAttribute("parameter", cb);
		return "/WEB-INF/view/parameter/parameter_modify";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:根据ID来修改信息
	 */
	@RequestMapping(value= "/parameterModify",method = {RequestMethod.POST, RequestMethod.GET})
	public String  modifyParameter(HttpServletRequest request, HttpServletResponse response){
		logger.info("/-----查询个人客户明细parameterModify-----");
		Integer id = Integer.parseInt(request.getParameter("id"));
		String code = request.getParameter("code");
		String parName = request.getParameter("parName");
		String parValue = request.getParameter("parValue");
		String reMark = request.getParameter("reMark");
		logger.info("-----根据id来修改数据----:{}",id);
		boolean flag = genParameterService.generalParameterModify(id, code, parName, parValue, reMark);
		
		if (flag) {
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}else{
			request.setAttribute("conName", "遗憾");
			request.setAttribute("modFlag", "失败");
		}
		request.setAttribute("code", code);
		return "/WEB-INF/view/parameter/parameter_modifyResult";
		
	}
	
	
	@RequestMapping(value="/toParameterMain",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryMain(HttpServletRequest request,HttpServletResponse response){
		logger.info("/toParameterMain---");
		return "/WEB-INF/view/parameter/parameter_query_main";
	}
	
	@RequestMapping(value="/parameter_query_top",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryTop(HttpServletRequest request,HttpServletResponse response){
		logger.info("/parameter_query_top---");
		return "/WEB-INF/view/parameter/parameter_query_top";
	}
}
