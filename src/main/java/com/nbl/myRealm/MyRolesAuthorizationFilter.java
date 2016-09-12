package com.nbl.myRealm;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.filter.authz.RolesAuthorizationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * @author Donald
 * @createdate 2016年5月28日
 * @version 1.0 
 * @description :自定义扩展角色过滤器
 */
public class MyRolesAuthorizationFilter extends RolesAuthorizationFilter {

	private final static Logger logger = LoggerFactory.getLogger(MyRolesAuthorizationFilter.class); 

	@Override
    public boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws IOException {

        Subject subject = getSubject(request, response);
        logger.info("MyRolesAuthorizationFilter---subject---:{},and mappedValue---:{}",subject,mappedValue);
        String[] rolesArray = (String[]) mappedValue;

        if (rolesArray == null || rolesArray.length == 0) {
            //no roles specified, so nothing to check - allow access.
        	logger.info("MyRolesAuthorizationFilter---rolesArray--acessAlloweFlag--:{}",true);
            return true;
        }

        Set<String> roles = CollectionUtils.asSet(rolesArray);
        boolean flag = subject.hasAllRoles(roles);
        logger.info("MyRolesAuthorizationFilter---subject.hasAllRoles(roles);---acessAlloweFlag--:{}",flag);

        return flag;
    }
	
	/**
	 * 角色检验失败，则不保存原地址，以便再次登录时页面跳转不正确
	 */
	@Override
    protected void saveRequestAndRedirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
		// saveRequest(request);
		logger.info("MyRolesAuthorizationFilter---check failure redirectToLogin ,not saveRequest---------");
        redirectToLogin(request, response);
    }


}
