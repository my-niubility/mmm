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
                        <tr><td height="31"><div class="title">持仓明细</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">客户持仓详细情况说明</h3></td>
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
                                            <form id="positionDetailForm" name="positionDetailForm" action="${ctx}/product/toPositionMain" method="post" target="main">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">流水号：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="orderId" value="${position.orderId}" />
                                                        </td>
														<td width="10%">持仓人ID:</td>
														<td width="20%">
															<input type="text" name="custId" value="${position.custId}" />
														</td>
														<td width="10%">持仓人名称:</td>
														<td width="20%"s>
															<input type="text" name="custName" value="${position.custName}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">合同ID：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="contractId" value="${position.contractId}" />
                                                        </td>
														<td width="10%">产品ID:</td>
														<td width="20%">
															<input type="text" name="productId" value="${position.productId}" />
														</td>
														<td width="10%">产品名称:</td>
														<td width="20%"s>
															<input type="text" name="productNane" value="${position.productNane}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">剩余本金：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="remainCapital" value="${position.remainCapital}" />
                                                        </td>
														<td width="10%">持仓ID:</td>
														<td width="20%">
															<input type="text" name="id" value="${position.id}" />
														</td>
														<td width="10%">持仓客户类型:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${position.positionCustType eq '00'}">资管 </c:when><c:when test="${position.positionCustType eq '01'}">投资 </c:when><c:when test="${position.positionCustType eq '02'}">其他应付</c:when></c:choose>"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">现有份额：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="possessPortion" value="${position.possessPortion}" />
                                                        </td>
														<td width="10%">初始份额:</td>
														<td width="20%">
															<input type="text" name="initialPortion" value="${position.initialPortion}" />
														</td>
														<td width="10%">投资金额:</td>
														<td width="20%">
															<input type="text" name="invenstAmt" value="${position.invenstAmt/100}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">单价：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="unitCost" value="${position.unitCost/100}" />
                                                        </td>
														<td width="10%">已转出金额:</td>
														<td width="20%">
															<input type="text" name="transferOutAmt" value="${position.transferOutAmt}" />
														</td>
														<td width="10%">总收款金额:</td>
														<td width="20%">
															<input type="text" name="recAmt" value="${position.recAmt}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">当前收益金额：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="earningAmt" value="${position.earningAmt/100}" />
                                                        </td>
														<td width="10%">预期收益:</td>
														<td width="20%">
															<input type="text" name="expectEarning" value="${position.expectEarning/100}" />
														</td>
														<td width="10%">持有状态:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${position.holdStatus eq '00'}">持有</c:when><c:when test="${position.holdStatus eq '01'}">转让中</c:when><c:when test="${position.holdStatus eq '02'}">转让等待中</c:when><c:when test="${position.holdStatus eq '03'}">已转让</c:when><c:when test="${position.holdStatus eq '04'}">已退款</c:when><c:when test="${position.holdStatus eq '05'}">已还款</c:when><c:when test="${position.holdStatus eq '06'}">持仓在途</c:when><c:when test="${position.holdStatus eq '07'}">待退款</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">剩余期数：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="remainTerms" value="${position.remainTerms}" />
                                                        </td>
														<td width="10%">备注:</td>
														<td width="20%">
															<input type="text" name="remark" value="${position.remark}" />
														</td>
														<td width="10%">到期时间:</td>
														<td width="20%">
															<input type="text" name="expireDate" value="${position.expireDate}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                    	<td width="10%">投资类别:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${position.investType eq '00'}">投资</c:when><c:when test="${position.investType eq '01'}">协议转让</c:when></c:choose>" />
														</td>
                                                        <td width="10%">创建时间：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<fmt:formatDate value="${position.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
                                                        	
                                                        </td>
														<td width="10%">更新时间:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<fmt:formatDate value="${position.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.positionDetailForm.submit();" /></td>
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
                                <img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：tangxc@zlebank.com<br />
                                <img src="${ctx}/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="http://www.zlebank.com/" target="_blank">证联资本</a>
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