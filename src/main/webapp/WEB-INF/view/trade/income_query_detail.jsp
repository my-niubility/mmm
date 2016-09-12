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
                        <tr><td height="31"><div class="title">收益明细</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">客户投资收益详细情况查询</h3></td>
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
                                            <form id="incomeDetailForm" name="incomeDetailForm" action="${ctx}/trade/toIncomeMain" method="post" target="main">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">项目ID：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="projectId" value="${income.projectId}" />
                                                        </td>
														<td width="10%">项目名称:</td>
														<td width="20%">
															<input type="text" name="projectName" value="${income.projectName}" />
														</td>
														<td width="10%">持仓ID:</td>
														<td width="20%"s>
															<input type="text" name="positionId" value="${income.positionId}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">投资人ID：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="custId" value="${income.custId}" />
                                                        </td>
														<td width="10%">投资人名称:</td>
														<td width="20%">
															<input type="text" name="custName" value="${income.custName}" />
														</td>
														<td width="10%">项目状态:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${income.enabled eq '0'}"><c:out value="无效"/> </c:when><c:when test="${income.enabled eq '1'}"><c:out value="有效"/> </c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">收益偿还方式：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<c:choose><c:when test="${income.repayMode eq '0'}">等额本息还款</c:when><c:when test="${income.repayMode eq '1'}">一次还本付息</c:when><c:when test="${income.repayMode eq '2'}">等额本金</c:when><c:when test="${income.repayMode eq '3'}">每月还息到期还本</c:when></c:choose>" />
                                                        </td>
														<td width="10%">是否完成还款:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${income.isFinish eq '0'}"><c:out value="未完成"/> </c:when><c:when test="${income.isFinish eq '1'}"><c:out value="已完成"/> </c:when></c:choose>" />
														</td>
														<td width="10%">收入类型:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${income.incomeType eq '00'}">投资</c:when><c:when test="${income.incomeType eq '01'}">转出</c:when><c:when test="${income.incomeType eq '02'}">协议转让</c:when><c:when test="${income.incomeType eq '03'}">募集期利息</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">本金(元)：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="capital" value="${income.capital/100}" />
                                                        </td>
														<td width="10%">利息(元):</td>
														<td width="20%">
															<input type="text" name="earning" value="${income.earning/100}" />
														</td>
														<td width="10%">总金额(元):</td>
														<td width="20%">
															<input type="text" name="amt" value="${income.amt/100}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">投资利息期数：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="proIncomeTerm" value="${income.proIncomeTerm}" />
                                                        </td>
														<td width="10%">到账日期:</td>
														<td width="20%">
															<input type="text" name="accountDate" value="${income.accountDate}" />
														</td>
														<td width="10%">备注:</td>
														<td width="20%"s>
															<input type="text" name="remark" value="${income.remark}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">创建时间：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<fmt:formatDate value="${income.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
                                                        </td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.incomeDetailForm.submit();" /></td>
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