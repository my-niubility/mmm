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
                        <tr><td height="31"><div class="title">机构查询</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">证联资本部门机构查询！</h3></td>
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
                                                        <th>展开</th>
                                                        <th>部门编号</th>
                                                        <th>部门名称</th>
                                                        <th>部门负责人</th>
                                                        <th>负责人电话</th>
                                                        <th>所属上级部门</th>
                                                        <th>部门描述</th>
                                                        <th>创建时间</th>
                                                    </tr>
                                                    <c:forEach var="PartyBean" items="${partyQueryList}" varStatus="status">
                                                    	<c:choose>
                                                       		<c:when test="${PartyBean.partyNumber eq 'GENERAL_MANA_OFFICE'}">
                                                       			<tr>
		                                                       		<td width="5%" align="center"><a href="javascript:void(0)" />+</a></td>
		                                                       		<td width="8%" align="center"><c:out value="${PartyBean.partyNumber}"/></td>
			                                                        <td width="13%" align="center"><c:out value="${PartyBean.partyName}"/></td>
			                                                        <td width="13%" align="center"><c:out value="${PartyBean.partyPerson}"/></td>
			                                                        <td width="13%" align="center"><c:out value="${PartyBean.phone}"/></td>
			                                                        <td width="13%" align="center"><c:out value="${PartyBean.partyName}"/></td>
			                                                        <td width="25%" align="center"><c:out value="${PartyBean.partyDescription}"/></td>
			                                                        <td width="10%" align="center">
			                                                        	<fmt:formatDate value="${PartyBean.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			                                                        </td>
                                                       			</tr>
                                                       		</c:when>
	                                                    </c:choose>                         	

                                                    	<c:choose>
                                                       		<c:when test="${PartyBean.partyNumber ne 'GENERAL_MANA_OFFICE'}">
                                                       			<tr>
		                                                       		<td width="5%" align="center"></td>
		                                                       		<td width="8%" align="center"><c:out value="${PartyBean.partyNumber}"/></td>
			                                                        <td width="13%" align="center"><c:out value="${PartyBean.partyName}"/></td>
			                                                        <td width="13%" align="center"><c:out value="${PartyBean.partyPerson}"/></td>
			                                                        <td width="13%" align="center"><c:out value="${PartyBean.phone}"/></td>
			                                                        <td width="13%" align="center"><c:out value="${PartyBean.partyParent}"/></td>
			                                                        <td width="25%" align="center"><c:out value="${PartyBean.partyDescription}"/></td>
			                                                        <td width="10%" align="center">
			                                                        	<fmt:formatDate value="${PartyBean.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			                                                        </td>
                                                       			</tr>
                                                       		</c:when>
	                                                    </c:choose>                         	

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