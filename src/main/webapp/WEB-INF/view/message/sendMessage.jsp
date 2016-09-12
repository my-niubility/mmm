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
    <script src="${ctx}/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    
    <script type="text/javascript">
		function radioShow(){
			var myradio=document.getElementsByName("firstChoice");  //获取标签名为firstChoice的标签
			var div=document.getElementById("secondChoice").getElementsByTagName("div");
			for(i=0;i<div.length;i++){
				if(myradio[i].checked){
					div[i].style.display="block";
					div[i].getElementsByTagName("input")[0].checked=true;
				}else{
					div[i].style.display="none";
					var childRadio=div[i].getElementsByTagName("input");
					for(j=0;j<childRadio.length;j++){
						 if (childRadio[j].checked)
							 childRadio[j].checked=false;
					} 
				}
			}
		}
		
		 
	</script>
	   
    
	 <script type="text/javascript">
		
	    $(function(){
	        $("#sendMessage").validate({
	        	rules:{   
	        		title:{
	        			required:true,
	        			},
	        		content:{
	        			required:true,
	        			},
	        	/* messageType:{
	        			required:true,
	        		}, */
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
					title:{required:"消息标题不能为空"},
					content:{required:"消息内容不能为空"},
					//messageType:{required:"消息类型不能为空",},
					
				},
				submitHandler:function(form) {
	            if (confirm("你确定要发送消息吗？")) {         
	                return true;
	             }else{
	            	 return false;
	             }
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
                        <tr><td height="31"><div class="title">站内信管理</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:3px;">发送站内信通知</h3></td>
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
                                            <form id="sendMessage" name="sendMessage" action="${ctx}/message/create" method="post" onsubmit="return checkSubmit()">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="8%">消息标题：</td>
                                                        <td width="40%"><input style="height:20px;width:300px;" type="text" id="title" name="title" size="40"/>
                                                        </td>
                                                        <td width="5%">&nbsp;</td>
														<td style="color: green;">(*必填) 设置消息标题</td>
                                                        <td width="20%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="8%">消息内容：</td>
                                                        <td width="40%"><textarea  style="height:80px;width:300px;" id="content" name="content"></textarea></td>
                                                        <td width="5%">&nbsp;</td>
                                                        <td style="color: green;"> (*必填) 设置消息内容</td>
                                                        <td width="20%">&nbsp;</td>
                                                    </tr> 
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="8%">消息类型：</td>
                                                        <td width="40%">
                                                            <select id="messageType" name="messageType" style="height:20px;">
                                                                <option value="0" selected="true">系统消息</option>
                                                                <option value="1" >业务消息</option>
                                                            </select>
														</td>
                                                        <td width="5%">&nbsp;</td>
                                                        <td style="color: green;" width="5%">(*必填) 设置消息类型</td>
                                                        <td width="20%">&nbsp;</td> 
                                                    </tr>
                                                   <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="8%">收信用户：</td>
                                                        <td >
                                                        	<label for="r1" class="red"><input name="firstChoice" id="r1" type="radio" value="1"  onclick="radioShow();" checked="checked" />购买过特定产品</label>
                                                            <label for="r2" class="red"><input name="firstChoice" id="r2" type="radio" value="2"  onclick="radioShow();" />投资总金额范围</label>
                                                            <label for="r3" class="red"><input name="firstChoice" id="r3" type="radio" value="3"  onclick="radioShow();" />最近三个月投资范围</label>
                                                            <label for="r4" class="red"><input name="firstChoice" id="r4" type="radio" value="4"  onclick="radioShow();" />平台所有用户</label>
                                                        </td>
                                                        <td width="5%">&nbsp;</td>
                                                        <td style="color: green;" width="5%">(*必填) 设置收信用户一级分类</td>
                                                        <td width="20%">&nbsp;</td>
                                                    </tr> 
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="8%">&nbsp;</td>
                                                        <td width="40%">
                                                        		<div id="secondChoice">
																	<div class="c1">
																	<label for="standard"><input name="secondChoice" id="standard" type="radio" value="11" checked="checked" />标准产品</label>
																	<label for="zhongchou"><input name="secondChoice" id="xzhongchou" type="radio" value="12" />众筹产品</label>
																	<label for="jijin"><input name="secondChoice" id="jijin" type="radio" value="13" />基金系列 </label>
																	<label for="xintuo"><input name="secondChoice" id="xintuo" type="radio" value="14" />信托系列</label>
																	<label for="guangfu"><input name="secondChoice" id="guangfu" type="radio" value="15" />光伏系列</label>
																	<label for="dianneng"><input name="secondChoice" id="dianneng" type="radio" value="16" />电能系列 </label>
																	</div>
																	<div class="c2" style="display:none;">
																	<label for="gt10"><input name="secondChoice" id="gt10" type="radio" value="21"  //>大于10万</label>
																	<label for="gt20"><input name="secondChoice" id="gt20" type="radio" value="22" />大于20万</label>
																	<label for="gt502"><input name="secondChoice" id="gt502" type="radio" value="23" />大于50万</label>
																	<label for="gt100"><input name="secondChoice" id="gt100" type="radio" value="24" />大于100万</label>
																	</div>
																	<div class="c3" style="display:none;">
																	<label for="gt1"><input name="secondChoice" id="gt1" type="radio" value="31" //>大于1万</label>
																	<label for="gt5"><input name="secondChoice" id="gt5" type="radio" value="32" />大于5万</label>
																	<label for="gt102"><input name="secondChoice" id="gt102" type="radio" value="33" />大于10万</label>
																	<label for="gt502"><input name="secondChoice" id="gt502" type="radio" value="34" />大于50万</label>
																	</div>
																</div>
                                                        </td>
                                                        <td width="5%">&nbsp;</td>
														<td style="color: green;"width="5%">(*必填) 设置收信用户二级分类</td>
                                                        <td width="20%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="2%">&nbsp;</td>
                                                        <td colspan="3" align="center" >
                                                        	
                                                          <input type="submit" style="width:60px;height:25px;margin-right: 200px;" name="Button" value="发&nbsp;&nbsp;送" >
                                                          <!--<input type="submit" class="btn" value="发送"> -->
                                                        <td width="20%">&nbsp;</td> 
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
                                <img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：${serviceEmail} <br />
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