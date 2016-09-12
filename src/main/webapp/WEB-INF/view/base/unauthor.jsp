<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/base/skin.css" />
</head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <!-- 头部开始 -->
            <tr>
                <td width="17" valign="top" background="<%= request.getContextPath() %>/images/base/mail_left_bg.gif">
                    <img src="<%= request.getContextPath() %>/images/base/left_top_right.gif" width="17" height="29" />
                </td>
                <td valign="top" background="<%= request.getContextPath() %>/images/base/content_bg.gif">
                    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="<%= request.getContextPath() %>/images/base/content_bg.gif">
                        <tr><td height="31"><div class="title">越权查询</div></td></tr>
                    </table>
                </td>
                <td width="16" valign="top" background="<%= request.getContextPath() %>/images/base/mail_right_bg.gif"><img src="<%= request.getContextPath() %>/images/base/nav_right_bg.gif" width="16" height="29" /></td>
            </tr>
            <!-- 中间部分开始 -->
            <tr>
                <!--第一行左边框-->
                <td valign="middle" background="<%= request.getContextPath() %>/images/base/mail_left_bg.gif">&nbsp;</td>
                <!--第一行中间内容-->
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table>
                                    <tr>
                                        <td width="100" align="center"><img src="<%= request.getContextPath() %>/images/base/mime.gif" /></td>
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">权限不足提示页面</h3></td>
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
                        <!-- 添加栏目开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="" method="">
                                                <table width="100%" class="cont">
                                                    <tr>
                                                        <td width="100%"><h4 style="color:red;font-size:16px;">您目前的权限不足以查阅此功能，请联系管理员升级！</h4></td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <!-- 添加栏目结束 -->
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
                                <img src="<%= request.getContextPath() %>/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：tangxc@zelbank.com<br />
                                <img src="<%= request.getContextPath() %>/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="http://www.zlebank.com/" target="_blank">证联资本</a>
                            </td>
                            <td>&nbsp;</td><td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td background="<%= request.getContextPath() %>/images/base/mail_right_bg.gif">&nbsp;</td>
            </tr>
            <!-- 底部部分 -->
            <tr>
                <td valign="bottom" background="<%= request.getContextPath() %>/images/base/mail_left_bg.gif">
                    <img src="<%= request.getContextPath() %>/images/base/buttom_left.gif" width="17" height="17" />
                </td>
                <td background="<%= request.getContextPath() %>/images/base/buttom_bgs.gif">
                    <img src="<%= request.getContextPath() %>/images/base/buttom_bgs.gif" width="17" height="17">
                </td>
                <td valign="bottom" background="<%= request.getContextPath() %>/images/base/mail_right_bg.gif">
                    <img src="<%= request.getContextPath() %>/images/base/buttom_right.gif" width="16" height="17" />
                </td>           
            </tr>
        </table>
    </body>
</html>