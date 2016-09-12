package com.nbl.controller.message;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbl.common.constants.ErrorCodeMessage;
import com.nbl.common.exception.MyBusinessCheckException;
import com.nbl.common.exception.MyBusinessRuntimeException;
import com.nbl.jspbean.message.UserMessageBean;
import com.nbl.service.business.app.UserMessageApp;
import com.nbl.service.business.constant.UserMessageType;
import com.nbl.service.business.dto.req.MessageReqDto;
import com.nbl.service.user.app.UserInfoQueryApp;
import com.nbl.utils.json.ResponseJson;

/**
*@author:chenhongji
*@createdate：2016年8月25日 
*@version: 1.0 
*向用户发送站内消息
*/
@Controller
@RequestMapping("message")
public class UserMessageController {
	
	private final static Logger logger = LoggerFactory.getLogger(UserMessageController.class); 
	
	@Resource
	UserMessageApp userMessageApp;
	
	@Resource
	UserInfoQueryApp userInfoQueryApp;
	/**
	 * 跳转到发送站内信界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value= "/toSendMessage",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toSnedMessage===");
		return "/WEB-INF/view/message/sendMessage";
		
	}
	/**
	 * 发送站内信
	 * @param message
	 * @param request
	 * @return
	 * @throws MyBusinessRuntimeException
	 */
	@RequestMapping(value="/create",method = RequestMethod.POST)
	public String createMessage(UserMessageBean message,HttpServletRequest request){
		logger.info("[enter queryAll inParams is:]"+message.toString());
		//ResponseJson resp = new ResponseJson();
		MessageReqDto reqDto = new MessageReqDto();
		//MessageCreateDto reqDto = new MessageCreateDto();
		/*if(message.getMessageType()!=null && UserMessageType.parseOf(message.getMessageType())==null){
			throw new MyBusinessCheckException();
		}*/
		String userId = (String)request.getSession().getAttribute("userName");
		if(userId==null){
			throw new MyBusinessRuntimeException("消息创建者ID为空,登陆超时请重新登陆");
			//request.setAttribute("e", "消息创建者ID为空");
		}
		message.setUserId(userId);
		//根据传入的收件人一二级条件查询userId，目前只实现发送给所有用户
		//查询所有的用户custId
		List<String> allCustId = userInfoQueryApp.queryAllCustId();
		if(allCustId==null || allCustId.size()==0){
			throw new MyBusinessRuntimeException("该指定条件下的消息接收者ID为空");
			//request.setAttribute("e", "该指定条件下的消息接收者ID为空");
		}
		message.setUserIds(allCustId);
		BeanUtils.copyProperties(message, reqDto);
		logger.info("[reqDto:]"+reqDto.toString());
		String messageId = userMessageApp.addMessage(reqDto);
		//return resp.success(messageId);
		return "/WEB-INF/view/message/message_sendResult";
		
	}
	
	/**
	 * 发送站内信异常处理
	 * @param e
	 * @param request
	 * @return
	 */
	@ExceptionHandler(value={MyBusinessRuntimeException.class})
	public String messageException(MyBusinessRuntimeException e,HttpServletRequest request){
		//将异常信息放入request
		request.setAttribute("e", e);
		return "/WEB-INF/view/message/message_sendResult";
	}
}


