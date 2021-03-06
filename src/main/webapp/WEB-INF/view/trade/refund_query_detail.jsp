<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />

<script type="text/javascript">
	function queryInvestor() {
		document.refundDetailForm.action = "${ctx}/trade/investorsRefundQuery";
		document.refundDetailForm.submit();
	}

	function firm() {
		if (confirm("确认退款？")) {
			showdiv("正在退款请稍后。。。");
			//document.refundDetailForm.action = "${ctx}/trade/refundApply";
			//document.refundDetailForm.submit();
		}

	}

	//显示等待窗口  
	function showdiv(str) {
		var msgw, msgh, bordercolor;
		msgw = 400; //提示窗口的宽度   
		msgh = 100; //提示窗口的高度   
		bordercolor = "#336699"; //提示窗口的边框颜色   
		titlecolor = "#99CCFF"; //提示窗口的标题颜色   

		var sWidth, sHeight;
		sWidth = window.screen.availWidth;
		sHeight = window.screen.availHeight;

		var bgObj = document.createElement("div");
		bgObj.setAttribute('id', 'bgDiv');
		bgObj.style.position = "absolute";
		bgObj.style.top = "0";
		bgObj.style.background = "#777";
		bgObj.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
		bgObj.style.opacity = "0.6";
		bgObj.style.left = "0";
		bgObj.style.width = sWidth + "px";
		bgObj.style.height = sHeight + "px";
		document.body.appendChild(bgObj);
		var msgObj = document.createElement("div")
		msgObj.setAttribute("id", "msgDiv");
		msgObj.setAttribute("align", "center");
		msgObj.style.position = "absolute";
		msgObj.style.background = "white";
		msgObj.style.font = "12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
		msgObj.style.border = "1px solid " + bordercolor;
		msgObj.style.width = msgw + "px";
		msgObj.style.height = msgh + "px";
		msgObj.style.top = (document.documentElement.scrollTop + (sHeight - msgh) / 2) + "px";
		msgObj.style.left = (sWidth - msgw) / 2 + "px";
		var title = document.createElement("h4");
		title.setAttribute("id", "msgTitle");
		title.setAttribute("align", "right");
		title.style.margin = "0";
		title.style.padding = "3px";
		title.style.background = bordercolor;
		title.style.filter = "progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
		title.style.opacity = "0.75";
		title.style.border = "1px solid " + bordercolor;
		title.style.height = "18px";
		title.style.font = "12px Verdana, Geneva, Arial, Helvetica, sans-serif";
		title.style.color = "white";
		//title.style.cursor = "pointer";  
		//title.innerHTML = "关闭";  
		//title.onclick = closediv;  
		document.body.appendChild(msgObj);
		document.getElementById("msgDiv").appendChild(title);
		var txt = document.createElement("p");
		txt.style.margin = "1em 0"
		txt.setAttribute("id", "msgTxt");
		txt.innerHTML = str;
		document.getElementById("msgDiv").appendChild(txt);
		setTimeout("closediv()", "2000");

	}

	function closediv() {
		//Close Div   
		document.body.removeChild(document.getElementById("bgDiv"));
		document.getElementById("msgDiv").removeChild(document.getElementById("msgTitle"));
		document.body.removeChild(document.getElementById("msgDiv"));
		alert("退款成功");
	}
</script>

</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<!-- 头部开始 -->
		<tr>
			<td width="17" valign="top" background="${ctx}/images/base/mail_left_bg.gif"><img src="${ctx}/images/base/left_top_right.gif" width="17" height="29" /></td>
			<td valign="top" background="${ctx}/images/base/content_bg.gif">
				<table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="${ctx}/images/base/content_bg.gif">
					<tr>
						<td height="31"><div class="title">退款明细</div></td>
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
									<td valign="bottom"><h3 style="letter-spacing: 1px;">项目退款详细情况查询</h3></td>
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
										<form id="refundDetailForm" name="refundDetailForm" action="${ctx}/trade/toRefundMain" method="post" target="main">
											<table width="100%" class="cont">
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">产品ID：</td>
													<td width="20%"><input type="text" name="productId" value="${rb.productId}" readonly="readonly" /></td>
													<td width="10%">产品名称：</td>
													<td width="20%"><input type="text" name="productName" value="${rb.productName}" readonly="readonly" /></td>
													<td width="10%">募集规模:</td>
													<td width="20%" s><input type="text" name="financePortion" value="${rb.financePortion/100}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">产品单价：</td>
													<td width="20%"><input type="text" name="unitCost" value="${rb.unitCost/100}" readonly="readonly" /></td>
													<td width="10%">融资人ID:</td>
													<td width="20%"><input type="text" name="productName" value="${rb.financeId}" readonly="readonly" /></td>
													<td width="10%">融资人名称:</td>
													<td width="20%"><input type="text" name="refundCustId" value="${rb.financeName}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">项目状态：</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${rb.isEstablish eq '00'}">不成立</c:when><c:when test="${rb.isEstablish eq '01'}">成立</c:when><c:when test="${rb.isEstablish eq '02'}">募集失败</c:when><c:when test="${rb.isEstablish eq '99'}">无</c:when></c:choose>" />
													</td>
													<td width="10%">收益率：</td>
													<td width="20%"><input type="text" name="expectEarnRate" value="${rb.expectEarnRate}" readonly="readonly" /></td>
													<td width="10%">产品类型:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${rb.productType eq '000'}">光伏</c:when><c:when test="${rb.productType eq '001'}">电能</c:when><c:when test="${rb.productType eq '002'}">基金</c:when><c:when test="${prdRepTrm.repayType eq '003'}">信托</c:when><c:when test="${prdRepTrm.repayType eq '004'}">众筹</c:when></c:choose>" />
													</td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">销售类型：</td>

													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${rb.sellType eq '00'}">直销</c:when><c:when test="${rb.sellType eq '01'}">代销</c:when></c:choose>" />
													</td>

													<td width="10%">利率补贴天数:</td>
													<td width="20%"><input type="text" name="subsidyDay" value="${rb.subsidyDay}" readonly="readonly" /></td>
													<td width="10%">资管人退划款状态:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${rb.assetRepayStatus eq '00'}">未支付</c:when><c:when test="${rb.assetRepayStatus eq '01'}">支付中</c:when><c:when test="${rb.assetRepayStatus eq '02'}">支付完成</c:when></c:choose>" />
													</td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">成立条件：</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${rb.establishCondition eq '0'}">下线</c:when><c:when test="${rb.establishCondition eq '1'}">比例</c:when></c:choose>" />
													</td>
													<td width="10%">预期收益率:</td>
													<td width="20%"><input type="text" name="expectEarnRate" value="${rb.expectEarnRate}%" readonly="readonly" /></td>
													<td width="10%">投资人数:</td>
													<td width="20%"><input type="text" name="investorNum" value="${investorNum}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>

												<tr>
													<td>&nbsp;</td>
													<td><input class="btn" type="button" value="返回" onclick="javascript:document.refundDetailForm.submit();" />&nbsp;&nbsp; <input class="btn" type="button" value="投资人"
														onclick="queryInvestor();" /></td>
													<td>&nbsp;&nbsp;<input class="btn" type="button" value="退款" onclick="firm();" /></td>
													<td>&nbsp;</td>
													<td><input type="hidden" name="pageSize" value="8" /></td>
												</tr>
											</table>
										</form>
									</td>
								</tr>
								<tr>
									<td width="2%">&nbsp;</td>
									<td>
										<div id="protect">
											<table width="100%" border="1">
												<tr>
													<th>序号</th>
													<th>持仓ID</th>
													<th>客户ID</th>
													<th>客户名称</th>
													<th>现有份额</th>
													<th>本金</th>
													<th>到期日期</th>
													<th>交易订单流水号</th>
												</tr>
												<c:forEach var="positionBean" items="${positionList}" varStatus="status">
													<tr class== "row" <c:if test="${status.count%2!=0}">bgcolor="#B0E0E6"</c:if>>
														<td width="5%" align="center"><c:out value="${status.index + 1}" /></td>
														<td width="15%" align="center"><c:out value="${positionBean.id}" /></td>
														<td width="10%" align="center"><c:out value="${positionBean.custId}" /></td>
														<td width="15%" align="center"><c:out value="${positionBean.custName}" /></td>
														<td width="10%" align="center"><c:out value="${positionBean.possessPortion}" /></td>
														<td width="10%" align="center"><c:out value="${positionBean.invenstAmt/100}" /></td>
														<td width="20%" align="center"><fmt:formatDate value="${positionBean.expireDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
														<td width="15%" align="center"><c:out value="${positionBean.orderId}" /></td>
													</tr>
												</c:forEach>
											</table>
											<table width="100%" class="pager" border="0">
												<tr>
													<pg:pager url="${ctx}/trade/positionList" items="${positionCount}" maxIndexPages="5" maxPageItems="${positionSize}" export="currentPageNumber=pageNumber">
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
										</div>
									</td>
									<td></td>
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
						<td width="51%" class="left_txt"><img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：tangxc@zlebank.com<br /> <img src="${ctx}/images/base/icon_phone.gif"
							width="17" height="14"> 官方网站：<a href="http://www.zlebank.com/" target="_blank">证联资本</a></td>
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