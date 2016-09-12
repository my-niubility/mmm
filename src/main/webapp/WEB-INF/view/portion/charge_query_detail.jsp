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
                        <tr><td height="31"><div class="title">记账明细</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">记账流水详细情况查询</h3></td>
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
                                            <form id="chargeDetailForm" name="chargeDetailForm" action="${ctx}/portion/toChargeMain" method="post" target="main">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">记账流水：</td>
                                                        <td width="20%">
                                                        	<input readonly="readonly" type="text" name="bookId" value="${cb.bookId}" />
                                                        </td>
														<td width="10%">交易日期:</td>
														<td width="20%">
															<input readonly="readonly" type="text" name="accountDate" value="${cb.accountDate}" />
														</td>
														<td width="10%">交易订单号:</td>
														<td width="20%"s>
															<input readonly="readonly" type="text" name="orderId" value="${cb.orderId}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">支付订单号：</td>
                                                        <td width="20%">
                                                        	<input readonly="readonly" type="text" name="payId" value="${cb.payId}" />
                                                        </td>
														<td width="10%">付款方客户编号:</td>
														<td width="20%">
															<input readonly="readonly" type="text" name="drCustId" value="${cb.drCustId}" />
														</td>
														<td width="10%">收款方客户编号:</td>
														<td width="20%"s>
															<input readonly="readonly" type="text" name="crCustId" value="${cb.crCustId}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">记账份额：</td>
                                                        <td width="20%">
                                                        	<input readonly="readonly" type="text" name="amount" value="${cb.amount}" />
                                                        </td>
														<td width="10%">借方科目:</td>
														<td width="20%">
															<input readonly="readonly" type="text" name="drSubjectNo" value="${cb.drSubjectNo}" />
														</td>
														<td width="10%">贷方科目:</td>
														<td width="20%"s>
															<input readonly="readonly" type="text" name="crSubjectNo" value="${cb.crSubjectNo}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">记账状态：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<c:choose><c:when test="${cb.bookState eq '00'}">已记账</c:when><c:when test="${cb.bookState eq '01'}">已冲正</c:when></c:choose>" />
                                                        </td>
														<td width="10%">交易编码 :</td>
														<td width="20%">
															<input readonly="readonly" type="text" name="optCode" value="${cb.optCode}" />
														</td>
														<td width="10%">支付编码:</td>
														<td width="20%">
															<input readonly="readonly" type="text" name="dealCode" value="${cb.dealCode}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">借贷标志：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<c:choose><c:when test="${cb.payerFlag eq 'DR'}">借方 </c:when><c:when test="${cb.payerFlag eq 'CR'}">贷方 </c:when></c:choose>" />
                                                        </td>
														<td width="10%">记录时间:</td>
														<td width="20%">
															<input readonly="readonly" type="text" value="<fmt:formatDate value='${cb.bookTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.chargeDetailForm.submit();" /></td>
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