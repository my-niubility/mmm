/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.nbl.utils.jcaptcha;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.captchastore.FastHashMapCaptchaStore;

/**
 * @author Donald
 * @createdate 2016年5月26日
 * @version 1.0 
 * @description :验证码参数处理类
 */
public class JCaptcha {
	
	private final static Logger logger = LoggerFactory.getLogger(JCaptcha.class); 

	//设置图片管理器参数，图片大小、存储时间等
    public static final MyManageableImageCaptchaService captchaService
            = new MyManageableImageCaptchaService(new FastHashMapCaptchaStore(), new GMailEngine(), 180, 100000, 75000);

    /**
     * @param request
     * @param userCaptchaResponse
     * @return
     * @description:验证
     */
    public static boolean validateResponse(HttpServletRequest request, String userCaptchaResponse) {
    	
    	logger.info("userCaptchaResponse="+userCaptchaResponse);
    	logger.info("request.getSession(false) == null："+(request.getSession(false) == null));
    	//获取session，如果为空则不创建
        if (request.getSession(false) == null) return false;
        boolean validated = false;
        try {
            String id = request.getSession().getId();
            logger.info("logger.request.getSession().getId()="+id);
            validated = captchaService.validateResponseForID(id, userCaptchaResponse).booleanValue();
            logger.info("logger.validateResponse.validated="+validated);
        } catch (CaptchaServiceException e) {
            e.printStackTrace();
        }
        return validated;
    }
    /**
     * @param request
     * @param userCaptchaResponse
     * @return
     * @description:
     */
    public static boolean hasCaptcha(HttpServletRequest request, String userCaptchaResponse) {
        if (request.getSession(false) == null) return false;
        boolean validated = false;
        logger.info("userCaptchaResponse="+userCaptchaResponse);
        try {
            String id = request.getSession().getId();
            logger.info("logger.request.getSession().getId()="+id);
            validated = captchaService.hasCapcha(id, userCaptchaResponse);
            logger.info("logger.hasCaptcha.validated="+validated);
        } catch (CaptchaServiceException e) {
            e.printStackTrace();
        }
        return validated;
    }

}
