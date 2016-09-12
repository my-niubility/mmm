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
                        <tr><td height="31"><div class="title">收益查询</div></td></tr>
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
                    	<form id="incomeQueryForm" name="incomeQueryForm" action="${ctx}/trade/incomeQuery" method="post" target="income_query_body" >
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table border="0" width="100%" >
                                    <tr>
                                        <td width="100" align="center" height="50"><img src="${ctx}/images/base/mime.gif" /></td>
                                        <td valign="center">投资收入ID:</td>
                                        <td valign="center"><input type="text" name="id" value="" /></td>
                                        <td valign="center">客户ID:</td>
                                        <td valign="center"><input type="text" name="custId" value="" /></td>
                                        <td valign="center">项目ID:</td>
                                        <td valign="center"><input type="text" name="projectId" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="center" height="30"></td>
                                        <td valign="center">收益偿还方式:</td>
                                        <td valign="center">
                                        	<select name="repayMode">
	                                              <option value="9" selected="true">未选择</option>
	                                              <option value="0">等额本息还款</option>
	                                              <option value="1">一次还本付息</option>
	                                              <option value="2">等额本金</option>
	                                              <option value="3">每月还息到期还本</option>
	                                        </select>
                                        </td>
                                        <td valign="center">收入类型:</td>
                                        <td valign="center">
                                        	<select name="incomeType">
	                                              <option value="99" selected="true">未选择</option>
	                                              <option value="00">投资</option>
	                                              <option value="01">转出</option>
	                                              <option value="02">协议转让</option>
	                                              <option value="03">募集期利息</option>
	                                        </select>
                                        </td>
                                        <td valign="center">到账日期:</td>
                                        <td valign="center">
                                        	<select name="isFinish">
	                                              <option value="9" selected="true">未选择</option>
	                                              <option value="0">未完成</option>
	                                              <option value="1">已完成</option>
	                                        </select>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td width="100" align="center" height="30"></td>
                                    	<td><input type="hidden" name="pageSize" value="8" /></td>
                                    	<td><input type="button" style="width:60px;height:25px" name="Button" value="查&nbsp;&nbsp;询" onClick="javascript:document.incomeQueryForm.submit();"> </td>
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