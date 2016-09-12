package com.nbl.services.role;

import java.util.List;

import com.nbl.jspbean.role.Role;
import com.nbl.service.manager.constant.SystemType;

public interface RoleManagerService {
	
	/**
	 * @param role
	 * @return
	 * @description:保存一个角色
	 */
	public boolean saveRole(Role role);

	/**
	 * @param role
	 * @return
	 * @description:更新角色对应的资源权限
	 */
	public boolean updateRole(Role newRole, Role oldRole);

	/**
	 * @param systemType 管理平台资源、门户系统资源
	 * @return
	 * @description:获取不同系统需要重点授权控制的资源
	 */
	public List<Role> getSystemResource(SystemType systemType);
	
	/**
	 * @param roleId
	 * @return
	 * @description:通过角色查询其授权的资源权限
	 */
	public List<Role> getResourceByRoleId(String roleId);
	
	/**
	 * @param roleId
	 * @return
	 * @description:通过roleId判断是否存在该角色
	 */
	public boolean isExistRoleByRoleId(String roleId);
	
	/**
	 * @param roleName
	 * @return
	 * @description:通过roleName判断是否存在该角色
	 */
	public boolean isExistRoleByRoleName(String roleName);

	/**
	 * @param systemType 管理平台
	 * @return
	 * @description:获取资源标识以做缓存之用
	 */
	public List<String> getResourceIdCache(SystemType systemType);
	
	/**
	 * @return
	 * @description:获取管理平台所有角色
	 */
	public List<Role> getAllRoles();

}
