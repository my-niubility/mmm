<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/page.css" />   
</head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <!-- 中间部分开始 -->
            <tr>
                <!--第一行左边框-->
                <td valign="middle" background="${ctx}/images/base/mail_left_bg.gif">&nbsp;</td>
                <!--第一行中间内容-->
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="1%">&nbsp;</td>
                            <td width="98%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="${ctx }/custBank/custBankQuery" method="post">
                                                <table width="100%"  class="cont tr_color">
                                                    <tr>
                                                        <th>客户ID</th>
                                                        <th>银行户名</th>
                                                        <th>银行卡号</th>
                                                        <th>银行卡类型</th>
                                                        <th>签代扣协议</th>
                                                        <th>认证状态 </th>
                                                        <th>是否绑卡</th>
                                                        <th>创建标志</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    <c:forEach var="custBankBean" items="${custBankList}" varStatus="status">
                                                        <tr align="center" class="d">
	                                                        <td><c:out value="${custBankBean.custId}"/></td>
	                                                        <td><c:out value="${custBankBean.cardName}"/></td>
	                                                        <td><c:out value="${custBankBean.cardNo}"/></td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${custBankBean.cardType eq '1'}"><c:out value="借记卡"/></c:when>
	                                                        		<c:when test="${custBankBean.cardType eq '2'}"><c:out value="信用卡"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${custBankBean.isProtocol eq '0'}"><c:out value="没签代扣协议"/></c:when>
	                                                        		<c:when test="${custBankBean.isProtocol eq '1'}"><c:out value="签代扣协议"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${custBankBean.isCert eq '0'}"><c:out value="没认证"/></c:when>
	                                                        		<c:when test="${custBankBean.isCert eq '1'}"><c:out value="已认证"/></c:when>
	                                                        		<c:when test="${custBankBean.isCert eq '2'}"><c:out value="认证中"/></c:when>
	                                                        		<c:when test="${custBankBean.isCert eq '3'}"><c:out value="认证失败"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${custBankBean.auditBindingStatus eq '0'}"><c:out value="绑卡"/></c:when>
	                                                        		<c:when test="${custBankBean.auditBindingStatus eq '1'}"><c:out value="解绑"/></c:when>
	                                                        		<c:when test="${custBankBean.auditBindingStatus eq '2'}"><c:out value="绑定失败"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${custBankBean.createType eq '1'}"><c:out value="门户创建"/></c:when>
	                                                        		<c:when test="${custBankBean.createType eq '2'}"><c:out value="管理系统创建"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td><a href="${ctx}/custBank/custBankDetail?id=${custBankBean.id}" target="main">详情</a></td>
                                                    	</tr>                                                    
                                                    </c:forEach>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="1%">&nbsp;</td>
                        </tr>
                        <!-- 产品列表结束 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="1%">&nbsp;</td>
                            <td width="51%" class="left_txt">
                                <img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：${serviceEmail}<br />
                                <img src="${ctx}/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="${companyUrl}" target="_blank">${companyName}</a>
                            </td>
                            <td>&nbsp;</td><td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td background="${ctx}/images/base/mail_right_bg.gif">&nbsp;</td>
            </tr>
            <!-- 底部部分 -->
            <tr>
                <td valign="bottom" background="${ctx}/images/base/mail_left_bg.gif">
                    <img src="${ctx}/images/base/buttom_left.gif" width="17" height="17" />
                </td>
                <td background="${ctx}/images/base/buttom_bgs.gif">
                    <img src="${ctx}/images/base/buttom_bgs.gif" width="17" height="17">
                </td>
                <td valign="bottom" background="${ctx}/images/base/mail_right_bg.gif">
                    <img src="${ctx}/images/base/buttom_right.gif" width="16" height="17" />
                </td>           
            </tr>
        </table>
    </body>
</html>