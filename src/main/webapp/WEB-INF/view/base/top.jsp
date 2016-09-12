<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <script type="text/javascript">
        function logout() {
            if(window.confirm('您确定要退出吗？')) {
                top.location = '${ctx}/index.jsp';
            }
        }       
    </script>
    <script type="text/javascript">
        function mainpage() {
        	window.parent.main.location.href="${ctx}/right";
        }       
    </script>
    
</head>
    <body>
        <table cellpadding="0" width="100%" height="64" background="${ctx}/images/base/top_top_bg.gif">
            <tr valign="top">
                <td width="50%"><a href="javascript:void(0)"><img style="border:none" src="${ctx}/images/base/logo.png" /></a></td>
                <td width="30%" style="padding-top:13px;font:15px Arial,SimSun,sans-serif;color:#FFF">管理员：<b><shiro:principal/></b> 您好，感谢登陆使用！</td>
                <td style="padding-top:10px;" align="center"><a href="javascript:void(0)"><img style="border:none" src="${ctx}/images/base/index.gif" onclick="mainpage();" /></a></td>
                <td style="padding-top:10px;" align="center"><a href="javascript:void(0)"><img style="border:none" src="${ctx}/images/base/out.gif" onclick="logout();" /></td>
            </tr>
        </table>
    </body>
</html>