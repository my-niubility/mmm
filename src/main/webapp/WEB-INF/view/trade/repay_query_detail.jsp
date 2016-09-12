<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
<script src="${ctx}/js/jquery-1.12.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function queryInvestor() {
		document.repayDetailForm.action = "${ctx}/trade/investorsQuery";
		document.repayDetailForm.submit();
	}
	
	function firm() {
		if (confirm("确认还款？")) {
			var id = $("#prdId").val();
			var productId = $("#productId").val();
			document.repayDetailForm.action = "${ctx}/trade/repayApply";
			document.repayDetailForm.submit();
			showdiv("正在还款请稍后。。。");
		}

	}

	function showDialog() {
		var dialog = document.createElement("div");
		dialog.id = "myDialog";
		dialog.innerHTML = "登录成功.正在跳转...";
		//设置层显示的样式  
		dialog.style.position = "absolute";

		//设置五秒钟后自动关闭.  
		setTimeout("document.getElementById('myDialog').dislay='none'", "5000");
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
		setTimeout("closediv()", "5000");

	}

	function closediv() {
		//Close Div   
		document.body.removeChild(document.getElementById("bgDiv"));
		document.getElementById("msgDiv").removeChild(document.getElementById("msgTitle"));
		document.body.removeChild(document.getElementById("msgDiv"));
		alert("还款成功");
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
						<td height="31"><div class="title">还款明细</div></td>
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
									<td valign="bottom"><h3 style="letter-spacing: 1px;">项目还款详细情况查询</h3></td>
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
										<form id="repayDetailForm" name="repayDetailForm" action="${ctx}/trade/toRepayMain" method="post" target="main">
											<table width="100%" class="cont">
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">还款编号：</td>
													<td width="20%"><input type="text" name="id" id="prdId" value="${prdRepTrm.id}" readonly="readonly" /></td>
													<td width="10%">应还总额：</td>
													<td width="20%"><input type="text" name="repayAmt" value="${prdRepTrm.repayAmtStr}" readonly="readonly" /></td>
													<td width="10%">投资人数:</td>
													<td width="20%"><input type="text" name="repayInterest" value="${investorNum}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">产品ID：</td>
													<td width="20%"><input type="text" name="productId" id="productId" value="${prdRepTrm.productId}" readonly="readonly" /></td>
													<td width="10%">产品名称:</td>
													<td width="20%"><input type="text" name="productName" value="${prdRepTrm.productName}" readonly="readonly" /></td>
													<td width="10%">融资人ID:</td>
													<td width="20%"><input type="text" name="repayCustId" value="${prdRepTrm.repayCustId}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">融资人名称：</td>
													<td width="20%"><input type="text" name="repayCustName" value="${prdRepTrm.repayCustName}" readonly="readonly" /></td>
													<td width="10%">还款类型:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${prdRepTrm.repayType eq '01'}">资管人还款</c:when><c:when test="${prdRepTrm.repayType eq '02'}">融资人还款</c:when><c:when test="${prdRepTrm.repayType eq '03'}">担保人还款</c:when></c:choose>" />
													</td>
													<td width="10%">还款状态:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${prdRepTrm.isFinishResult eq '0'}">没有完成</c:when><c:when test="${prdRepTrm.isFinishResult eq '1'}">完成</c:when><c:when test="${prdRepTrm.isFinishResult eq '2'}">还款中</c:when></c:choose>" />
													</td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">还款日期：</td>
													<td width="20%"><input type="text" name="repayEndDate" value="${prdRepTrm.repayEndDate}" readonly="readonly" /></td>
													<td width="10%">本金:</td>
													<td width="20%"><input type="text" name="amt" value="${prdRepTrm.amtStr}" readonly="readonly" /></td>
													<td width="10%">利息:</td>
													<td width="20%"><input type="text" name="repayInterest" value="${prdRepTrm.repayInterestStr}" readonly="readonly" /></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">还款期次:</td>
													<td width="20%"><input type="text" name="repayTerm" value="${prdRepTrm.repayTerm}" readonly="readonly" /></td>
													<td width="10%">是否生效:</td>
													<td width="20%">
														<input type="text" readonly="readonly" value="<c:choose><c:when test="${prdRepTrm.enabled eq '0'}">无效</c:when><c:when test="${prdRepTrm.enabled eq '1'}">生效</c:when></c:choose>" />
													</td>
													<td width="5%">&nbsp;</td>
												</tr>

												<tr>
													<td>&nbsp;</td>
													<td><input class="btn" type="button" value="返回" onclick="javascript:document.repayDetailForm.submit();" />&nbsp;&nbsp; <input class="btn" type="button" value="投资人"
														onclick="queryInvestor();" /></td>
													<td>&nbsp;&nbsp;<input class="btn" type="button" value="还款" onclick="firm();" /></td>
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
													<th>客户ID</th>
													<th>持仓ID</th>
													<th>持仓人姓名</th>
													<th>利息</th>
													<th>本金</th>
													<th>还款状态</th>
													<th>到账日期</th>
													<th>收益偿还方式</th>
												</tr>
												<c:forEach var="IncomeBean" items="${incomeList}" varStatus="status">
													<tr class=="row" <c:if test="${status.count%2!=0}">bgcolor="#B0E0E6"</c:if>>
														<td width="3%" align="center"><c:out value="${status.index + 1}" /></td>
														<td width="15%" align="center"><c:out value="${IncomeBean.custId}" /></td>
														<td width="10%" align="center"><c:out value="${IncomeBean.positionId}" /></td>
														<td width="8%" align="center"><c:out value="${IncomeBean.custName}" /></td>
														<td width="10%" align="center"><c:out value="${IncomeBean.earning/100}" /></td>
														<td width="10%" align="center"><c:out value="${IncomeBean.capital/100}" /></td>
														<td width="5%" align="center">
															<c:choose>
																<c:when test="${IncomeBean.isFinish eq '0'}"><c:out value="没有完成" /></c:when>
																<c:when test="${IncomeBean.isFinish eq '1'}"><c:out value="完成" /></c:when>
																<c:when test="${IncomeBean.isFinish eq '2'}"><c:out value="还款中" /></c:when>
															</c:choose>
														</td>
														<td width="8%" align="center"><c:out value="${IncomeBean.accountDate}" /></td>

														<td width="10%" align="center"><c:choose>
																<c:when test="${IncomeBean.repayMode eq '0'}">
																	<c:out value="等额本息还款" />
																</c:when>
																<c:when test="${IncomeBean.repayMode eq '1'}">
																	<c:out value="一次还本付息" />
																</c:when>
																<c:when test="${IncomeBean.repayMode eq '2'}">
																	<c:out value="等额本金" />
																</c:when>
																<c:when test="${IncomeBean.repayMode eq '3'}">
																	<c:out value="每月还息到期还本" />
																</c:when>
															</c:choose></td>
													</tr>

												</c:forEach>
											</table>
											<table width="100%" class="pager" border="0">
												<tr>
													<pg:pager url="${ctx}/trade/incomeList" items="${incomeCount}" maxIndexPages="5" maxPageItems="${incomeSize}" export="currentPageNumber=pageNumber">
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