package com.nbl.myRealm;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author Donald
 * @createdate 2016年5月28日
 * @version 1.0 
 * @description :自定义扩展权限过滤器
 */
public class MyPermissionsAuthorizationFilter extends PermissionsAuthorizationFilter {
	
	private final static Logger logger = LoggerFactory.getLogger(MyPermissionsAuthorizationFilter.class); 
	
	/**
	 * 资源权限检验失败，则不保存原地址，以便再次登录时页面跳转不正确
	 */
	@Override
    protected void saveRequestAndRedirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
        //saveRequest(request);
       
		logger.info("MyPermissionsAuthorizationFilter---check failure redirectToLogin ,not saveRequest---------");
		redirectToLogin(request, response);
    }
	
	@Override
    public boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws IOException {

        Subject subject = getSubject(request, response);
        String[] perms = (String[]) mappedValue;

        boolean isPermitted = true;
        if (perms != null && perms.length > 0) {
            if (perms.length == 1) {
            	
                if (!subject.isPermitted(perms[0])) {
                	logger.info("MyPermissionsAuthorizationFilter---一个资源权限为：{}-----且该用户不拥有----",perms[0]);
                    isPermitted = false;
                }
            } else {
                if (!subject.isPermittedAll(perms)) {
                	logger.info("MyPermissionsAuthorizationFilter---多个资源权限为：{}----且该用户不拥有-----",perms);
                    isPermitted = false;
                }
            }
        }

        return isPermitted;
    }
	
	@Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {

        Subject subject = getSubject(request, response);
        // If the subject isn't identified, redirect to login URL
        if (subject.getPrincipal() == null) {
        	logger.info("MyPermissionsAuthorizationFilter---用户为空：{}----",subject.getPrincipal());
            saveRequestAndRedirectToLogin(request, response);
        } else {
            // If subject is known but not authorized, redirect to the unauthorized URL if there is one
            // If no unauthorized URL is specified, just return an unauthorized HTTP status code
            String unauthorizedUrl = getUnauthorizedUrl();
            //SHIRO-142 - ensure that redirect _or_ error code occurs - both cannot happen due to response commit:
            if (StringUtils.hasText(unauthorizedUrl)) {
            	logger.info("MyPermissionsAuthorizationFilter---资源权限校验失败，跳转页面：{}----",unauthorizedUrl);
                WebUtils.issueRedirect(request, response, unauthorizedUrl);
            } else {
            	logger.info("MyPermissionsAuthorizationFilter---资源权限校验失败，跳转页面：{}----",unauthorizedUrl);
                WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
            }
        }
        return false;
    }


}
