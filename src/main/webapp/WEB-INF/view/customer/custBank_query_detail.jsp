<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    
</head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <!-- 头部开始 -->
            <tr>
                <td width="17" valign="top" background="${ctx}/images/base/mail_left_bg.gif">
                    <img src="${ctx}/images/base/left_top_right.gif" width="17" height="29" />
                </td>
                <td valign="top" background="${ctx}/images/base/content_bg.gif">
                    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="${ctx}/images/base/content_bg.gif">
                        <tr><td height="31"><div class="title">交易明细</div></td></tr>
                    </table>
                </td>
                <td width="16" valign="top" background="${ctx}/images/base/mail_right_bg.gif"><img src="${ctx}/images/base/nav_right_bg.gif" width="16" height="29" /></td>
            </tr>
            <!-- 中间部分开始 -->
            <tr>
                <!--第一行左边框-->
                <td valign="middle" background="${ctx}/images/base/mail_left_bg.gif">&nbsp;</td>
                <!--第一行中间内容-->
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table>
                                    <tr>
                                        <td width="100" align="center"><img src="${ctx}/images/base/mime.gif" /></td>
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">个人客户详细情况查询</h3></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <!-- 一条线 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <!-- 添加产品开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form id="custBankDetailForm" name="custBankDetailForm" action="${ctx}/custBank/toCustBankMain" method="post" target="main">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">客户ID：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="custId" value="${custBank.custId}" readonly="readonly"/>
                                                        </td>
														<td width="10%">银行户名:</td>
														<td width="20%">
															<input type="text" name="cardName" value="${custBank.cardName}" readonly="readonly"/>
														</td>
														<td width="10%">银行卡号:</td>
														<td width="20%">
															<input type="text" name="cardNo" value="${custBank.cardNo}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">银行卡类型：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<c:choose><c:when test="${custBank.cardType eq '1'}">借记卡</c:when><c:when test="${custBank.cardType eq '2'}">贷记卡</c:when></c:choose>" />
                                                        </td>
														<td width="10%">行别:</td>
														<td width="20%">
															<input type="text" name="bankType" value="${custBank.bankType}" readonly="readonly"/>
														</td>
														<td width="10%">创建时间:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<fmt:formatDate value='${custBank.createDate}' pattern='yyyy-MM-dd HH:mm:ss' />" />
															
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">更新时间：</td>	
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<fmt:formatDate value='${custBank.updateTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
                                                        	
                                                        </td>
														<td width="10%">是否发送监管行:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${custBank.isSend eq '0'}">未发送</c:when><c:when test="${custBank.isSend eq '1'}">发送</c:when></c:choose>" />
														</td>
														<td width="10%">状态:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${custBank.status eq '0'}">失效</c:when><c:when test="${custBank.status eq '1'}">有效</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">是否签代扣协议：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<c:choose><c:when test="${custBank.isProtocol eq '0'}">没签代扣协议</c:when><c:when test="${custBank.isProtocol eq '1'}">签代扣协议</c:when></c:choose>	" />
                                                        </td>
														<td width="10%">认证状态:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${custBank.isCert eq '0'}">没认证</c:when><c:when test="${custBank.isCert eq '1'}">已认证</c:when><c:when test="${custBank.isCert eq '2'}">认证中</c:when><c:when test="${custBank.isCert eq '3'}">认证失败</c:when></c:choose>" />
														</td>
														<td width="10%">授权号:</td>
														<td width="20%">
															<input type="text" name="authNo" value="${custBank.authNo}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">网点名称：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="branchName" value="${custBank.branchName}" readonly="readonly"/>
                                                        </td>
														<td width="10%">复核状态:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${custBank.auditStatus eq '1'}">未复核</c:when><c:when test="${custBank.auditStatus eq '2'}">复核通过</c:when><c:when test="${custBank.auditStatus eq '3'}">复核拒绝</c:when></c:choose>" />
														</td>
														<td width="10%">银行卡是否绑定:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${custBank.auditBindingStatus eq '0'}">绑卡</c:when><c:when test="${custBank.auditBindingStatus eq '1'}">解绑</c:when><c:when test="${custBank.auditBindingStatus eq '2'}">绑定失败</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">创建标志：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<c:choose><c:when test="${custBank.createType eq '1'}">门户创建</c:when><c:when test="${custBank.createType eq '2'}">管理系统创建</c:when></c:choose>" />
                                                        </td>
														<td width="10%">默认卡片标识:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${custBank.isDefault eq '0'}">不是</c:when><c:when test="${custBank.isDefault eq '1'}">是</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.custBankDetailForm.submit();" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <!-- 添加产品结束 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="2%">&nbsp;</td>
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