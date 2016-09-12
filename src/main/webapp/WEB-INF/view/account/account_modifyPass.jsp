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
	    $(function(){
	    	$("#form1").submit(function(e){
	    		var checkPass = $("#passwordCheck").val();
	    		var newPass = $("#password").val();
	    		var oldPass = $("#passwordOld").val();
	    		if((oldPass != null && oldPass !='' ) && (checkPass !=null && checkPass !='') && (newPass !=null && newPass !='') ){
		    		if(checkPass == newPass){
			    		var shaObj = new jsSHA("SHA-512", "TEXT");
			    		shaObj.update(checkPass);
			    		var hash = shaObj.getHash("B64");
			    		$("#cycPasswordNew").val(hash);
			    		$("#passwordCheck").val("defult");
			    		$("#password").val("defult");
			    		//oldPass set
			    		var oldObj = new jsSHA("SHA-512", "TEXT");
			    		oldObj.update(oldPass);
			    		var oldHash = oldObj.getHash("B64");
			    		$("#cycPasswordOld").val(oldHash);
			    		$("#passwordOld").val("defult");
		    		}else{
		    			$("#password").focus();
		    			$("#password").val("两次密码不一致");
		    		}

	    		}else{
	    			return false;
	    		}
	    		
	    		
	    	});
	    });
    </script>
    
    <script type="text/javascript">
	    $(function(){
	        $("#form1").validate({
	        	rules:{   
	        		passwordOld:{
	        			required:true,
	        			},
	        		password:{
	        			required:true,
	        			},
	        		passwordCheck:{
	        			required:true,
	        			passCheck:true,
	        		},
	        		errorPlacement: function(error, element) {     
	        		    if (element.is(":radio"))
	        		        error.appendTo(element.parent().next().next());
	        		    else if (element.is(":checkbox"))
	        		        error.appendTo(element.next());
	        		    else
	        		        error.appendTo(element.parent().next());
	        		}
	        		
				},
				messages:{
					passwordOld:{required:"初始密码不能为空"},
					password:{required:"新密码不能为空"},
					passwordCheck:{required:"确认密码不能为空"},
				},

	        });
	    });
	    
		jQuery.validator.addMethod("passCheck", function(value, element) {
			var  J_date_1 =$("#password").val();
			if(this.optional(element) || (J_date_1 == value)){
				return true;
			}else{
				$("#passwordCheck").focus();
				return false;
			}
			
		},"两次密码不一致");		


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
                        <tr><td height="31"><div class="title">修改密码</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">创建证联资本平台用户修改密码！</h3></td>
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
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form id="form1" name="form1" action="${ctx}/account/modifyPass" method="post" >
                                                <table width="100%" class="cont">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>用户名称：</td>
                                                        <td><input id="loginName" class="text" type="text" name="loginName" value="<shiro:principal/>" maxlength="20" readonly="readonly"/></td>
                                                        <td style="color: red;"></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>原始用户密码：</td>
                                                        <td><input id="passwordOld" class="text" type="password" name="passwordOld" value="" maxlength="20"/></td>
                                                        <td style="color: red;">(*必填) &nbsp;用户登录密码，初始密码</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>新密码：</td>
                                                        <td><input id="password" class="text" type="password" name="password" value="" maxlength="20"/></td>
                                                        <td style="color: red;">(*必填) &nbsp;新设置密码</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>确认密码：</td>
                                                        <td><input id="passwordCheck" class="text" type="password" name="passwordCheck" value="" maxlength="20"/></td>
                                                        <td style="color: red;">(*必填) &nbsp;新确认密码</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input id="cycPasswordOld" type="hidden" name="cycPasswordOld" value="" /></td>
                                                        <td colspan="3"><input class="btn" type="submit" value="提交" /></td>
                                                        <td><input id="cycPasswordNew" type="hidden" name="cycPasswordNew" value="" /></td>
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