<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/error.css" />
    <script src="${ctx}/js/jquery-1.12.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/sha512.js" type="text/javascript"></script>
    <script type="text/javascript">
	    function checkSubmit(){
	    	if(window.confirm('你确定要修改角色吗？')){
	            return true;
	         }else{
	            return false;
	        }
	    }
    </script>

	<script type="text/javascript">
        $(function() {
           $("#createAll").click(function() {
                $('input[value="create"]').prop("checked",this.checked); 
            });
           var $subBox = $("input[value='create']");
           $subBox.click(function(){
               $("#createAll").prop("checked",$subBox.length == $("input[value='create']:checked").length ? true : false);
           });
        });

        $(function() {
            $("#queryAll").click(function() {
                 $('input[value="query"]').prop("checked",this.checked); 
             });
            var $subBox = $("input[value='query']");
            $subBox.click(function(){
                $("#queryAll").prop("checked",$subBox.length == $("input[value='query']:checked").length ? true : false);
            });
         });

        $(function() {
            $("#modifyAll").click(function() {
                 $('input[value="modify"]').prop("checked",this.checked); 
             });
            var $subBox = $("input[value='modify']");
            $subBox.click(function(){
                $("#modifyAll").prop("checked",$subBox.length == $("input[value='modify']:checked").length ? true : false);
            });
         });

	</script>
 

   	<script type="text/javascript">
	    $(function(){
	    	$("#roleId").blur(function(e){
	    		var roleId = $("#roleId").val();
	    		$.post("${ctx}/role/checkRoleId", { "roleId": roleId},
	    				   function(data){
	    					 var msflag = data.meta.success;
	    					 if(msflag == false){
	    						 $("#roleId").val("该名已存在");
	    						 $("#roleId").focus();
	    					 }
	    				     }, "json");
	    	});
	    });
    </script>

   	<script type="text/javascript">
	    $(function(){
	    	$("#roleName").blur(function(e){
	    		var roleName = $("#roleName").val();
	    		$.post("${ctx}/role/checkRoleName", { "roleName": roleName},
	    				   function(data){
	    					 var msflag = data.meta.success;
	    					 if(msflag == false){
	    						 $("#roleName").val("该名已存在");
	    						 $("#roleName").focus();
	    					 }
	    				     }, "json");
	    	});
	    });
    </script>
    
    <script type="text/javascript">
	    $(function(){
	    	$("#but1").click(function(){
	    		location.href = "${ctx}/role/roleQuery";
	    		});
	    });
	</script>
	
    
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
                        <tr><td height="31"><div class="title">角色资源</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">查询或修改证联资本管理平台用户角色！</h3></td>
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
                        <!-- 添加栏目开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%" border="0">
                                    <tr>
                                        <td colspan="2">
                                            <form id="form1" name="form1" action="${ctx}/role/modifyResult" method="post" onsubmit="return checkSubmit()">
                                                <table width="100%" class="cont" border="0">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>角色ID：</td>
                                                        <td>
                                                        <input id="roleId" class="text" type="text" name="roleId" value="${roleId}" readonly="readonly"/><span style="color: red;">&nbsp;(*必填) &nbsp;包括英文字母、数字和下划线（20位）</span>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td></td>
                                                        <td>
                                                        <span style="color: red;">&nbsp;注意：此处设置的是需要重点保护的资源权限，其他资源权限默认开放</span>
                                                        </td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
													<tr>	
														<td width="2%">&nbsp;</td>
														<td><span style="color: red;">重要资源</span></td>
														<td>															
															<table width="100%" border="0">
																<tr>
																	<td>部门管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${deptManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="deptManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="deptManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
		                                                        			<c:when test="${deptManager_create eq 'Y'}">
		                                                        				<input type="checkbox" value="create"  name="deptManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
		                                                        			</c:when>
		                                                        			<c:otherwise>
		                                                        				<input type="checkbox" value="create"  name="deptManager" /><span style="color:red;">&nbsp;&nbsp;增加</span>
		                                                        			</c:otherwise>
		                                                        		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${deptManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="deptManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="deptManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>账户管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${accountManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="accountManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="accountManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${accountManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="accountManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="accountManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${accountManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="accountManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="accountManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>角色管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${roleManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="roleManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="roleManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${roleManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="roleManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="roleManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${roleManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="roleManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="roleManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>客户管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${customerManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="customerManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="customerManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${customerManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="customerManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="customerManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${customerManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="customerManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="customerManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>产品管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${productManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="productManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="productManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${productManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="productManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="productManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${productManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="productManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="productManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>交易管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${tradeManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="tradeManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="tradeManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${tradeManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="tradeManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="tradeManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${tradeManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="tradeManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="tradeManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>份额管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${shareManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="shareManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="shareManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${shareManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="shareManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="shareManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${shareManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="shareManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="shareManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>日终任务</td>
																	<td>
																		<c:choose>
																			<c:when test="${endDayManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="endDayManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="endDayManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${endDayManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="endDayManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="endDayManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${endDayManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="endDayManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="endDayManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>参数管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${parameterManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="parameterManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="parameterManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${parameterManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="parameterManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="parameterManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${parameterManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="parameterManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="parameterManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>风控管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${riskManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="riskManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="riskManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${riskManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="riskManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="riskManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${riskManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="riskManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="riskManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>信息管理</td>
																	<td>
																		<c:choose>
																			<c:when test="${infoManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="infoManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="infoManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${infoManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="infoManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="infoManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${infoManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="infoManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="infoManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>计划任务</td>
																	<td>
																		<c:choose>
																			<c:when test="${planManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="planManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="planManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${planManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="planManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="planManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${planManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="planManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="planManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td>报表展示</td>
																	<td>
																		<c:choose>
																			<c:when test="${formManager_query eq 'Y'}">
																				<input type="checkbox" value="query"  name="formManager" checked="checked"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="query"  name="formManager"/><span style="color:orange;">&nbsp;&nbsp;查询</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${formManager_create eq 'Y'}">
																				<input type="checkbox" value="create" name="formManager" checked="checked"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="create" name="formManager"/><span style="color:red;">&nbsp;&nbsp;增加</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																		<c:choose>
																			<c:when test="${formManager_modify eq 'Y'}">
																				<input type="checkbox" value="modify" name="formManager" checked="checked"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" value="modify" name="formManager"/><span style="color:blue;">&nbsp;&nbsp;修改</span>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td><input id="queryAll" type="checkbox" value="query"  name="queryAll"/><span style="color:orange;">&nbsp;&nbsp;全选</span></td>
																	<td><input id="createAll" type="checkbox" value="create" name="createAll"/><span style="color:red;">&nbsp;&nbsp;全选</span></td>
																	<td><input id="modifyAll" type="checkbox" value="modify" name="modifyAll"/><span style="color:blue;">&nbsp;&nbsp;全选</span></td>
																</tr>
															</table>
														</td>
														<td></td>
                                                    </tr>
													
                                                    <tr>
                                                        <td><input id="creater" type="hidden" value="<shiro:principal/>" name="creater" /></td>
                                                        <td><input class="btn" type="submit" value="修改" /></td>
                                                        <td><input class="btn" type="button" value="返回" id="but1" /></td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                </table>	
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <!-- 添加栏目结束 -->
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