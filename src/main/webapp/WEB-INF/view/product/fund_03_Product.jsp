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
                        <tr><td height="31"><div class="title">产品预览</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">产品发布预览确认信息展示页面</h3></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <!-- 一条限 -->
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
                                            <form id="chargeDetailForm" name="chargeDetailForm" action="${ctx}/publish/project/fund_pub" method="post" target="main">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">产品名称：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="productName" value="${fund.productName}" />
                                                        </td>
														<td width="10%">募集开始时间：</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" value="<fmt:formatDate value="${fund.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
														</td>
														<td width="10%">募集开始日期：</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="startdt" value="${fund.startdt}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">融资规模(份)：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="scale" value="${fund.scale}" />
                                                        </td>
														<td width="10%">产品价格(元):</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="unitcost" value="${fund.unitcost}" />
														</td>
														<td width="10%">预期年化收益率:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="rate" value="${fund.rate}"  />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td>投资下限：</td>
                                                        <td width="20%">
                                                        	<input class="text" style="width:100px;height:20px;" type="text" name="investMin" value="${fund.investMin}" />
                                                        </td>
														<td width="10%">是否存在补贴:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="subsidyFlag" value="<c:choose><c:when test="${fund.subsidyFlag eq '0'}">不补贴</c:when><c:when test="${fund.subsidyFlag eq '1'}">补贴</c:when></c:choose>" />
														</td>
														<td width="10%">融资人编号:</td>
														<td width="20%"s>
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="financeId" value="${fund.financeId}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">补贴年化利率：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="subsidyRate" value="${fund.subsidyRate}"/>
                                                        </td>
														<td width="10%">补贴天数:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text"  name="subsidyDay" value="${fund.subsidyDay}" />
														</td>
														<td width="10%">融资人名称：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="financeName" value="${fund.financeName}"/>
                                                        </td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">红包类型：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<c:choose><c:when test="${fund.redType eq '01'}">按用户发放</c:when><c:when test="${fund.redType eq '02'}">按产品发放</c:when><c:when test="${fund.redType eq '03'}">按投资金额发放</c:when><c:when test="${fund.redType eq '04'}">按活动类型发放</c:when></c:choose>" />
                                                        </td>
														<td width="10%">产品小类：</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${fund.productTittleType eq '201'}">货币型基金</c:when><c:when test="${fund.productTittleType eq '202'}">债券型基金</c:when><c:when test="${fund.productTittleType eq '203'}">股票型基金</c:when><c:when test="${fund.productTittleType eq '204'}">理财型基金</c:when></c:choose>" />
														</td>
														<td width="10%"></td>
														<td width="20%">
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input type="button" value="正式发布" size="50" onclick="javascript:document.chargeDetailForm.submit();" /></td>
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