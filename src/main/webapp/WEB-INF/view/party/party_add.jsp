<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <script src="${ctx}/js/jquery-1.12.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
    
    <script type="text/javascript">
	    function checkSubmit(){
	    	if(window.confirm('你确定要增加部门吗？')){
	            return true;
	         }else{
	            return false;
	        }
	    }
    </script>
    
    <script type="text/javascript">
	    $(function(){
	        $("#form1").validate({
	        	rules:{   
	        		partyName:{
	        			required:true,
	        			},
	        		partyPerson:{
	        			required:true,
	        			},
	        		phone:{
	        			required:true,
	        			digits:true,
	        		},
	        		partyDescription:{
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
					partyName:{required:"部门名称不能为空"},
					partyPerson:{required:"部门负责人不能为空"},
					phone:{
						required:"负责人联系方式不能为空",
						digits:"必须是数字"
						},
					partyDescription:{required:"部门描述不能为空"},
				},

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
                        <tr><td height="31"><div class="title">新建机构</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">创建证联资本部门机构！</h3></td>
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
                                            <form id="form1" name="form1" action="${ctx}/party/addResult" method="post" onsubmit="return checkSubmit()">
                                                <table width="100%" class="cont">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="10%">部门名称：</td>
                                                        <td width="20%"><input class="text" type="text" name="partyName" value="" maxlength="8"/></td>
                                                        <td style="color: red;">(*必填) &nbsp;请填写部门的名字</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>部门负责人：</td>
                                                        <td><input class="text" type="text" name="partyPerson" value="" maxlength="8"/></td>
                                                        <td style="color: red;">(*必填) &nbsp;部门负责人名称</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>联系电话：</td>
                                                        <td><input class="text" type="text" name="phone" value="" maxlength="11"/></td>
                                                        <td style="color: red;">(*必填) &nbsp;部门负责人的联系电话</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>部门描述：</td>
                                                        <td><input class="text" type="text" name="partyDescription" value="" maxlength="20"/></td>
                                                        <td style="color: red;">(*必填)&nbsp; 请输入不大于20个字符的描述信息</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>部门类型：</td>
                                                        <td>
                                                            <select name="partyType">
                                                                <option value="01" selected="true">一级部门</option>
                                                                <option value="02" >二级部门</option>
                                                            </select>
                                                        </td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>所属上级部门：</td>
                                                        <td>
                                                       		<ul><input type="radio" name="partyNumber" value="GENERAL_MANA_OFFICE" checked="checked"/> 总经办</ul>
                                                            <ul><input type="radio" name="partyNumber" value="2" disabled="disabled"/> 运营部门</ul>
                                                            <ul><input type="radio" name="partyNumber" value="3" disabled="disabled"/> 市场部门</ul>
                                                            <ul><input type="radio" name="partyNumber" value="4" disabled="disabled"/> 技术部门</ul>
                                                            <ul><input type="radio" name="partyNumber" value="5" disabled="disabled"/> 人力部门</ul>
                                                        </td>
                                                        <td><h3 style="letter-spacing:1px; color: red;"> &nbsp;&nbsp; 暂不支持开立二级部门</h3></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="submit" value="提交" /></td>
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