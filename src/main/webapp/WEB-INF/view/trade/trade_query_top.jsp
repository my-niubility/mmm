<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/base/error.css" />
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
                        <tr><td height="31"><div class="title">交易查询</div></td></tr>
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
                    	<form id="tradeQueryForm" name="tradeQueryForm" action="${ctx}/trade/tradeQuery" method="post" target="trade_query_body" >
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table border="0" width="100%" >
                                    <tr>
                                        <td width="100" align="center" height="50"><img src="${ctx}/images/base/mime.gif" /></td>
                                        <td valign="center">产品ID：</td>
                                        <td valign="center"><input type="text" name="productId" value="" /></td>
                                        <td valign="center">交易订单：</td>
                                        <td valign="center"><input type="text" name="id" value="" /></td>
                                        <td valign="center">支付订单：</td>
                                        <td valign="center"><input type="text" name="payOrderNo" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="center" height="30"></td>
                                        <td valign="center">订单类别：</td>
                                        <td valign="center">
	                                     	<select name="invenstType">
	                                              <option value="9" selected="true">未选择</option>
	                                              <option value="0">投资</option>
	                                              <option value="1">协议转让</option>
	                                              <option value="2">资管人划款</option>
	                                              <option value="3">融资人还款</option>
	                                              <option value="4">资管人还款</option>
	                                              <option value="5">资管人退款</option>
	                                              <option value="6">补贴发放</option>
	                                        </select>
                                        </td>
                                        <td valign="center">订单状态：</td>
                                        <td valign="center">
                                        	<select name="orderStatus">
                                               <option value="99" selected="true">未选择</option>
                                               <option value="00">等待付款</option>
                                               <option value="01">支付成功</option>
                                               <option value="02">支付失败</option>
                                               <option value="03">订单取消</option>
	                                        </select>
	                                    </td>
	                                    <td valign="center">投资人ID：</td>
                                        <td valign="center">
                                        	<input type="text" name="purchaseCustId" value="" />
										</td>
	                                    
                                    </tr>
                                    <tr>
                                    	<td width="100" align="center" height="30"></td>
                                    	<td><input type="hidden" name="pageSize" value="8" /></td>
                                    	<td><input type="button" style="width:60px;height:25px" name="Button" value="查&nbsp;&nbsp;询" onClick="javascript:document.tradeQueryForm.submit();"> </td>
                                    	<td></td>
                                    	<td></td>
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
					</form>
				</table>
              </td>
              <td background="${ctx}/images/base/mail_right_bg.gif">&nbsp;</td>
            </tr>
          </table>
    </body>
</html>