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

    <script type="text/javascript">
		$(function(){
		    $("#rentForm").validate({
		    	rules:{   
		    		rentName:{
		    			required:true,
		    			},
		    		rentUnit:{
		    			required:true,
		    		},
		    		rentMessage:{
		    			required:true,
		    		},
		    		rentProduce:{
		    			required:true,
		    		},
		    		produceIntro:{
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
						rentName:{required:"租赁物名称不能为空"},
						rentUnit:{required:"租赁物单价不能为空"},
						rentMessage:{required:"租赁物描述不能为空"},
						rentProduce:{required:"供应商名称不能为空"},
						produceIntro:{required:"供应商介绍不能为空"},
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
                        <tr><td height="31"><div class="title">租赁物件</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">发布光伏系列产品之04---租赁物信息</h3></td>
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
                        <!-- 添加产品开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form id="rentForm" action="${ctx}/publish/finAdd" method="post">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="15%">租赁物名称：</td>
                                                        <td width="25%"><input class="text" type="text" name="rentName" value="" /></td>
                                                        <td>租赁物名称信息</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>租赁物单价：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="rentUnit" value="${product.unitcost}" /></td>
                                                        <td>填写租赁产品单位价格(元)</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>租赁物描述：</td>
                                                        <td width="20%"><textarea name="rentMessage"></textarea></td>
                                                        <td>简单描述租赁物件的情况</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>租赁物供应商：</td>
                                                        <td width="20%"><textarea name="rentProduce"></textarea></td>
                                                        <td>租赁物供应商名称</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>租赁物供应商介绍：</td>
                                                        <td width="20%"><textarea name="produceIntro"></textarea></td>
                                                        <td>简单描述租赁物件供应商情况</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>其他情况描述1：</td>
                                                        <td width="20%"><textarea name="otherRemark1"></textarea></td>
                                                        <td>简单描述其他情况1</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>其他情况描述2：</td>
                                                        <td width="20%"><textarea name="otherRemark2"></textarea></td>
                                                        <td>简单描述其他情况2</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>其他情况描述3：</td>
                                                        <td width="20%"><textarea name="otherRemark3"></textarea></td>
                                                        <td>简单描述其他情况3</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><a href="${ctx}/publish/finance/back" class="btn" >上一页</a><input class="btn" type="submit" value="提交" /></td>
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
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="51%" class="left_txt">
                                <img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：tangxc@zlebank.com<br />
                                <img src="${ctx}/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="http://www.zlebank.com/" target="_blank">证联资本</a>
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