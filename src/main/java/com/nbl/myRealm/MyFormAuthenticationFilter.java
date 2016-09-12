package com.nbl.myRealm;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * @author Donald
 * @createdate 2016年5月26日
 * @version 1.0 
 * @description :扩展FormAuthenticationFilter,适应不同密码加密方式的校验、缓存处理、记住我等功能
 */
public class MyFormAuthenticationFilter extends FormAuthenticationFilter {
	
	@Resource(name="ehCacheManager")
	private EhCacheManager ehCacheManager;
	
	private final static Logger logger = LoggerFactory.getLogger(MyFormAuthenticationFilter.class); 
	//表单中用户名字字段，可根据需要自己设置与实际名称同名，否则默认
    private String usernameParam = DEFAULT_USERNAME_PARAM;
	//表单中密码字段，可根据需要自己设置与实际名称同名，否则默认
    private String passwordParam = DEFAULT_PASSWORD_PARAM;
	//表单中记住我字段，可根据需要自己设置与实际名称同名，否则默认
    private String rememberMeParam = DEFAULT_REMEMBER_ME_PARAM;
	//验证失败设置key值，页面提示可使用
    private String failureKeyAttribute = DEFAULT_ERROR_KEY_ATTRIBUTE_NAME;

	@Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        //用过图片处理判断，如果验证码不通过则不继续
		String failureKey = getFailureKeyAttribute();
		logger.info("图片处理逻辑设置的key="+failureKey);
        if(request.getAttribute(failureKey) != null) {
        	logger.info("图片处理通过key查询attribute值="+request.getAttribute(failureKey));
        	//continue filerChan
            return true;
        }
		//登录校验
		if (isLoginRequest(request, response)) {
            if (isLoginSubmission(request, response)) {
            	logger.info("shiro form submission checked is successfull,require method is Post");
                return executeLogin(request, response);
            } else {
            	logger.info("shiro form submission checked is failure, to login page");
            	return true;
            }
        } else {
            logger.info("Attempting to access a path which requires authentication.  Forwarding to the " +
                        "Authentication url [" + getLoginUrl() + "]");
            //check failure to login
            saveRequestAndRedirectToLogin(request, response);
            //stop filterChan
            return false;
        }
    }
	
	@Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		String successUrl = getSuccessUrl();
        Subject subject = getSubject(request, response);        
        boolean loginFlag = subject.isAuthenticated();
        if(loginFlag){
        	logger.info("--------如果已经登录了，获取成功跳转的URL地址：--------{}",successUrl);
        }else{
        	logger.info("--------第一次登录：--------{}");
        }
       
        return loginFlag;
        
    }
	@Override
    protected void issueSuccessRedirect(ServletRequest request, ServletResponse response) throws Exception {
		logger.info("--------已经登录了，最后跳转的URL地址：--------{}",getSuccessUrl());
        this.redirectToSavedRequest(request, response, getSuccessUrl());
    }
	
	/**
	 * 处理是否继续下一个filter操作逻辑
	 */
	@Override
    public boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        boolean allFlag = isAccessAllowed(request, response, mappedValue);
        //如果允许访问，则直接跳转至欢迎页面路径
        if(allFlag){
        	this.issueSuccessRedirect(request, response);
        	//终止后续filter处理
        	return false;
        }else{
        	
        	boolean denFlag =  onAccessDenied(request, response, mappedValue);
        	
        	return denFlag;
        }
        
    }
	
	@Override
    protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {
        AuthenticationToken token = createLocalToken(request, response);
        if (token == null) {
            String msg = "createToken method implementation returned null. A valid non-null AuthenticationToken " +
                    "must be created in order to execute a login attempt.";
            throw new IllegalStateException(msg);
        }
        try {
            Subject subject = getSubject(request, response);
            
            logger.info("--------执行登录校验操作：--------{}");
            subject.login(token);
            
//            Session sess = subject.getSession();
//            logger.info("MyRolesAuthorizationFilter--清空前sessionId-:{},and sessionHost---:{}",sess.getId(),sess.getHost());         
//            //清空会话
//            sess.stop();
            //重新生成会话
            Session sessN = subject.getSession();
            
            String userName = (String) subject.getPrincipal();
            logger.info("MyRolesAuthorizationFilter--重新生成sessionId-:{},and sessionHost---:{},用户名：{}",sessN.getId(),sessN.getHost(),userName);

            //设置
            sessN.setAttribute(userName, userName);
            
            request.setAttribute("userName", userName);
            return onLoginSuccess(token, subject, request, response);
        } catch (AuthenticationException e) {
        	logger.info("--------执行登录操作异常：--------{}",e.getMessage());
            return onLoginFailure(token, e, request, response);
        }
    }
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:创建token
	 */
	private AuthenticationToken createLocalToken(ServletRequest request, ServletResponse response){
		//记住我设置
        boolean rememberMe = isRememberMe(request);
        //获取远程主机IP
        String host = getHost(request);
        //获取表单用户名
        String username = getUsername(request);
        //获取表单密码
        String password = getPassword(request);
		return super.createToken(username, password, rememberMe, host);
	}

	/**
	 * @param request
	 * @param response
	 * @param fallbackUrl
	 * @throws IOException
	 * @description:
	 */
	private void redirectToSavedRequest(ServletRequest request, ServletResponse response, String fallbackUrl)
            throws IOException {
        String successUrl = null;
        boolean contextRelative = true;
        SavedRequest savedRequest = WebUtils.getAndClearSavedRequest(request);
        if (savedRequest != null && savedRequest.getMethod().equalsIgnoreCase(AccessControlFilter.GET_METHOD)) {
            successUrl = savedRequest.getRequestUrl();
            contextRelative = false;
        }

        if (successUrl == null) {
            successUrl = fallbackUrl;
        }

        if (successUrl == null) {
            throw new IllegalStateException("Success URL not available via saved request or via the " +
                    "successUrlFallback method parameter. One of these must be non-null for " +
                    "issueSuccessRedirect() to work.");
        }
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("userName", (String)request.getAttribute("userName"));
        logger.info("---------mapParam =========={}",paramMap.get("userName"));
        WebUtils.issueRedirect(request, response, successUrl, paramMap, contextRelative);
    }
	
	public String getUsernameParam() {
		return usernameParam;
	}

	public void setUsernameParam(String usernameParam) {
		this.usernameParam = usernameParam;
	}

	public String getPasswordParam() {
		return passwordParam;
	}

	public void setPasswordParam(String passwordParam) {
		this.passwordParam = passwordParam;
	}

	public String getRememberMeParam() {
		return rememberMeParam;
	}

	public void setRememberMeParam(String rememberMeParam) {
		this.rememberMeParam = rememberMeParam;
	}

	public String getFailureKeyAttribute() {
		return failureKeyAttribute;
	}

	public void setFailureKeyAttribute(String failureKeyAttribute) {
		this.failureKeyAttribute = failureKeyAttribute;
	}
	

	
}
