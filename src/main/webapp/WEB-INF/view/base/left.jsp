<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${ctx}/js/prototype.lite.js" type="text/javascript"></script>
<script src="${ctx}/js/moo.fx.js" type="text/javascript"></script>
<script src="${ctx}/js/moo.fx.pack.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
<script type="text/javascript">
	window.onload = function() {
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');

		var myAccordion = new fx.Accordion(toggles, contents, {
			opacity : true,
			duration : 400
		});
		myAccordion.showThisHideOpen(contents[0]);
		for (var i = 0; i < document.getElementsByTagName("a").length; i++) {
			var dl_a = document.getElementsByTagName("a")[i];
			dl_a.onfocus = function() {
				this.blur();
			}
		}
	}
</script>
</head>

<body>
	<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
		<tr>
			<td width="182" valign="top">
				<div id="container">
					<h1 class="type">
						<a href="javascript:void(0)">部门管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx}/party/add" target="main">新建部门</a></li>
							<li><a href="${ctx}/party/query?userName=${userName}" target="main">部门查询</a></li>
						</ul>
					</div>

					<h1 class="type">
						<a href="javascript:void(0)">账号管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx}/account/add" target="main">新增用户</a></li>
							<li><a href="${ctx}/account/toAccountMain" target="main">用户查询</a></li>
							<li><a href="${ctx}/account/toModifyPass" target="main">密码修改</a></li>
						</ul>
					</div>
					<h1 class="type">
						<a href="javascript:void(0)">角色管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx}/role/add" target="main">新增角色</a></li>
							<li><a href="${ctx}/role/roleQuery" target="main">角色查询</a></li>
						</ul>
					</div>
					<h1 class="type">
						<a href="javascript:void(0)">客户管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx }/customer/toCustPerMain" target="main">个人客户查询</a></li>
							<li><a href="${ctx }/custBank/toCustBankMain" target="main">银行卡查询</a></li>
							<li><a href="${ctx }/enterprise/toEnterpriseMain" target="main">企业客户查询</a></li>
							<li><a href="${ctx }/enterprise/add" target="main">线下新增企业</a></li>
							<li><a href="javascript:void(0)" target="main">企业添卡绑定</a></li>
							<li><a href="javascript:void(0)" target="main">企业添卡审核</a></li>
							<li><a href="javascript:void(0)" target="main">企业客户审核</a></li>
							<li><a href="javascript:void(0)" target="main">企业客户变更审核</a></li>
						</ul>
					</div>
					<h1 class="type">
						<a href="javascript:void(0)">产品管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx}/publish/productType" target="main">产品发布</a></li>
							<li><a href="${ctx}/product/toQueryMain" target="main">产品查询</a></li>
							<li><a href="${ctx}/pubcheck/toQueryMain" target="main">发布审核</a></li>
							<li><a href="${ctx}/product/toPositionMain" target="main">持仓查询</a></li>
							<li><a href="${ctx}/estcheck/toQueryMain" target="main">募集完成审核</a></li>
							<li><a href="${ctx}/shelfmanager/toManager" target="main">管理产品货架</a></li>
							<li><a href="javascript:void(0)" target="main">管理产品合同</a></li>
							<li><a href="javascript:void(0)" target="main">管理产品公告</a></li>
							<li><a href="javascript:void(0)" target="main">管理转让产品</a></li>
						</ul>
					</div>
					<h1 class="type">
						<a href="javascript:void(0)">交易管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx}/trade/toTradeMain" target="main">交易查询</a></li>
							<li><a href="${ctx}/recharge/toRechargeMain" target="main">充值查询</a></li>
							<li><a href="${ctx}/withdraw/toWithdrawMain" target="main">提现查询</a></li>
							<li><a href="${ctx}/trade/toRepayMain" target="main">资管人还款</a></li>
							<li><a href="${ctx}/trade/toRepayAllMain?repayStatus=1" target="main">还款查询</a></li>
							<li><a href="${ctx}/trade/toRefundMain" target="main">资管人退款</a></li>
							<li><a href="${ctx}/trade/toRefundMain?refundStatus=1" target="main">退款查询</a></li>
							<li><a href="${ctx}/trade/toFundtransferMain" target="main">划款融资人</a></li>
							<li><a href="${ctx}/trade/toFundtransferMain" target="main">划款查询</a></li>
							<li><a href="${ctx}/trade/toIncomeMain" target="main">客户收益查询</a></li>
						</ul>
					</div>
					<h1 class="type">
						<a href="javascript:void(0)">份额管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx}/portion/toSubjectMain" target="main">账户科目查询</a></li>
							<li><a href="${ctx}/portion/toRuleMain" target="main">记账规则查询</a></li>
							<li><a href="${ctx}/portion/toChargeMain" target="main">记账流水查询</a></li>
							<li><a href="${ctx}/portion/toPositiveMain" target="main">冲正流水查询</a></li>
						</ul>
					</div>

					<h1 class="type">
						<a href="javascript:void(0)">日终任务</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx}/task/toWorkCalendorMain" target="main">工作日历初始化</a></li>
							<li><a href="javascript:void(0)" target="main">工作日查询</a></li>
							<li><a href="javascript:void(0)" target="main">日切服务</a></li>
							<li><a href="${ctx}/task/toBanlanceMain" target="main">试算平衡查询</a></li>
							<li><a href="javascript:void(0)" target="main">对账总览查询</a></li>
							<li><a href="javascript:void(0)" target="main">对账明细查询</a></li>
							<li><a href="javascript:void(0)" target="main">对账结果查询</a></li>
							<li><a href="javascript:void(0)" target="main">对账差错查询</a></li>
							<li><a href="javascript:void(0)" target="main">交易文件汇总查询</a></li>
						</ul>
					</div>

					<h1 class="type">
						<a href="javascript:void(0)">参数管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx }/fundsLimit/tofundsLimitMain" target="main">银行卡限额查询</a></li>
							<li><a href="${ctx }/bankType/toBankTypeMain" target="main">银行类别查询</a></li>
							<li><a href="${ctx }/deal/toDealMain" target="main">业务场景步骤表查询</a></li>
							<li><a href="${ctx }/rule/toAccRuleMain" target="main">记账规则表查询</a></li>
							<li><a href="${ctx }/parameter/toParameterMain" target="main">参数配置查询</a></li>
						</ul>
					</div>
					<h1 class="type">
						<a href="javascript:void(0)">风控管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="javascript:void(0)" target="main">新增风控参数</a></li>
							<li><a href="${ctx}/risk/toBlackWhiteMain" target="main">黑白名单管理</a></li>
							<li><a href="${ctx}/trade/toMaxLimitMain" target="main">单笔大额交易监控</a></li>
						</ul>
					</div>
					<h1 class="type">
						<a href="javascript:void(0)">信息管理</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="javascript:void(0)" target="main">发送短信通知</a></li>
							<li><a href="javascript:void(0)" target="main">发送邮件通知</a></li>
							<li><a href="${ctx}/message/toSendMessage" target="main">发送站内信通知</a></li>
						</ul>
					</div>
					<h1 class="type">
						<a href="javascript:void(0)">计划任务</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx}/plan/toQuartzJob" target="main">任务处理</a></li>
							<li><a href="javascript:void(0)" target="main">时钟列表</a></li>
						</ul>
					</div>

					<h1 class="type">
						<a href="javascript:void(0)">报表展示</a>
					</h1>
					<div class="content">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="${ctx}/images/base/menu_top_line.gif" width="182" height="5" /></td>
							</tr>
						</table>
						<ul class="RM">
							<li><a href="${ctx}/registerTranslate/echarts" target="main">注册实名转化率</a></li>
							<li><a href="${ctx}/verifyTranslate/echarts" target="main">实名投资转化率</a></li>
							<li><a href="${ctx}/repeatInvest/echarts" target="main">重复投资转化率</a></li>
							<li><a href="${ctx}/investAge/echarts" target="main">投资人年龄段</a></li>
							<li><a href="${ctx}/singleInvest/echarts" target="main">单笔投资比例</a></li>
							<li><a href="${ctx}/channelResoule/echarts" target="main">用户渠道来源</a></li>
							<li><a href="${ctx}/userArea/echarts" target="main">用户地域来源</a></li>
							<li><a href="${ctx}/projectScale/echarts" target="main">项目规模比例</a></li>
							<li><a href="${ctx}/projectReback/echarts" target="main">项目还款比例</a></li>
						</ul>
					</div>

					<!-- *********** -->
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
