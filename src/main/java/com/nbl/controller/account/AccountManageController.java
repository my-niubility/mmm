package com.nbl.controller.account;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.account.LoginAccountBean;
import com.nbl.services.account.AccountService;
import com.nbl.utils.json.ResponseJson;
@RequestMapping(value= "/account")
@Controller
public class AccountManageController {

	private final static Logger logger = LoggerFactory.getLogger(AccountManageController.class); 
	@Resource
	private AccountService accountService;
	
	@RequestMapping(value= "/add")
	public ModelAndView accountAdd(HttpServletRequest request, HttpServletResponse response){
		logger.info("/account-add===");
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("/WEB-INF/view/account/account_add");
		return mv;
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:账户增加
	 */
	@RequestMapping(value= "/addResult")
	public ModelAndView accountAddResult(HttpServletRequest request, HttpServletResponse response){
		logger.info("/accountAddResult===");
		ModelAndView mv = new ModelAndView();
		//用户名称
		String accountName = request.getParameter("accountName");
		String password = request.getParameter("password");
		String cycPassword = request.getParameter("cycPassword");
		logger.info("--password--:{},--cycPassword--:{}",password,cycPassword);
		
		LoginAccountBean cb = new LoginAccountBean();
		cb.setAccountId(accountName);
		cb.setAccountName(accountName);
		cb.setEnableStatus("0");//可用
		cb.setLockStatus("0");//未锁定
		cb.setPartyId(request.getParameter("partyNumber"));
		cb.setMobile(request.getParameter("mobile"));
		cb.setRealName(request.getParameter("realName"));
		cb.setRoleId(request.getParameter("roleType"));
		cb.setPassword(cycPassword);
		
		boolean addFlag = accountService.accountAdd(cb);
		
		if(addFlag){
			//成功
			request.setAttribute("accountName", accountName);		
			mv.setViewName("/WEB-INF/view/account/account_addResult");
		}else{
			//失败
			request.setAttribute("accountName", accountName);		
			mv.setViewName("/WEB-INF/view/account/account_failure");
		}
		
		return mv;
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:账户是否存在检查
	 */
	@RequestMapping(value= "/checkQuery")
	public @ResponseBody ResponseJson accountCheckQuery(HttpServletRequest request, HttpServletResponse response){
		logger.info("/accountCheckQuery===");
		//用户名称
		String accountName = request.getParameter("accountName");
		boolean queryFlag = accountService.accountCheckQuery(accountName);
		if(queryFlag){
			//校验通过
			return new ResponseJson().success();
		}else{
			//校验失败，存在用户
			return new ResponseJson().failure();
		}
		
	}

	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:提交查询
	 */
	@RequestMapping(value= "/accountQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/accountQuery===");
		String accountId = request.getParameter("accountId");
		String partyId = request.getParameter("partyId");
		String roleId = request.getParameter("roleId");
		String lockStatus = request.getParameter("lockStatus");
		String enableStatus = request.getParameter("enableStatus");
		
		LoginAccountBean reqDto = new LoginAccountBean();
		reqDto.setAccountName(accountId);
		if("9".equals(enableStatus)){
			reqDto.setEnableStatus(null);
		}else{
			reqDto.setEnableStatus(enableStatus);
		}
		if("9".equals(lockStatus)){
			reqDto.setLockStatus(null);
		}else{
			reqDto.setLockStatus(lockStatus);
		}
		
		if("NO".equals(partyId)){
			reqDto.setPartyId(null);
		}else{
			reqDto.setPartyId(partyId);
		}
		if("NO".equals(roleId)){
			reqDto.setRoleId(null);
		}else{
			reqDto.setRoleId(roleId);
		}
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<LoginAccountBean> pageVO = new PageVO<LoginAccountBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数=="+size);
		//默认查询分页条数查询
		List<LoginAccountBean> accountList = accountService.pageListQueryAccount(pageVO, reqDto);
		if(accountList !=null && accountList.size()>0){
			logger.info("/accountList.size()==="+accountList.size());
		}
		//根据相同查询条件计算总数据条数
		int count = accountService.pageCountQueryAccount(reqDto);
		logger.info("/根据相同查询条件计算总数据条数=="+count);
		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("accountList", accountList);
		request.getSession().setAttribute("accountCount", count);
		request.getSession().setAttribute("chargeSize", size);
		
		return "/WEB-INF/view/account/account_query_body";
		
	}

	@RequestMapping(value= "/toAccountMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toAccountMain===");
		return "/WEB-INF/view/account/account_query_main";
		
	}
	
	@RequestMapping(value= "/account_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/account_query_top===");
		return "/WEB-INF/view/account/account_query_top";
		
	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面首次进入默认查询
	 */
	@RequestMapping(value= "/account_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/account_query_body===");
		
		LoginAccountBean reqDto = new LoginAccountBean();
		
		//根据前端每页展示数据条数
		PageVO<LoginAccountBean> pageVO = new PageVO<LoginAccountBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<LoginAccountBean> accountList = accountService.pageListQueryAccount(pageVO, reqDto);
		if(accountList !=null && accountList.size()>0){
			logger.info("/根据默认条件计算总数据条数chargeList.size()==="+accountList.size());
		}
		//根据相同查询条件计算总数据条数
		int count = accountService.pageCountQueryAccount(reqDto);
		logger.info("/根据默认条件计算总数据条数=="+count);
		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("accountList", accountList);
		request.getSession().setAttribute("accountCount", count);
		request.getSession().setAttribute("accountSize", 8);
		
		return "/WEB-INF/view/account/account_query_body";

	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面明细查询
	 */
	@RequestMapping(value= "/accountDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/account_query_detail===");
		String accountName = request.getParameter("accountName");
		logger.info("/查询明细accountName==="+accountName);
		LoginAccountBean cb = accountService.detailQueryAccount(accountName);
		//String bookTime = TextFormater.format(cb.getBookTime(), "yyyy-MM-dd HH:mm:ss");
		request.setAttribute("cb", cb);
		//request.setAttribute("bookTime", bookTime);
		
		return "/WEB-INF/view/account/account_query_detail";
		
	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/accountPageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/accountPageList===");
		
		//设置session参数（session级别查询条件）
		PageVO<LoginAccountBean> pageVO = (PageVO<LoginAccountBean>) request.getSession().getAttribute("pageVo");
		LoginAccountBean reqDto = (LoginAccountBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<LoginAccountBean> accountList = accountService.pageListQueryAccount(pageVO, reqDto);
		if(accountList !=null && accountList.size()>0){
			logger.info("/accountList.size()==="+accountList.size());
		}
		request.getSession().setAttribute("accountList", accountList);
		
		return "/WEB-INF/view/account/account_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:跳转修改密码页面
	 */
	@RequestMapping(value= "/toModifyPass",method = {RequestMethod.POST, RequestMethod.GET})
	public String  toModifyPass(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toModifyPass===");
		return "/WEB-INF/view/account/account_modifyPass";
		
	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:登录账户修改密码
	 */
	@RequestMapping(value= "/modifyPass",method = {RequestMethod.POST, RequestMethod.GET})
	public String  modifyPass(HttpServletRequest request, HttpServletResponse response){
		logger.info("/----start------------modifyPass===");
		String oldPass = request.getParameter("cycPasswordOld");
		String newPass = request.getParameter("cycPasswordNew");
		String loginName = request.getParameter("loginName");
		logger.info("--------requst---modify---loginName----:{}",loginName);
		boolean sucFlag = true;
		if(loginName !=null){
			//查询该用户是否存在
			LoginAccountBean cb = accountService.detailQueryAccount(loginName);
			if(cb != null){
				logger.info("--------requst---modify---account--is no empty--:{}",loginName);
				//比较初始密码是否相等
				if(oldPass.equals(cb.getPassword())){
					//修改密码
					boolean flag = accountService.modifyPass(loginName, newPass);
					//是否修改成功
					sucFlag = flag;
				}else{
					sucFlag = false;
				}
			}else{
				sucFlag = false;
			}
		}else{
			sucFlag = false;
		}
		if(sucFlag){
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}else{
			request.setAttribute("conName", "遗憾");
			request.setAttribute("modFlag", "失败");
		}
		request.setAttribute("loginName", loginName);
		return "/WEB-INF/view/account/account_modifyPassResult";
		
	}


}
