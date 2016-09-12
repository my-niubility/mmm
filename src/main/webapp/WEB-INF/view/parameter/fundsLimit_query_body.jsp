<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="1%">&nbsp;</td>
						<td width="98%">
							<table width="100%">
								<tr>
									<td colspan="2">
										<form action="${ctx }/fundsLimit/fundsLimitQuery" method="post">
											<table width="100%" class="cont tr_color">
												<tr>
													<th>序号</th>
													<th>关联行别</th>
													<th>银行卡类型</th>
													<th>渠道类型</th>
													<th>交易类型</th>
													<th>单笔限额(元)</th>
													<th>每天限制(元)</th>
													<th>每月限制(元)</th>
												</tr>
												<c:forEach var="FundsLimitBankBean" items="${fundsLimitList}"
													varStatus="status">
													<tr align="center" class="d">
														<td><c:out value="${status.index + 1}" /></td>
														<td><c:out value="${FundsLimitBankBean.bankId}" /></td>
														<td>
															<c:choose>
																<c:when test="${FundsLimitBankBean.cardType eq '1'}"><c:out value="借记卡"/></c:when>
																<c:when test="${FundsLimitBankBean.cardType eq '2'}"><c:out value="贷记卡"/></c:when>																
															</c:choose>
														</td>
														<td>
															<c:choose>
																<c:when test="${FundsLimitBankBean.channelType eq '01'}"><c:out value="银联"/></c:when>
																<c:when test="${FundsLimitBankBean.channelType eq '02'}"><c:out value="直连"/></c:when>
															</c:choose>
														</td>
														<td>
															<c:choose>
																<c:when test="${FundsLimitBankBean.businessType eq '01'}"><c:out value="充值"/> </c:when>
																<c:when test="${FundsLimitBankBean.businessType eq '02'}"><c:out value="提现"/> </c:when>
																<c:when test="${FundsLimitBankBean.businessType eq '03'}"><c:out value="支付"/> </c:when>
															</c:choose>
														</td>
														<td><c:out value="${FundsLimitBankBean.singleLimit/100}" /></td>
														<td><c:out value="${FundsLimitBankBean.dayLimit/100}" /></td>
														<td><c:out value="${FundsLimitBankBean.monthLimit/100}" /></td>
													</tr>
												</c:forEach>
											</table>
											<c:if test="${!empty fundsLimitList}">
												<table width="100%" class="pager">
													<tr>
														<pg:pager url="${ctx}/fundsLimit/fundsLimitPageList"
															items="${fundsLimitCount}" maxIndexPages="5"
															maxPageItems="${chargeSize}"
															export="currentPageNumber=pageNumber">
															<pg:param name="parentId" />
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
											<c:if test="${empty fundsLimitList}">
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
							<table width="100%" height="1" border="0" cellpadding="0"
								cellspacing="0" bgcolor="#CCCCCC">
								<tr>
									<td></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="1%">&nbsp;</td>
						<td width="51%" class="left_txt"><img
							src="${ctx}/images/base/icon_mail.gif" width="16" height="11">
							客户服务邮箱：${serviceEmail}<br /> <img
							src="${ctx}/images/base/icon_phone.gif" width="17" height="14">
							官方网站：<a href="${companyUrl}" target="_blank">${companyName}</a></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
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
			<td background="${ctx}/images/base/buttom_bgs.gif"><img
				src="${ctx}/images/base/buttom_bgs.gif" width="17" height="17">
			</td>
			<td valign="bottom" background="${ctx}/images/base/mail_right_bg.gif">
				<img src="${ctx}/images/base/buttom_right.gif" width="16"
				height="17" />
			</td>
		</tr>
	</table>
</body>
</html>