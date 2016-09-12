<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <title>证联资本管理中心</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="证联资本金融网销平台管理系统" />
    <meta name="keywords" content="证联资本,网站管理系统,企业网站" />
    <meta name="Author" content="sunny-tang" />
    <meta name="CopyRight" content="北京证联资本有限责任公司" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <script src="${ctx}/js/jquery-1.12.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/sha512.js" type="text/javascript"></script>
    
    <script>
    $(function() {
        $(".jcaptcha-btn").click(function() {
            $(".jcaptcha-img").attr("src", '${ctx}/jcaptcha?'+new Date().getTime());
        });
    });
	</script>

	<script type="text/javascript">
	    $(function(){
	    	$("#form1").submit(function(e){
	    		var pass = $("#password").val();
	    		var shaObj = new jsSHA("SHA-512", "TEXT");
	    		shaObj.update(pass);
	    		var hash = shaObj.getHash("B64");
	    		$("#password").val(hash);
	    	});
	    });
    </script>
	

    <script type="text/javascript">
	    $(function(){
	        $("#form1").validate({
	        	rules:{   
	        		username:{
	        			required:true,
	        			},
	        		password:{
	        			required:true,
	        			},
	        		jcaptchaCode:{
	        			required:true,
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
					username:{required:"登录名不能为空"},
					password:{required:"密码不能为空"},
					jcaptchaCode:{required:"验证码不能为空"},
				},

	        });
	    });
	    
   	</script>	


    
</head>
    <body>
        <table width="100%">
            <!-- 顶部部分 -->
            <tr height="41"><td colspan="2" background="${ctx}/images/base/login_top_bg.gif">&nbsp;</td></tr>
            <!-- 主体部分 -->
            <tr style="background:url(${ctx}/images/base/login_bg.jpg) repeat-x;" height="532">
                <!-- 主体左部分 -->
                <td id="left_cont">
                    <table width="100%" height="100%">
                        <tr height="155"><td colspan="2">&nbsp;</td></tr>
                        <tr>
                            <td width="20%" rowspan="2">&nbsp;</td>
                            <td width="60%">
                                <table width="100%">
                                    <tr height="70"><td align="right"><img src="${ctx}/images/base/logo.gif" title="证联资本" alt="证联资本" /></td></tr>
                                    <tr height="274">
                                        <td valign="top" align="right">
                                            <ul>
                                                <li>1- 证联资本金融网销平台解决方案...</li>
                                                <li>2- 能源宝、众筹后台管理系统...</li>                    
                                                <li><img src="${ctx}/images/base/icon_demo.gif" />&nbsp;<a href="javascript:void(0)">使用说明</a>&nbsp;&nbsp;<span> <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=609307843&site=qq&menu=yes" onfocus="this.blur()"><img border="0" src="http://wpa.qq.com/pa?p=2:609307843:41" alt="证联资本为您服务" title="证联资本"></a> </span></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            <td width="15%" rowspan="2">&nbsp;</td>
                            </td>
                        </tr>
                        <tr><td colspan="2">&nbsp;</td></tr>
                    </table>
                </td>
                <!-- 主体右部分 -->
                <td id="right_cont">
                    <table height="100%">
                        <tr height="30%"><td colspan="3">&nbsp;</td></tr>
                        <tr>
                            <td width="30%" rowspan="5">&nbsp;</td>
                            <td valign="top" id="form">
                                <form id="form1" name="form1" action="${ctx}/logincheck" method="post">
                                    <table valign="top" width="50%">
                                        <tr><td colspan="2"><h4 style="letter-spacing:1px;font-size:16px;">管理中心用户登录</h4></td></tr>
                                        <tr><td>管理员：</td><td><input type="text" name="username" value=""/></td></tr>
                                        <tr><td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td><td><input id="password" type="password" name="password" value="" /></td></tr>
										<tr><td>验证码：</td><td><input type="text" name="jcaptchaCode"></td>
										    <td><img class="jcaptcha-img" src="${ctx}/jcaptcha" title="点击更换验证码">
										    <a class="jcaptcha-btn" href="javascript:;">换一张</a></td>
										</tr>
										<tr><td colspan="2"><h4 style="color:red;font-size:16px;">${failureKeyAttribute}</h4></td></tr> 
										<tr><td colspan="2"><input type="hidden" name="userName" value="Donald"/></td></tr>                                  
                                        <tr class="bt" align="center"><td>&nbsp;<input type="submit" value="登陆" /></td><td>&nbsp;<input type="reset" value="重填" /></td></tr>
                                    </table>
                                </form>
                            </td>
                            <td rowspan="5">&nbsp;</td>
                        </tr>
                        <tr><td colspan="3">&nbsp;</td></tr>
                    </table>
                </td>
            </tr>
            <!-- 底部部分 -->
            <tr id="login_bot"><td colspan="2"><p>${Copyright}</p></td></tr>
        </table>
    </body>
</html>
