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
                        <tr><td height="31"><div class="title">计划任务</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">查询系统所有计划任务信息！</h3></td>
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
                                <table width="100%" border="0">
                                    <tr>
                                        <td colspan="2">
                                            <form action="" method="" >
                                                <table width="100%" class="cont" border="0">
                                                    <tr>
                                                        <th>序号</th>
                                                        <th>job名称</th>
                                                        <th>job属组</th>
                                                        <th>trigger名称</th>
                                                        <th>trigger属组</th>
                                                        <th>上次执行</th>
                                                        <th>下次执行</th>
                                                        <th>表达式</th>
                                                        <th>状态</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    <c:forEach var="QuartzJobBean" items="${quartzList}" varStatus="status">
                                                       			<tr>
		                                                       		<td width="5%" align="center"><c:out value="${status.index + 1}"/></td>
		                                                       		<td width="10%" align="center"><c:out value="${QuartzJobBean.jName}"/></td>
			                                                        <td width="10%" align="center"><c:out value="${QuartzJobBean.jGroup}"/></td>
			                                                        <td width="10%" align="center"><c:out value="${QuartzJobBean.tName}"/></td>
			                                                        <td width="10%" align="center"><c:out value="${QuartzJobBean.tGroup}"/></td>
			                                                        <td width="10%" align="center"><c:out value="${QuartzJobBean.preTime}"/></td>
			                                                        <td width="10%" align="center"><c:out value="${QuartzJobBean.nextTime}"/></td>
			                                                        <td width="10%" align="center"><c:out value="${QuartzJobBean.cron}"/></td>
			                                                        <td width="5%" align="center">
			                                                        <c:choose>
		                                                        		<c:when test="${QuartzJobBean.currStatus eq 'NORMAL'}"><c:out value="正常"/></c:when>
		                                                        		<c:when test="${QuartzJobBean.currStatus eq 'PAUSED'}"><c:out value="暂停"/></c:when>
		                                                        		<c:when test="${QuartzJobBean.currStatus eq 'COMPLETE'}"><c:out value="完成"/></c:when>
		                                                        		<c:when test="${QuartzJobBean.currStatus eq 'ERROR'}"><c:out value="异常"/></c:when>
		                                                        		<c:when test="${QuartzJobBean.currStatus eq 'BLOCKED'}"><c:out value="锁定"/></c:when>
	                                                        		</c:choose>
			                                                        
			                                                        </td>
			                                                        <td width="20%" align="center">
			                                                        
			                                                        <c:choose>
		                                                        		<c:when test="${QuartzJobBean.currStatus eq 'NORMAL'}"><a href="javascript:void(0)" target="main"><span style="color:red;">暂停</span> </a> &nbsp;&nbsp;<a href="javascript:void(0)" target="main"><span style="color:orange;">终止</span></a> &nbsp;&nbsp;<a href="javascript:void(0)" target="main"><span style="color:blue;">更新表达式</span></a> </c:when>
		                                                        		<c:when test="${QuartzJobBean.currStatus eq 'PAUSED'}"><a href="javascript:void(0)" target="main"><span style="color:red;">启动</span></a> &nbsp;&nbsp;<a href="javascript:void(0)" target="main"><span style="color:blue;">更新表达式</span></a> </c:when>
	                                                        		</c:choose>
			                                                        
			                                                        </td>
                                                       			</tr>
                                                    </c:forEach>
                                                    
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
                                <img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：${serviceEmail}<br />
                                <img src="${ctx}/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="${companyUrl}" target="_blank">${companyName}</a>
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