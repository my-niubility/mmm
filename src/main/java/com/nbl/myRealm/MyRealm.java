package com.nbl.myRealm;


import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nbl.service.manager.dto.LoginAccountDto;
import com.nbl.services.shiro.ShiroService;

/**
 * @author Donald
 * @createdate 2016年5月23日
 * @version 1.0 
 * @description :自定义扩展shiro，通过数据库数据进行角色、资源权限匹配
 */
public class MyRealm extends AuthorizingRealm{
	private final static Logger logger = LoggerFactory.getLogger(MyRealm.class); 

	@Resource
	private ShiroService shiroService;
	
	@Resource(name="ehCacheManager")
	private EhCacheManager ehCacheManager;

	/**
	 * 为当限前登录的用户授予角色和权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String userName=(String)principals.getPrimaryPrincipal();
		logger.info("query Roles shiro check username="+userName);
		
		Cache<String,SimpleAuthorizationInfo> cache = ehCacheManager.getCache(userName);
		SimpleAuthorizationInfo info = (SimpleAuthorizationInfo)cache.get("cache");
		if(info !=null){
			logger.info("SimpleAuthorizationInfo cache is not empty ="+info.toString());
			return info;
		}else{
			SimpleAuthorizationInfo authorizationInfo=new SimpleAuthorizationInfo();
			authorizationInfo.setRoles(shiroService.getRoles(userName));
			authorizationInfo.setStringPermissions(shiroService.getPermissions(userName));
			//add cache
			cache.put("cache", authorizationInfo);
			logger.info("AuthenticationInfo cache is empty,and add it ={}",authorizationInfo.toString());
			return authorizationInfo;

		}

		
	}

	/**
	 * 验证当前登录的用户
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		String userName=(String)token.getPrincipal();
		logger.info("shiro current login user={}",userName);
		LoginAccountDto user=shiroService.getByUserName(userName);
		if(user!=null){
			logger.info("shiro check findAccout="+user.toString());
			SimpleAuthenticationInfo authcInfo=new SimpleAuthenticationInfo(user.getLoginName(),user.getPassword(),user.getRealName());
			return authcInfo;
		}else{
			//未找到账户
			throw new AuthenticationException();				
		}
		
		
		
	}

}
