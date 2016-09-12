<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/error.css" />
    <script src="${ctx}/js/jquery-1.12.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    
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
                        <tr><td height="31"><div class="title">发布分类</div></td></tr>
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
                    	<form id="productTypeForm" name="productTypeForm" action="${ctx}/publish/selectType" method="post" target="main" >
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table border="0" width="100%" >
                                    <tr>
                                        <td width="100" align="center" height="100"><img src="${ctx}/images/base/mime.gif" /></td>
                                        <td width="300" valign="center"><font size="4" color="green">请选择发布产品的大类：</font></td>
                                        <td width="300" valign="center"><input type="radio" name="productType" value="005" checked="checked" /><font size="4" color="green">标准产品</font></td>
                                        <td width="300" valign="center"><input type="radio" name="productType" value="002" /><font size="4" color="blue">基金系列</font></td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="center" height="100"></td>
                                        <td valign="left"></td>
                                        <td valign="center"><input type="radio" name="productType" value="004" /><font size="4" color="orange">众筹系列</font></td>
                                        <td valign="center"><input type="radio" name="productType" value="003" /><font size="4" color="red">信托系列</font></td>
                                    </tr>

                                    <tr>
                                        <td width="100" align="center" height="100"></td>
                                        <td valign="center"></td>
                                        <td valign="center"><input type="radio" name="productType" value="000" /><font size="4" color="black">光伏系列</font></td>
                                        <td valign="center"><input type="radio" name="productType" value="001" /><font size="4" color="green">电能系列</font></td>
                                    </tr>

                                    <tr>
                                    	<td width="100" align="center" height="50"></td>
                                    	<td></td>
                                    	<td><input type="button" style="width:100px;height:40px" name="Button" value="发&nbsp;&nbsp;布" onClick="javascript:document.productTypeForm.submit();"> </td>
                                    	<td></td>
                                    	<td></td>
                                    </tr>
                                    <tr></tr>
                                    <tr></tr>
                                    <tr></tr>
                                    <tr></tr>
                                    <tr></tr>
                                    <tr></tr>
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
                        <tr>
                            <td width="1%">&nbsp;</td>
                            <td width="51%" class="left_txt">
                                <img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：${serviceEmail}<br />
                                <img src="${ctx}/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="${companyUrl}" target="_blank">${companyName}</a>
                            </td>
                            <td>&nbsp;</td><td>&nbsp;</td>
                        </tr>
					</form>
				</table>
              </td>
              <td background="${ctx}/images/base/mail_right_bg.gif">&nbsp;</td>
            </tr>
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