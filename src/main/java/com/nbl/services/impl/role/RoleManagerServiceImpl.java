package com.nbl.services.impl.role;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.jspbean.role.ResPermission;
import com.nbl.jspbean.role.Role;
import com.nbl.jspbean.role.RoleResource;
import com.nbl.service.manager.app.RoleResourcePermApp;
import com.nbl.service.manager.constant.SystemType;
import com.nbl.service.manager.dto.PermissionDto;
import com.nbl.service.manager.dto.ResourcePermDto;
import com.nbl.service.manager.dto.RoleDto;
import com.nbl.services.role.RoleManagerService;

@Service("roleManagerService")
public class RoleManagerServiceImpl implements RoleManagerService {
	private final static Logger logger = LoggerFactory.getLogger(RoleManagerServiceImpl.class); 

	@Resource
	private RoleResourcePermApp roleResourcePermApp;
	
	@Override
	public boolean saveRole(Role role) {
		
		RoleDto roleDto = new RoleDto();
		Set<ResourcePermDto> resDtoSet = new HashSet<ResourcePermDto>();
		
		//处理数据匹配
		List<RoleResource> resList = role.getResList();
		
		if(resList != null && resList.size()>0){
			Iterator<RoleResource> resIt = resList.iterator();
			while(resIt.hasNext()){
				ResourcePermDto resDto = new ResourcePermDto();

				RoleResource roleRes = resIt.next();
				resDto.setResourcesId(roleRes.getResourceId());
				resDto.setResourcesName(roleRes.getResourceName());
				
				List<ResPermission> perList = roleRes.getPermList();
				List<PermissionDto> permDtoList = new ArrayList<PermissionDto>();

				if(perList !=null && perList.size()>0){
					
					Iterator<ResPermission> perIt = perList.iterator();
					
					while(perIt.hasNext()){
						PermissionDto permDto = new PermissionDto();
						
						ResPermission resPerm = perIt.next();
						
						permDto.setPermissionId(resPerm.getPermId());
						permDto.setPermissionName(resPerm.getPermName());
						logger.info("---------管理平台循环处理资源权限数据，角色：{}，资源：{}，权限：{}---------",
								role.getRoleId(),roleRes.getResourceId(),resPerm.getPermId());
						permDtoList.add(permDto);
					}
					
				}
				resDto.setPermList(permDtoList);
				resDtoSet.add(resDto);
			}
			
		}
		
		roleDto.setRoleId(role.getRoleId());
		roleDto.setRoleName(role.getRoleName());
		roleDto.setCreater(role.getCreater());
		roleDto.setDescription(role.getDescription());
		roleDto.setPermissions(resDtoSet);
		
		return roleResourcePermApp.saveRole(roleDto);
	}

	@Override
	public List<Role> getSystemResource(SystemType systemType) {
		
		List<ResourcePermDto> resPermList =roleResourcePermApp.getSystemResource(systemType);
		
		return this.tranferRole(resPermList);
	}

	@Override
	public List<Role> getResourceByRoleId(String roleId) {
		List<ResourcePermDto> resPermList = roleResourcePermApp.getResourceByRoleId(roleId);
		
		return this.tranferRole(resPermList);
	}

	@Override
	public boolean isExistRoleByRoleId(String roleId) {
		return roleResourcePermApp.isExistRoleByRoleId(roleId);
	}

	@Override
	public boolean isExistRoleByRoleName(String roleName) {
		return roleResourcePermApp.isExistRoleByRoleName(roleName);
	}
	
	/**
	 * @param oldList
	 * @return
	 * @description:内部数据转换
	 */
	private List<Role> tranferRole(List<ResourcePermDto> oldList){
		
		List<Role> roleList = new ArrayList<Role>();
		List<RoleResource> roleResList = new ArrayList<RoleResource>();
		
		Role role = new Role();
		logger.info("---------管理平台循环处理资源权限数据，内部数据转换开始---------");

		if(oldList != null && oldList.size()>0){
			
			Iterator<ResourcePermDto> resIt = oldList.iterator();
			while(resIt.hasNext()){
				List<ResPermission> resPermList = new ArrayList<ResPermission>();
				ResourcePermDto resDto = resIt.next();
				RoleResource roleRes = new RoleResource();
				
				roleRes.setResourceId(resDto.getResourcesId());
				roleRes.setResourceName(resDto.getResourcesName());
				
				List<PermissionDto> permList = resDto.getPermList();
				
				if(permList != null && permList.size()>0){
					
					Iterator<PermissionDto> permIt = permList.iterator();
					
					while(permIt.hasNext()){
						
						PermissionDto permDto = permIt.next();
						
						ResPermission resPerm = new ResPermission();
						
						resPerm.setPermId(permDto.getPermissionId());
						resPerm.setPermName(permDto.getPermissionName());
						logger.info("---------处理资源权限数据，资源数据:{}，权限数据:{}--------",resDto.getResourcesId(),permDto.getPermissionId());
						resPermList.add(resPerm);
					}
					
				}
				roleRes.setPermList(resPermList);
				roleResList.add(roleRes);
			}
			role.setResList(roleResList);
			roleList.add(role);
		}else{
			return null;
		}
		
		return roleList;
	}

	@Override
	public List<String> getResourceIdCache(SystemType systemType) {
		return roleResourcePermApp.getResourceIdCache(systemType);
	}

	@Override
	public List<Role> getAllRoles() {
		List<RoleDto> roleList = roleResourcePermApp.findAllRoles();
		List<Role> retList = new ArrayList<Role>();
		if(roleList !=null && roleList.size()>0){
			
			Iterator<RoleDto> it = roleList.iterator();
			
			while(it.hasNext()){
				
				RoleDto dto = it.next();
				Role role = new Role();
				
				BeanUtils.copyProperties(dto, role);
				
				retList.add(role);
			}
			
		}
		return retList;
		
	}

	@Override
	public boolean updateRole(Role newRole, Role oldRole) {

		String roleId = newRole.getRoleId();
		String oldRoleId = oldRole.getRoleId();
		
		//处理新数据匹配
		List<RoleResource> resList = newRole.getResList();
		//处理老数据匹配
		List<RoleResource> oldResList = oldRole.getResList();
		RoleDto roleDto = this.getRoleDto(resList, roleId,"new");
		RoleDto oldRoleDto = this.getRoleDto(oldResList, oldRoleId,"old");
		//更新
		return roleResourcePermApp.updateRole(roleDto,oldRoleDto);
	}
	
	/**
	 * @param resList
	 * @return
	 * @description:获取角色资源权限数据转换
	 */
	private RoleDto getRoleDto(List<RoleResource> resList ,String roleId, String flag){
		Set<ResourcePermDto> resDtoSet = new HashSet<ResourcePermDto>();
		RoleDto roleDto = new RoleDto();
		if(resList != null && resList.size()>0){
			Iterator<RoleResource> resIt = resList.iterator();
			while(resIt.hasNext()){
				ResourcePermDto resDto = new ResourcePermDto();

				RoleResource roleRes = resIt.next();
				resDto.setResourcesId(roleRes.getResourceId());
				resDto.setResourcesName(roleRes.getResourceName());
				
				List<ResPermission> perList = roleRes.getPermList();
				List<PermissionDto> permDtoList = new ArrayList<PermissionDto>();

				if(perList !=null && perList.size()>0){
					
					Iterator<ResPermission> perIt = perList.iterator();
					
					while(perIt.hasNext()){
						PermissionDto permDto = new PermissionDto();
						
						ResPermission resPerm = perIt.next();
						
						permDto.setPermissionId(resPerm.getPermId());
						permDto.setPermissionName(resPerm.getPermName());
						logger.info("---------管理平台循环处理:{}:资源权限数据，角色：{}，资源：{}，权限：{}---------",
								flag,roleId,roleRes.getResourceId(),resPerm.getPermId());
						permDtoList.add(permDto);
					}
					
				}
				resDto.setPermList(permDtoList);
				resDtoSet.add(resDto);
			}
			
		}
		
		roleDto.setRoleId(roleId);
		roleDto.setPermissions(resDtoSet);
		return roleDto;
		
	}
			

}
