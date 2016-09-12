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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">系统交易订单详细情况查询</h3></td>
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
                                            <form id="tradeOrderDetailForm" name="tradeOrderDetailForm" action="${ctx}/trade/toTradeMain" method="post" target="main">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
														<td width="10%">交易订单:</td>
														<td width="20%">
															<input type="text" name="id" value="${tradeOrder.id}" readonly="readonly"/>
														</td>
														<td width="10%">合同号：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="contractId" value="${tradeOrder.contractId}" readonly="readonly"/>
                                                        </td>
														<td width="10%">产品编号:</td>
														<td width="20%">
															<input type="text" name="productId" value="${tradeOrder.productId}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">产品名称：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="productNane" value="${tradeOrder.productNane}" readonly="readonly"/>
                                                        </td>
														<td width="10%">资产管理人ID :</td>
														<td width="20%">
															<input type="text" name="assetCustId" value="${tradeOrder.assetCustId}" readonly="readonly"/>
														</td>
														<td width="10%">资产管理人名称:</td>
														<td width="20%"s>
															<input type="text" name="assetCustName" value="${tradeOrder.assetCustName}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">投资方客户号：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="purchaseCustId" value="${tradeOrder.purchaseCustId}" readonly="readonly"/>
                                                        </td>
														<td width="10%">投资方客户名称:</td>
														<td width="20%">
															<input type="text" name="purchaseCustName" value="${tradeOrder.purchaseCustName}" readonly="readonly"/>
														</td>
														<td width="10%">转让方客户号:</td>
														<td width="20%">
															<input type="text" name="transferCustId" value="${tradeOrder.transferCustId}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">转让方客户名称:</td>
														<td width="20%">
															<input type="text" name="transferCustName" value="${tradeOrder.transferCustName}" readonly="readonly"/>
														</td>
                                                        <td width="10%">订单类别：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="invenstType" value="<c:choose><c:when test="${tradeOrder.invenstType eq '0'}">投资</c:when><c:when test="${tradeOrder.invenstType eq '1'}">协议转让</c:when><c:when test="${tradeOrder.invenstType eq '2'}">划款</c:when><c:when test="${tradeOrder.invenstType eq '3'}">融资人还款</c:when><c:when test="${tradeOrder.invenstType eq '4'}">资管人还款</c:when><c:when test="${tradeOrder.invenstType eq '6'}">补贴发放</c:when></c:choose>"/>
                                                        </td>
														<td width="10%">实际交易金额(元):</td>
														<td width="20%">
															<input type="text" name="amt" value="${tradeOrder.amt/100}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">交易总额：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="tradeTalAmt" value="${tradeOrder.tradeTalAmt/100}" readonly="readonly"/>
                                                        </td>
														<td width="10%">红包抵扣金额:</td>
														<td width="20%">
															<input type="text" name="redEnvAmt" value="${tradeOrder.redEnvAmt}" readonly="readonly"/>
														</td>
														<td width="10%">利息:</td>
														<td width="20%"s>
															<input type="text" name="interest" value="${tradeOrder.interest/100}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">本金：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="principal" value="${tradeOrder.principal}" readonly="readonly"/>
                                                        </td>
														<td width="10%">购买份数:</td>
														<td width="20%">
															<input type="text" name="purchasePortion" value="${tradeOrder.purchasePortion}" readonly="readonly"/>
														</td>
														<td width="10%">期次:</td>
														<td width="20%"s>
															<input type="text" name="repayTerm" value="${tradeOrder.repayTerm}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">支付交易流水号：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="payOrderNo" value="${tradeOrder.payOrderNo}" readonly="readonly"/>
                                                        </td>
														<td width="10%">交易日期:</td>
														<td width="20%">
															<input type="text" name="tradeDate" value="${tradeOrder.tradeDate}" readonly="readonly"/>
														</td>
														<td width="10%">订单状态:</td>
														<td width="20%">
															<input type="text" name="orderStatus" value="<c:choose><c:when test="${tradeOrder.orderStatus eq '00'}">等待付款</c:when><c:when test="${tradeOrder.orderStatus eq '01'}">支付成功</c:when><c:when test="${tradeOrder.orderStatus eq '02'}">支付失败</c:when><c:when test="${tradeOrder.orderStatus eq '03'}">订单取消</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">转让ID：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="transferId" value="${tradeOrder.transferId}" readonly="readonly"/>
                                                        </td>
                                                        <td width="10%">备注：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="remark" value="${tradeOrder.remark}" readonly="readonly"/>
                                                        </td>
                                                        <td width="10%">创建时间：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<fmt:formatDate value="${tradeOrder.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
                                                        </td>
                                                        <td width="5%">&nbsp;</td> 
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">更新时间：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<fmt:formatDate value="${tradeOrder.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
                                                        </td>
                                                        <td width="5%">&nbsp;</td> 
                                                    </tr>

                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.tradeOrderDetailForm.submit();" /></td>
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