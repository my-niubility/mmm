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
			<td width="17" valign="top" background="${ctx}/images/base/mail_left_bg.gif"><img src="${ctx}/images/base/left_top_right.gif" width="17" height="29" /></td>
			<td valign="top" background="${ctx}/images/base/content_bg.gif">
				<table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="${ctx}/images/base/content_bg.gif">
					<tr>
						<td height="31"><div class="title">交易明细</div></td>
					</tr>
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
					<tr>
						<td colspan="2" valign="top">&nbsp;</td>
						<td>&nbsp;</td>
						<td valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="4">
							<table>
								<tr>
									<td width="100" align="center"><img src="${ctx}/images/base/mime.gif" /></td>
									<td valign="bottom"><h3 style="letter-spacing: 1px;">个人客户详细情况查询</h3></td>
								</tr>
							</table>
						</td>
					</tr>
					<!-- 一条线 -->
					<tr>
						<td height="40" colspan="4">
							<table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
								<tr>
									<td></td>
								</tr>
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
										<form id="tradeDetailForm" name="tradeDetailForm" action="${ctx}/customer/toCustPerMain" method="post" target="main">
											<table width="100%" class="cont">
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">注册类型：</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${custPerson.registeredType eq 'GATEWAY'}">网关</c:when><c:when test="${custPerson.registeredType eq 'PROTAL'}">门户</c:when></c:choose>"/>
													</td>
													<td width="10%">姓名:</td>
													<td width="20%"><input type="text" name="name" value="${custPerson.name}" readonly="readonly" /></td>
													<td width="10%">证件类型:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${custPerson.credentialsType eq 'P01'}">居民身份证</c:when><c:when test="${custPerson.credentialsType eq 'P04'}">军人证</c:when><c:when test="${custPerson.credentialsType eq 'P31'}">护照</c:when><c:when test="${custPerson.credentialsType eq 'C01'}">营业执照</c:when><c:when test="${custPerson.credentialsType eq 'C09'}">组织机构代码证</c:when></c:choose>" />
													</td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">用户类型：</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${custPerson.custType eq 'CP'}">个人</c:when><c:when test="${custPerson.custType eq 'CB'}">企业</c:when></c:choose>"/>
													</td>
													<td width="10%">登录名称:</td>
													<td width="20%"><input type="text" name="name" value="${custPerson.loginName}" readonly="readonly" /></td>
													<td width="10%">手机号码:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="${custPerson.mobile}" />
													</td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">证件号码：</td>
													<td width="20%"><input type="text" name="identityCardNumber" value="${custPerson.identityCardNumber}" readonly="readonly" /></td>
													<!-- <td width="10%">证件有效期 :</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<fmt:formatDate value="${custPerson.certExpiryDate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
													</td> -->
													<td width="10%">注册渠道编码:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${custPerson.regChanCode eq '001'}">门户网站</c:when><c:when test="${custPerson.regChanCode eq '002'}">IOS手机客户端</c:when><c:when test="${custPerson.regChanCode eq '003'}">Android手机客户端</c:when><c:when test="${custPerson.regChanCode eq '004'}">微信</c:when><c:when test="${custPerson.regChanCode eq '005'}">微博</c:when><c:when test="${custPerson.regChanCode eq '006'}">其他</c:when></c:choose>"/>
													</td>
													<td width="10%">国籍:</td>
													<td width="20%"><input type="text" name="countryId" value="${custPerson.countryId}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">别名：</td>
													<td width="20%"><input type="text" name="nickname" value="${custPerson.nickname}" readonly="readonly" /></td>
													<td width="10%">性别:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${custPerson.gender eq 'MALE'}">男</c:when><c:when test="${custPerson.gender eq 'FEMALE'}">女</c:when></c:choose>" />
													</td>
													<td width="10%">生日:</td>
													<td width="20%"><input type="text" readonly="readonly" value="<fmt:formatDate value='${custPerson.birthday}' pattern='yyyy-MM-dd HH:mm:ss' />"/> </td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">婚姻状态：</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${custPerson.maritalStatus eq 'UNKNOWN'}">未知</c:when><c:when test="${custPerson.maritalStatus eq 'SINGLE'}">单身</c:when><c:when test="${custPerson.maritalStatus eq 'MARRIED'}">已婚</c:when></c:choose>" />
													</td>
													<td width="10%">民族:</td>
													<td width="20%"><input type="text" name="ethnicGroup" value="${custPerson.ethnicGroup}" readonly="readonly" /></td>
													<td width="10%">政治面貌:</td>
													<td width="20%"><input type="text" name="partyAffiliation" value="${custPerson.partyAffiliation}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">血型：</td>
													<td width="20%"><input type="text" name="bloodType" value="${custPerson.bloodType}" readonly="readonly" /></td>
													<td width="10%">身高:</td>
													<td width="20%"><input type="text" name="height" value="${custPerson.height}" readonly="readonly" /></td>
													<td width="10%">体重:</td>
													<td width="20%"><input type="text" name="weight" value="${custPerson.weight}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">职业：</td>
													<td width="20%"><input type="text" name="profession" value="${custPerson.profession}" readonly="readonly" /></td>
													<td width="10%">证券投资经验:</td>
													<td width="20%"><input type="text" name="investmentExp" value="${custPerson.investmentExp}" readonly="readonly" /></td>
													<td width="10%">年收入:</td>
													<td width="20%"><input type="text" name="annualIncome" value="${custPerson.annualIncome}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">冻结状态：</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${custPerson.status eq 'EFFECTIVE'}">有效的</c:when><c:when test="${custPerson.status eq 'FROZEN'}">冻结的</c:when></c:choose>" />
													</td>
													<td width="10%">认证状态:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${custPerson.certStatus eq '0'}">没认证</c:when><c:when test="${custPerson.certStatus eq '1'}">已认证</c:when><c:when test="${custPerson.certStatus eq '2'}">认证中</c:when><c:when test="${custPerson.certStatus eq '3'}">认证失败</c:when></c:choose>" />
													</td>
													<td width="10%">创建时间：</td>
													<td width="20%"><input type="text" readonly="readonly" value="<fmt:formatDate value='${custPerson.createdTime}' pattern='yyyy-MM-dd HH:mm:ss' />"/></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													
													<td width="10%">最后一次更新密码时间：</td>
													<td width="20%"><input type="text" readonly="readonly" value="<fmt:formatDate value='${custPerson.lastUpdatePasswordTime}' pattern='yyyy-MM-dd HH:mm:ss' />"/></td>
													<td width="10%">最近一次登录失败锁定时间：</td>
													<td width="20%"><input type="text" readonly="readonly" value="<fmt:formatDate value='${custPerson.lastLoginLockTime}' pattern='yyyy-MM-dd HH:mm:ss' />"/></td>
													<td width="5%">&nbsp;</td>
												</tr>
												
												<tr>
													<td>&nbsp;</td>
													<td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.tradeDetailForm.submit();" /></td>
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
								<tr>
									<td></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="2%">&nbsp;</td>
						<td width="51%" class="left_txt"><img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：${serviceEmail}<br /> <img src="${ctx}/images/base/icon_phone.gif"
							width="17" height="14"> 官方网站：<a href="${companyUrl}" target="_blank">${companyName}</a></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
			<td background="${ctx}/images/base/mail_right_bg.gif">&nbsp;</td>
		</tr>
		<!-- 底部部分 -->
		<tr>
			<td valign="bottom" background="${ctx}/images/base/mail_left_bg.gif"><img src="${ctx}/images/base/buttom_left.gif" width="17" height="17" /></td>
			<td background="${ctx}/images/base/buttom_bgs.gif"><img src="${ctx}/images/base/buttom_bgs.gif" width="17" height="17"></td>
			<td valign="bottom" background="${ctx}/images/base/mail_right_bg.gif"><img src="${ctx}/images/base/buttom_right.gif" width="16" height="17" /></td>
		</tr>
	</table>
</body>
</html>