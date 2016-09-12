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
                        <tr><td height="31"><div class="title">账户查询</div></td></tr>
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
                    	<form id="custPersonQueryForm" name="custPerQuery" action="${ctx}/customer/custPerQuery" method="post" target="custPerson_query_body" >
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table border="0" width="100%" >
                                    <tr>
                                        <td width="100" align="center" height="50"><img src="${ctx}/images/base/mime.gif" /></td>
                                        <td valign="center">注册类型:</td>
                                        <td valign="center">
                                           <select name="registeredType" style="width:100px;">
	                                              <option value="NO" selected="true">未选择</option>
	                                              <option value="GATEWAY">网关</option>
	                                              <option value="PROTAL">门户</option>
	                                        </select>
                                        </td>
                                        <td valign="center">证件类型:</td>
                                        <td valign="center">
                                           	<select name="credentialsType" style="width:100px;">
	                                              <option value="NO" selected="true">未选择</option>
	                                              <option value="P01">居民身份证</option>
	                                              <option value="P04">军人证</option>
	                                              <option value="P31">护照</option>
	                                              <option value="C01">营业执照</option>
	                                              <option value="C09">组织机构代码证</option>
	                                        </select>
 										</td>
                                        <td valign="center">冻结状态:</td>
                                        <td valign="center">
                                        	<select name="status" style="width:100px;">
                                              <option value="NO" selected="true">未选择</option>
                                              <option value="EFFECTIVE">有效的</option>
                                              <option value="FROZEN">冻结的</option>
	                                        </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="center" height="30"></td>
                                       	
                                       	<td valign="center">认证状况:</td>
                                        <td valign="center">
                                        	<select name="certStatus" style="width:100px;">
                                              <option value="9" selected="true">未选择</option>
                                              <option value="0">没认证</option>
                                              <option value="1">已认证</option>
                                              <option value="2">认证中</option>
                                              <option value="3">认证失败</option>
	                                        </select>
                                        </td>
                                        <td valign="center">注册渠道:</td>
                                        <td valign="center">
                                        	<select name="regChanCode" style="width:100px;">
                                              <option value="NO" selected="true">未选择</option>
                                              <option value="001">门户网站</option>
                                              <option value="002">IOS手机客户端</option>
                                              <option value="003">Android手机客户端</option>
                                              <option value="004">微信</option>
                                              <option value="005">微博</option>
                                              <option value="006">其他</option>
	                                        </select>
                                        </td>
                                        <td valign="center">身份证号:</td>
                                        <td valign="center"><input type="text" name="identityCardNumber" value="" /></td>
                                    </tr>
                                    <tr>
                                    	<td width="100" align="center" height="30"></td>
                                    	<td><input type="hidden" name="pageSize" value="8" /></td>
                                    	<td><input type="button" style="width:60px;height:25px" name="Button" value="查&nbsp;&nbsp;询" onClick="javascript:document.custPerQuery.submit();"> </td>
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