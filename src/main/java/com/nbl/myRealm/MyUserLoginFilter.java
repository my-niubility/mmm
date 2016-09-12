package com.nbl.myRealm;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * @author Donald
 * @createdate 2016年5月26日
 * @version 1.0 
 * @description :扩展FormAuthenticationFilter,适应不同密码加密方式的校验、缓存处理、记住我等功能
 */
public class MyUserLoginFilter extends AccessControlFilter {
	
	private final static Logger logger = LoggerFactory.getLogger(MyUserLoginFilter.class); 

	
	@Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		
		boolean loginFlag = false;
        Subject subject = getSubject(request, response);

        //重新生成会话
        Session sessN = subject.getSession();
        
        String userName = request.getParameter("userName");
        
        logger.info("MyUserLoginFilter--获取原sessionId-:{},and sessionHost---:{},持续登录用户:{}",sessN.getId(),sessN.getHost(),userName);
        if(userName != null){
            Object obj = sessN.getAttribute(userName);
            if(obj == null){
            	logger.info("--------用户：{},未登录：------",userName);
            }else{
            	logger.info("--------用户：{},已登录：------",userName);
            	loginFlag = true;
            }

        }
       
        return loginFlag;
        
    }
	
	protected void issueSuccessRedirect(ServletRequest request, ServletResponse response) throws Exception {
		logger.info("--------已经登录了，最后跳转的URL地址：--------{}","/welcome");
        WebUtils.redirectToSavedRequest(request, response, "/welcome");
    }
	
	/**
	 * 处理是否继续下一个filter操作逻辑
	 */
	@Override
    public boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        boolean allFlag = isAccessAllowed(request, response, mappedValue);
        //如果允许访问，则直接跳转至欢迎页面路径
        if(allFlag){
//        	this.issueSuccessRedirect(request, response);
//        	//终止后续filter处理
//        	return false;
        	return true;
        }else{
        	
        	boolean denFlag =  onAccessDenied(request, response, mappedValue);
        	
        	return denFlag;
        }
        
    }

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        //check failure to login
        saveRequestAndRedirectToLogin(request, response);

		return false;
	}

	
}
