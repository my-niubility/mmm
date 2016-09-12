<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
<script src="${ctx}/js/jquery-1.12.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function(){
    	$("#modifyParameterForm").submit(function(e){
    		var id = $("#id").val();
    		var code = $("#code").val();
    		var parName = $("#parName").val();
    		var parValue = $("#parValue").val();
    		var reMark = $("#reMark").val();
    	});
    });
    
    function checkSubmit(){
    	if(window.confirm('你确定要修改参数吗？')){
            return true;
         }else{
            window.location.href="${ctx}/parameter/toParameterMain";
            return false;
        }
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
									<td valign="bottom"><h3 style="letter-spacing: 1px;">查询修改参数</h3></td>
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
										<form id="modifyParameterForm" name="modifyParameterForm" action="${ctx}/parameter/parameterModify" method="post"  onsubmit="return checkSubmit()">
											<table width="100%" class="cont">
												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">系统参数代码：</td>
													<td width="20%"><input type="text" id="code" name="code" value="${parameter.code}" readonly="readonly" /></td>
													<td width="10%">系统参数名称:</td>
													<td width="20%"><input type="text" id="parName" name="parName" value="${parameter.parName}" maxlength="100"/></td>
													<td width="10%">系统参数值:</td>
													<td width="20%"><input type="text" id="parValue" name="parValue" value="${parameter.parValue}" maxlength="100"/></td>
													<td width="5%">&nbsp;</td>
												</tr>

												<tr>
													<td width="5%">&nbsp;</td>
													<td width="10%">参数描述 :</td>
													<td width="20%"><input type="text" id="reMark" name="reMark" value="${parameter.reMark}"  maxlength="60"/></td>
													<td width="10%"></td>
													<td width="20%"></td>
													<td width="10%"></td>
													<td width="20%"></td>
													<td width="5%">&nbsp;</td>
												</tr>
												<tr>
                                                     <td><input id="id" type="hidden" name="id" value="${parameter.id}" /></td>
                                                     <td colspan="3">
                                                     	<input class="btn" type="submit" value="提交" />
                                                     </td>
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