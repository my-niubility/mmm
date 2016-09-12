package com.nbl.controller.role;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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

import com.nbl.jspbean.role.ResPermission;
import com.nbl.jspbean.role.Role;
import com.nbl.jspbean.role.RoleResource;
import com.nbl.service.manager.constant.SystemType;
import com.nbl.services.role.RoleManagerService;
import com.nbl.utils.cache.RoleResourceCache;
import com.nbl.utils.json.ResponseJson;
@RequestMapping(value= "/role")
@Controller
public class RoleManageController {

	private final static Logger logger = LoggerFactory.getLogger(RoleManageController.class); 
	@Resource
	private RoleManagerService roleManagerService;
	@Resource
	private RoleResourceCache roleResourceCache;
	
	
	@RequestMapping(value= "/add")
	public ModelAndView roleAdd(HttpServletRequest request, HttpServletResponse response){
		logger.info("/role-add===");
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("/WEB-INF/view/role/role_add");
		return mv;
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:角色增加
	 */
	@RequestMapping(value= "/addResult")
	public ModelAndView roleAddResult(HttpServletRequest request, HttpServletResponse response){
		logger.info("/roleAddResult===");
		ModelAndView mv = new ModelAndView();
		//用户名称
		Role role = new Role();
		
		//查询缓存数据
		List<String> resourceIdList = roleResourceCache.getResourceCache(SystemType.MANAGER);
		List<RoleResource> resList = new ArrayList<RoleResource>();
		//依次处理该角色，不同资源对应的权限设置
		for(String resId:resourceIdList){
			String[] perValue = request.getParameterValues(resId);
			//处理已经设置的
			if(perValue == null){
				continue;
			}
			//
			RoleResource res = new RoleResource();
			res.setResourceId(resId);
			List<ResPermission> perList = new ArrayList<ResPermission>();

			for(String perId:perValue){
				
				ResPermission resP = new ResPermission();
				resP.setPermId(perId);
				perList.add(resP);
			}
			res.setPermList(perList);
			resList.add(res);
		}
		logger.info("/角色创建人{}===",request.getParameter("creater"));
		role.setRoleId(request.getParameter("roleId"));
		role.setRoleName(request.getParameter("roleName"));
		role.setDescription(request.getParameter("description"));
		role.setCreater(request.getParameter("creater"));
		role.setResList(resList);
		//保存
		boolean addFlag = roleManagerService.saveRole(role);
		if(addFlag){
			//成功
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}else{
			//失败
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}
		request.setAttribute("roleName", request.getParameter("roleName"));
		mv.setViewName("/WEB-INF/view/role/role_addResult");
		return mv;
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:检查是否存在roleId
	 */
	@RequestMapping(value= "/checkRoleId")
	public @ResponseBody ResponseJson checkRoleId(HttpServletRequest request, HttpServletResponse response){
		logger.info("/checkRoleId===");
		//用户名称
		String roleId = request.getParameter("roleId");
		boolean queryFlag = roleManagerService.isExistRoleByRoleId(roleId);
		logger.info("----------check role by roleId:{}:,is:-----------",roleId,queryFlag);
		if(!queryFlag){
			logger.info("----------不存在该角色-----------");
			//校验通过
			return new ResponseJson().success();
		}else{
			logger.info("----------存在该角色----------");
			//校验失败，存在用户
			return new ResponseJson().failure();
		}
		
	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:检查是否存在roleName
	 */
	@RequestMapping(value= "/checkRoleName")
	public @ResponseBody ResponseJson checkRoleName(HttpServletRequest request, HttpServletResponse response){
		logger.info("/checkRoleName===");
		//用户名称
		String roleName = request.getParameter("roleName");
		boolean queryFlag = roleManagerService.isExistRoleByRoleName(roleName);
		if(!queryFlag){
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
	 * @description:角色查询
	 */
	@RequestMapping(value= "/roleQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/roleQuery===");
		List<Role> roleQueryList = roleManagerService.getAllRoles();

		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("roleQueryList", roleQueryList);
		
		return "/WEB-INF/view/role/role_query";
		
	}


	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:查询角色拥有的资源
	 */
	@RequestMapping(value= "/roleResDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryRoleResource(HttpServletRequest request, HttpServletResponse response){
		logger.info("/roleResDetail===");
		String roleId = request.getParameter("roleId");
		List<Role> roleList= roleManagerService.getResourceByRoleId(roleId);
		Set<String> roleSet = new HashSet<String>();
		if(roleList !=null && roleList.size()>0){
			//取出自己的信息
			Role role = roleList.get(0);

			List<RoleResource> roleResList = role.getResList();
			
			if(roleResList !=null && roleResList.size()>0){
				
				Iterator<RoleResource> rrIt = roleResList.iterator();
				while(rrIt.hasNext()){
					
					RoleResource roleRes = rrIt.next();
					
					String resId = roleRes.getResourceId();
					
					List<ResPermission> resPermList = roleRes.getPermList();
					if(resPermList !=null && resPermList.size()>0){
						
						Iterator<ResPermission> perIt = resPermList.iterator();
						while(perIt.hasNext()){
							ResPermission resPerm = perIt.next();
							
							String permId = resPerm.getPermId();
							logger.info("---资源resId：{}，对应的权限:{}",resId, permId);

							roleSet.add(resId+"_"+permId);
						}
					}
					
				}
			}
			role.setRoleId(roleId);
			//查询后保留原来的角色数据，以便更新使用
			request.getSession().setAttribute("oldRole", role);
		}
		
		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("roleId", roleId);
		
		//设置资源权限值
		Iterator<String> it = roleSet.iterator();
		while(it.hasNext()){
			String  resPerm = it.next();
			request.setAttribute(resPerm, "Y");
		}
		
		return "/WEB-INF/view/role/role_resource";

	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:角色修改
	 */
	@RequestMapping(value= "/modifyResult")
	public ModelAndView roleModifyResult(HttpServletRequest request, HttpServletResponse response){
		logger.info("/roleodifyResult===");
		ModelAndView mv = new ModelAndView();
		//用户名称
		Role role = new Role();
		
		//查询缓存数据
		List<String> resourceIdList = roleResourceCache.getResourceCache(SystemType.MANAGER);
		List<RoleResource> resList = new ArrayList<RoleResource>();
		//依次处理该角色，不同资源对应的权限设置
		for(String resId:resourceIdList){
			String[] perValue = request.getParameterValues(resId);
			//处理已经设置的
			if(perValue == null){
				logger.info("/没有准备提交的该数据，资源{}===",resId);
				continue;
			}
			//
			RoleResource res = new RoleResource();
			res.setResourceId(resId);
			List<ResPermission> perList = new ArrayList<ResPermission>();

			for(String perId:perValue){
				
				ResPermission resP = new ResPermission();
				resP.setPermId(perId);
				perList.add(resP);
				logger.info("/准备提交的修改数据，资源{}，权限{}===",resId,perId);
			}
			res.setPermList(perList);
			resList.add(res);
		}
		role.setRoleId(request.getParameter("roleId"));
		role.setResList(resList);
		
		//取出原来的角色数据，以便更新使用
		Role oldRole = (Role) request.getSession().getAttribute("oldRole");

		//保存
		boolean addFlag = roleManagerService.updateRole(role, oldRole);
		if(addFlag){
			//成功
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}else{
			//失败
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}
		mv.setViewName("/WEB-INF/view/role/role_modifyResult");
		return mv;
		
	}


}
