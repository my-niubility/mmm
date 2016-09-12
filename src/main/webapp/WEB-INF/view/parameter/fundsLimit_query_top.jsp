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
                        <tr><td height="31"><div class="title">参数查询</div></td></tr>
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
                    	<form id="fundsLimitQueryForm" name="fundsLimitQueryForm" action="${ctx}/fundsLimit/fundsLimitQuery" method="post" target="fundsLimit_query_body" >
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table border="0" width="100%" >
                                    <tr>
                                        <td width="100" align="center" height="50"><img src="${ctx}/images/base/mime.gif" /></td>
                                        <td valign="center">银行卡类型:</td>
                                        <td valign="center">
                                        	<select name="cardType" style="width:100px;">
	                                              <option value="9" selected="true">未选择</option>
	                                              <option value="1">借记卡</option>
	                                              <option value="2">贷记卡</option>
	                                        </select>
                                        </td>
                                        <td valign="center">渠道类型:</td>
                                        <td valign="center">
                                        	<select name="channelType" style="width:100px;">
                                        		<option value="NO">未选择</option>
                                        		<option value="01">银联</option>
                                        		<option value="02">直连</option>
                                        	</select>
                                        </td>
                                        <td valign="center">交易类型:</td>
                                        <td valign="center">
                                        	<select name="businessType" style="width:100px;">
                                        		<option value="NO">未选择</option>
                                        		<option value="01">充值</option>
                                        		<option value="02">提现</option>
                                        		<option value="03">支付</option>
                                        	</select>
                                        </td>   
                                    </tr>
                                    <tr>
                                    	<td width="100" align="center" height="30"></td>
                                        <td valign="center">关联行别:</td>
                                        <td valign="center"><input type="text" name="bankId" value=""/></td>
                                        <td valign="center"></td>
                                        <td valign="center"></td>
                                        <td valign="center"></td>
                                        <td valign="center"></td>   
                                    </tr>
                                    <tr>
                                    	<td width="100" align="center" height="30"></td>
                                    	<td><input type="hidden" name="pageSize" value="8" /></td>
                                    	<td><input type="button" style="width:60px;height:25px" name="Button" value="查&nbsp;&nbsp;询" onClick="javascript:document.fundsLimitQueryForm.submit();"> </td>
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