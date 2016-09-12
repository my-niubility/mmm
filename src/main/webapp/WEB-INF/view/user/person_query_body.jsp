<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/page.css" />   
</head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <!-- 中间部分开始 -->
            <tr>
                <!--第一行左边框-->
                <td valign="middle" background="${ctx}/images/base/mail_left_bg.gif">&nbsp;</td>
                <!--第一行中间内容-->
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="1%">&nbsp;</td>
                            <td width="98%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="" method="">
                                                <table width="100%"  class="cont tr_color">
                                                    <tr>
                                                        <th>选中</th>
                                                        <th>序号</th>
                                                        <th>用户账户</th>
                                                        <th>用户名称</th>
                                                        <th>所属部门</th>
                                                        <th>所属角色</th>
                                                        <th>联系电话</th>
                                                        <th>可用状态</th>
                                                        <th>锁定状态</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    <c:forEach var="LoginAccountBean" items="${accountList}" varStatus="status">
                                                        <tr align="center" class="d">
	                                                        <td><input type="checkbox" value="" /></td>
	                                                        <td><c:out value="${status.index + 1}"/></td>
	                                                        <td><c:out value="${LoginAccountBean.accountName}"/></td>
	                                                        <td><c:out value="${LoginAccountBean.realName}"/></td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${LoginAccountBean.partyId eq 'GENERAL_MANA_OFFICE'}"><c:out value="总经办"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.partyId eq 'OPERATE_BRANCH'}"><c:out value="运营部门"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.partyId eq 'MARKET_BRANCH'}"><c:out value="市场部门"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.partyId eq 'IT_BRANCH'}"><c:out value="技术部门"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.partyId eq 'HC_BRANCH'}"><c:out value="人力部门"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${LoginAccountBean.roleId eq 'ROOT'}"><c:out value="ROOT管理员"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.roleId eq 'OPERATE_H'}"><c:out value="运营高级管理员"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.roleId eq 'OPERATE_L'}"><c:out value="运营初级管理员"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.roleId eq 'IT_H_MANAGER'}"><c:out value="技术高级管理员"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.roleId eq 'IT_L_MANAGER'}"><c:out value="技术初级管理员"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.roleId eq 'NOR_MANAGER'}"><c:out value="普通用户"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td><c:out value="${LoginAccountBean.mobile}"/></td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${LoginAccountBean.lockStatus eq '0'}"><c:out value="未锁定"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.lockStatus eq '1'}"><c:out value="锁定"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${LoginAccountBean.enableStatus eq '0'}"><c:out value="可用"/></c:when>
	                                                        		<c:when test="${LoginAccountBean.enableStatus eq '1'}"><c:out value="注销"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td><a href="${ctx}/account/accountDetail?accountName=${LoginAccountBean.accountName}" target="main">修改</a></td>
                                                    	</tr>                                                    
                                                    </c:forEach>
                                                </table>
                                                <c:if test="${!empty accountList}">
	                                                <table width="100%"  class="pager">
	                                                	<tr >
	                                                		<pg:pager url="${ctx}/account/accountPageList" items="${accountCount}" maxIndexPages="5" maxPageItems="${accountSize}"
	                                                		export="currentPageNumber=pageNumber"> 
	                                                			<pg:param name="parentId"/>  
													            <!-- 首页 -->  
													            <pg:first>  
													                <!-- 生成链接 -->  
													                <td><a href="${pageUrl}">首页</a></td>  
													      
													            </pg:first>  
													            <pg:prev>  
													                <td><a href="${pageUrl}">前一页</a></td>   
													            </pg:prev>  
													            <pg:pages>  
													                <c:choose>  
													                    <c:when test="${currentPageNumber eq pageNumber }">  
													                        <td><font color="red">${pageNumber }</font></td>   
													                    </c:when>  
													                    <c:otherwise>  
													                        <td><a href="${pageUrl}">${pageNumber }</a></td>   
													                    </c:otherwise>  
													                </c:choose>  
													      
													            </pg:pages>  
													            <pg:next>  
													                <td><a href="${pageUrl}">后一页</a></td>   
													            </pg:next>  
													            <pg:last>  
													                <td><a href="${pageUrl}">尾页</a></td>   
													            </pg:last>  
															</pg:pager>
															<td width="70%"></td>
	                                                	</tr>
	                                                </table>
                                                </c:if>
                                                <c:if test="${empty accountList}">
	                                               	<table width="100%" class="noData">
														<tr>
															<th>暂无数据</th>
														</tr>
													</table>
                                           		</c:if>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="1%">&nbsp;</td>
                        </tr>
                        <!-- 产品列表结束 -->
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