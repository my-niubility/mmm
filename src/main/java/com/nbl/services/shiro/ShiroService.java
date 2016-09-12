package com.nbl.services.shiro;

import java.util.Set;

import com.nbl.service.manager.dto.LoginAccountDto;

public interface ShiroService {

	/**
	 * 通过用户名查询用户
	 * @param userName
	 * @return
	 */
	public LoginAccountDto getByUserName(String userName);
	
	/**
	 * 通过用户名查询角色信息
	 * @param userName
	 * @return
	 */
	public Set<String> getRoles(String userName);
	
	/**
	 * 通过用户名查询权限信息
	 * @param userName
	 * @return
	 */
	public Set<String> getPermissions(String userName);
}
