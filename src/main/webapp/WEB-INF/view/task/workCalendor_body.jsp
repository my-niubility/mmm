<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/base/page.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/base/error.css" />
	<script src="${ctx}/js/jquery-1.12.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function(){
        $("#initForm").validate({
        	rules:{   
        		initDay:{
        			required:true,
        			}
			},
			messages:{
				initDay:{required:"初始化工作日期不能为空"},
				 },
        });
    });
    
    $(function(){
        $("#modifyForm").validate({
        	rules:{   
        		modifyday:{
        			required:true,
        			}
       			
			},
			messages:{
				modifyday:{required:"修改工作日期不能为空"},
				 },
        });
    });
    
    function checkSubmit(){
    	if(window.confirm('你确定要初始化工作日期吗？')){
            return true;
         }else{
            window.location.href="${ctx}/task/toWorkCalendorMain";
            return false;
        }
    }
    
    
    
    function modifySubmit(){
    	if(window.confirm('你确定要修改工作日期吗？')){
            return true;
         }else{
            window.location.href="${ctx}/task/toWorkCalendorMain";
            return false;
        }
    }
    </script>
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
										<form id="initForm" name="initForm" action="${ctx}/task/initDay" method="post" target="main" onsubmit="return checkSubmit()" >
											<table width="100%" class="cont tr_color">
												<tr>
													<td width="5%">&nbsp;</td>
			                                        <td width="10%">初始日期:</td>
			                                        <td valign="20%">
			                                        	<input style="width:100px;height:20px;" type="text" id="initDay" name="initDay" value=""  onfocus="WdatePicker({dateFmt:'yyyy'})"/>
			                                        </td>
			                                        <td style="color: red;">(*必填) 初始化日期不能为空</td>
			                                        <td width="2%">&nbsp;</td>
												</tr>
												<tr>
			                                    	<td width="100" align="center" height="30"></td>
			                                    	<td>
			                                    		<input type="submit" class="btn" value="初始化"> 
			                                    	</td>
			                                    	<td></td>
			                                    	<td></td>
			                                    </tr>
											</table>
										</form>
									</td>
								</tr>
							</table>
						</td>
						<td width="1%">&nbsp;</td>
					</tr>
					<tr>
                        <td height="40" colspan="4">
                            <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                <tr><td></td></tr>
                            </table>
                        </td>
                    </tr>
					<tr>
						<td width="1%">&nbsp;</td>
						<td width="98%">
							<table width="100%">
								<tr>
									<td colspan="2">
										<form id="modifyForm" name="modifyForm" action="${ctx}/task/modifyDay" method="post" target="main" onsubmit="return modifySubmit()" >
											<table width="100%" class="cont tr_color">
												<tr>
													<td width="5%">&nbsp;</td>
			                                        <td width="10%">修改日期:</td>
			                                        <td valign="20%">
			                                        	<input style="width:100px;height:20px;" type="text" id="modifyday" name="modifyday" value=""  onfocus="WdatePicker({dateFmt:'yyyyMMdd'})"/>
			                                        </td>
			                                        <td style="color: red;">(*必填) 修改日期不能为空</td>
			                                        <td width="2%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">&nbsp;</td>
			                                        <td width="10%">工作日:</td>
			                                        <td valign="center">
			                                        	<select name="workDayType">
				                                              <option value="0" selected="true">非工作日</option>
				                                              <option value="1">工作日</option>
				                                        </select>
			                                        </td>
			                                        <td></td>
			                                        <td width="2%">&nbsp;</td>
												</tr>
												<tr>
			                                    	<td width="100" align="center" height="30"></td>
			                                    	<td>
			                                    		<input type="submit" class="btn" value="修改"> 
			                                    	</td>
			                                    	<td></td>
			                                    	<td></td>
			                                    </tr>
											</table>
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