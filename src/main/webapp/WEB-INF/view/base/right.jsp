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
                        <tr><td height="31"><div class="title">欢迎界面</div></td></tr>
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
                        <!--**********这里是内容**********-->
                        <!--**********这里是内容**********-->
                        <!--**********这里是内容**********-->
                        <!--**********这里是内容**********-->
                        <tr>
                            <!--左边内容-->
                            <td colspan="2" valign="top">
                                <h3 style="margin:0 0 10px 10px;">感谢您使用证联资本金融网销平台管理系统程序</h3>
                                <img src="${ctx}/images/base/ts.gif" width="16" height="16" style="margin-left:10px;"> 提示：<br />
                                <p style="text-indent:20px;line-height:25px;margin-left:10px;font-size:15px;">您现在使用的是 证联资本技术团队 开发的一套用于管理金融网销产品（能源宝、众筹、基金、信托）的专业系统！如果您有任何疑问请点<span> <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=609307843&site=qq&menu=yes" onfocus="this.blur()"><img style="vertical-align:middle;"border="0" src="http://wpa.qq.com/pa?p=2:609307843:41" alt="证联资本网销平台为您服务" title="证联资本网销平台"></a> </span>在线客服进行咨询！<br />&nbsp;&nbsp;&nbsp;&nbsp;</p>
                            </td>
                            <!--间隔-->
                            <td width="7%">&nbsp;</td>
                            <!--右边内容-->
                            <td width="40%" valign="top">
                                <table width="100%" height="150" border="0" cellpadding="0" cellspacing="0" style="border: 1px solid #CCCCCC;">
                                    <tr>
                                        <td width="7%" height="27" background="${ctx}/images/base/news_title_bg.gif">
                                            <img src="${ctx}/images/base/news_title_bg.gif" width="2" height="27">
                                        </td>
                                        <td width="93%" background="${ctx}/images/base/news_title_bg.gif" class="left_bt">最新动态</td>
                                    </tr>
                                    <tr><td height="5" colspan="2">&nbsp;</td></tr>
                                    <tr>
                                        <td height="100" valign="top" colspan="2" id="news">
                                            <marquee direction="up" scrollamount="2" vspace="30px" width="400px" height="100px" onmouseout="this.start()" onmouseover="this.stop()">
                                                <ul>
                                                    <li>证联资本网销平台欢迎您！</li>
                                                    <li>敬请期待能源宝项目产品！</li>
                                                    <li>敬请期待基金项目产品！</li>
                                                    <li>敬请期待众筹项目产品！</li>
                                                </ul>
                                            </marquee>
                                        </td>
                                    </tr>
                                    <tr><td height="5" colspan="2">&nbsp;</td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr height="20"><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <!--第二行-->
                        <tr>
                            <td colspan="2" valign="top">
                                <table width="100%" height="230" border="0" cellpadding="0" cellspacing="0" style="border: 1px solid #CCCCCC;">
                                    <tr>
                                        <td width="7%" background="${ctx}/images/base/news_title_bg.gif">
                                            <img src="${ctx}/images/base/news_title_bg.gif" width="2" height="27">
                                        </td>
                                        <td width="93%" background="${ctx}/images/base/news_title_bg.gif" class="left_bt">最新动态</td>
                                    </tr>
                                    <tr>
                                    	<td width="7%"></td>
                                        <td width="93%" height="186" valign="top" colspan="2">
                                        	<marquee direction="up" scrollamount="2" vspace="30px" width="600px" height="100px" onmouseout="this.start()" onmouseover="this.stop()">
                                                <ul>
                                                    <li><font size="3" color="green">证联资本网销平台欢迎您！</font></li>
                                                    <li><font size="3" color="green">敬请期待能源宝项目产品！</font></li>
                                                    <li><font size="3" color="green">敬请期待基金项目产品！</font></li>
                                                    <li><font size="3" color="green">敬请期待众筹项目产品！</font></li>
                                                </ul>
                                            </marquee>                             	
                                        </td>
                                    </tr>
                                    <tr><td height="5" colspan="2">&nbsp;</td></tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td valign="top">
                                <table width="100%" height="230" border="0" cellpadding="0" cellspacing="0" style="border: 1px solid #CCCCCC;">
                                    <tr>
                                        <td width="7%" background="${ctx}/images/base/news_title_bg.gif">
                                            <img src="${ctx}/images/base/news_title_bg.gif" width="2" height="27">
                                        </td>
                                        <td width="93%" height="27" background="${ctx}/images/base/news_title_bg.gif" class="left_bt">最新动态</td>
                                    </tr>
                                    <tr><td height="186" valign="top">&nbsp;</td><td height="102" valign="top"></td></tr>
                                    <tr><td height="5" colspan="2">&nbsp;</td></tr>
                                </table>
                            </td>
                        </tr>
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
                                <img src="${ctx}/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="http://www.zlebank.com/" target="_blank">北京证联资本管理有限责任公司</a>
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