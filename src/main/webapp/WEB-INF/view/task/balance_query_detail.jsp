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
						<td height="31"><div class="title">试算明细</div></td>
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
									<td valign="bottom"><h3 style="letter-spacing: 1px;">试算平衡结果详情查询</h3></td>
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
										<form id="balanceDetailForm" name="balanceDetailForm" action="${ctx}/task/toBanlanceMain" method="post" target="main">
											<table width="100%" class="cont">
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">试算平衡时间：</td>
													<td width="20%"><input type="text" readonly="readonly" value="<fmt:formatDate value='${balance.calTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"/> </td>
													<td width="10%">客户号:</td>
													<td width="20%"><input type="text" name="name" value="${balance.custId}" readonly="readonly" /></td>
													<td width="10%">商户号:</td>
													<td width="20%"><input type="text" name="name" value="${balance.merchantId}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>

												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">对账日期 :</td>
													<td width="20%"><input type="text" name="accountDate" value="${balance.accountDate}" readonly="readonly"/></td>
													<td width="10%">项目编号：</td>
													<td width="20%"><input type="text" name="projectId" value="${balance.projectId}" readonly="readonly" /></td>
													<td width="10%">借方份额:</td>
													<td width="20%"><input type="text" name="drAmount" value="${balance.drAmount}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">贷方份额：</td>
													<td width="20%"><input type="text" name="crAmount" value="${balance.crAmount}" readonly="readonly" /></td>
													<td width="10%">资产份额:</td>
													<td width="20%"><input type="text" name="assetAmount" value="${balance.assetAmount}" readonly="readonly" /></td>
													<td width="10%">负债份额:</td>
													<td width="20%"><input type="text" name="liabilityAmount" value="${balance.liabilityAmount}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">持仓是否平衡：</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${balance.chBalanceFlag eq '0'}">不平衡</c:when><c:when test="${balance.chBalanceFlag eq '1'}">平衡</c:when></c:choose>" />
													</td>
													<td width="10%">流水是否平衡:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${balance.lsBalanceFlag eq '0'}">不平衡</c:when><c:when test="${balance.lsBalanceFlag eq '1'}">平衡</c:when></c:choose>" />
													</td>
													<td width="10%">不平衡原因:</td>
													<td width="20%"><input type="text" name="msg" value="${balance.msg}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.balanceDetailForm.submit();" /></td>
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