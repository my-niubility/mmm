<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/base/page.css" />
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
                        <tr><td height="31"><div class="title">持仓统计</div></td></tr>
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
                    	<form id="productPositionForm" name="productPositionForm" action="${ctx}/product/positionQuery" method="post" target="product_position_body" >
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table border="0" width="100%" >
                                    <tr>
                                        <td width="100" align="center" height="50"><img src="${ctx}/images/base/mime.gif" /></td>
                                        <td valign="center">资产负债标识：</td>
                                        <td valign="center">
	                                     	<select name="holdStatus">
	                                              <option value="99" selected="true">未选择</option>
	                                              <option value="00">持有</option>
	                                              <option value="01">转让中</option>
	                                              <option value="02">转让等待中</option>
	                                              <option value="03">已转让</option>
	                                              <option value="04">已退款</option>
	                                              <option value="05">已还款</option>
	                                              <option value="06">持仓在途</option>
	                                              <option value="07">待退款</option>
	                                        </select>
                                        </td>
                                        <td valign="center">持仓人类型：</td>
                                        <td valign="center">
                                        	<select name="positionCustType">
                                               <option value="99" selected="true">未选择</option>
                                               <option value="00">资管</option>
                                               <option value="01">投资</option>
                                               <option value="02">其他应付</option>
	                                        </select>
	                                    </td>
	                                    <td valign="center">资产负债标识：</td>
                                        <td valign="center">
                                        	<select name="subjectType">
                                               <option value="99" selected="true">未选择</option>
                                               <option value="00">资产</option>
                                               <option value="01">负债</option>
	                                        </select>
										</td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="center" height="30"></td>
                                        <td valign="center">产品ID：</td>
                                        <td valign="center"><input type="text" name="productId" value="" /></td>
                                        <td valign="center">交易流水ID：</td>
                                        <td valign="center"><input type="text" name="orderId" value="" /></td>
                                        <td valign="center">持仓人ID：</td>
                                        <td valign="center"><input type="text" name="custId" value="" /></td>
                                    </tr>
                                    <tr>
                                    	<td width="100" align="center" height="30"></td>
                                    	<td><input type="hidden" name="pageSize" value="8" /></td>
                                    	<td><input type="button" style="width:60px;height:25px" name="Button" value="查&nbsp;&nbsp;询" onClick="javascript:document.productPositionForm.submit();"> </td>
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