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
                        <tr><td height="31"><div class="title">充值明细</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">系统充值订单详细情况查询</h3></td>
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
                                            <form id="rechargeDetailForm" name="rechargeDetailForm" action="${ctx}/recharge/toRechargeMain" method="post" target="main">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">充值订单：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="id" value="${recharge.id}" />
                                                        </td>
                                                        <td width="10%">充值金额:</td>
														<td width="20%">
															<input type="text" name="amt" value="${recharge.amt/100}" />
														</td>
														<td width="10%">客户ID:</td>
														<td width="20%">
															<input type="text" name="custId" value="${recharge.custId}" />
														</td>
														
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">客户名称:</td>
														<td width="20%">
															<input type="text" name="custName" value="${recharge.custName}" />
														</td>
                                                        <td width="10%">充值码：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="rechargeCode" value="${recharge.rechargeCode}" />
                                                        </td>
														<td width="10%">交易结果信息:</td>
														<td width="20%">
															<input type="text" name="resultInfo" value="${recharge.resultInfo}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">发起方式：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<c:choose><c:when test="${recharge.bingingCardType eq '01'}">绑卡充值</c:when><c:when test="${recharge.bingingCardType eq '02'}">普通充值</c:when></c:choose>" />
                                                        </td>
														<td width="10%">银行行别:</td>
														<td width="20%">
															<input type="text" name="bankType" value="${recharge.bankType}" />
														</td>
														<td width="10%">银行卡卡号:</td>
														<td width="20%"s>
															<input type="text" name="bankCardNo" value="${recharge.bankCardNo}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">充值日期：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<fmt:formatDate value="${recharge.settleDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
                                                        </td>
														<td width="10%">充值状态:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${recharge.status eq '1'}">充值成功</c:when><c:when test="${recharge.status eq '2'}">处理中</c:when><c:when test="${recharge.status eq '3'}">充值失败</c:when><c:when test="${recharge.status eq '4'}">受理成功</c:when></c:choose>" />
														</td>
														<td width="10%">充值方式:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${recharge.rechargeType eq '00'}">网银充值</c:when><c:when test="${recharge.rechargeType eq '01'}">快捷充值</c:when><c:when test="${recharge.rechargeType eq '02'}">线下转账</c:when><c:when test="${recharge.rechargeType eq '03'}">其他</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">创建时间：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<fmt:formatDate value="${recharge.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
                                                        </td>
														<td width="10%">更新时间:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<fmt:formatDate value="${recharge.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
														</td>
														<td width="10%">备注:</td>
														<td width="40%">
															<input type="text" name="remark" value="${recharge.remark}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.rechargeDetailForm.submit();" /></td>
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