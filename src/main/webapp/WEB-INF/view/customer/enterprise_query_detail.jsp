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
                        <tr><td height="31"><div class="title">企业客户明细</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">企业客户详细情况查询</h3></td>
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
                        <!-- 添加产品开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form id="enterpriseDetailForm" name="enterpriseDetailForm" action="${ctx}/enterprise/toEnterpriseMain" method="post" target="main">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">企业编号：</td>
                                                        <td width="20%"><input type="text" name="id" value="${enterprise.id}" readonly="readonly"/></td>
														<td width="10%">企业名称:</td>
														<td width="20%">
															<input type="text" name="name" value="${enterprise.name}" readonly="readonly"/>
														</td>
														<td width="10%">证件类型:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${enterprise.credentialsType eq 'C01'}">营业执照</c:when><c:when test="${enterprise.credentialsType eq 'C09'}">组织机构代码证</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">联系电话：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="phone" value="${enterprise.phone}" readonly="readonly"/>
                                                        </td>
														<td width="10%">传真 :</td>
														<td width="20%"><input type="text" name="fax" value="${enterprise.fax }" readonly="readonly" />
															
														</td>
														<td width="10%">常用地址:</td>
														<td width="20%"s>
															<input type="text" name="address" value="${enterprise.address}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">企业简介：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="summary" value="${enterprise.summary}" readonly="readonly"/>
                                                        </td>
														<td width="10%">企业营业执照:</td>
														<td width="20%"><input type="text" name="companyImg" value="${enterprise.companyImg}" readonly="readonly"/></td>
														<td width="10%">机构代码照:</td>
														<td width="20%"><input type="text" name="organiztionImg" value="${enterprise.organiztionImg}" readonly="readonly"/></td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">税务登记照：</td>
                                                        <td width="20%"><input type="text" name="taxImg" value="${enterprise.taxImg}" readonly="readonly"/></td>
														<td width="10%">银行开户许可照:</td>
														<td width="20%">
															<input type="text" name="bankAccImg" value="${enterprise.bankAccImg}" readonly="readonly"/>
														</td>
														<td width="10%">冻结状态：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<c:choose><c:when test="${enterprise.status eq 'EFFECTIVE'}">有效的</c:when><c:when test="${enterprise.status eq 'FROZEN'}">冻结的</c:when></c:choose>" />
                                                        </td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">认证状态:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${enterprise.certStatus eq 'NEW'}">未认证</c:when><c:when test="${enterprise.certStatus eq 'PASSED'}">已认证通过</c:when><c:when test="${enterprise.certStatus eq 'NOT_PASSED'}">未认证通过</c:when></c:choose>"/>
														</td>
														<td width="10%">审核状态:</td>
														<td width="20%">
															<input type="text" readonly="readonly" value="<c:choose><c:when test="${enterprise.prStatus eq 'NEW'}">待审核</c:when><c:when test="${enterprise.prStatus eq 'PASSED'}">审核通过</c:when><c:when test="${enterprise.prStatus eq 'NOT_PASSED'}">审核拒绝</c:when></c:choose>" />
														</td>
														<td width="10%">法人-文件ID:</td>
														<td width="20%"s>
															<input type="text" name="legalpersonId" value="${enterprise.legalpersonId}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">法人-背面文件ID：</td>
                                                        <td width="20%">
                                                        	<input type="text" name="legalpersonBackId" value="${enterprise.legalpersonBackId}" readonly="readonly"/>
                                                        </td>
														<td width="10%">法人-手机号:</td>
														<td width="20%">
															<input type="text" name="legalpersonMobile" value="${enterprise.legalpersonMobile}" readonly="readonly"/>
														</td>
														<td width="10%">企业委托书文件ID:</td>
														<td width="20%"s>
															<input type="text" name="companyPoaId" value="${enterprise.companyPoaId}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">代理人-文件ID:</td>
														<td width="20%"s>
															<input type="text" name="agentId" value="${enterprise.agentId}" readonly="readonly"/>
														</td>
														<td width="10%">代理人-背面文件ID:</td>
														<td width="20%"s>
															<input type="text" name="agentBackId" value="${enterprise.agentBackId}" readonly="readonly"/>
														</td>
														<td width="10%">代理人 - 姓名:</td>
														<td width="20%"s>
															<input type="text" name="agentName" value="${enterprise.agentName}" readonly="readonly"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">创建时间：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<fmt:formatDate value='${enterprise.updateDate}' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
                                                        </td>
                                                        <td width="10%">创建时间：</td>
                                                        <td width="20%">
                                                        	<input type="text" readonly="readonly" value="<fmt:formatDate value='${enterprise.createdDate}' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.enterpriseDetailForm.submit();" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <!-- 添加产品结束 -->
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