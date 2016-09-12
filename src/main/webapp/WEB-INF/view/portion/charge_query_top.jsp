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
	    $(function(){
	        $("#chargeQueryForm").validate({
	        	rules:{   
	        		accountDateS:{
	        			required:true,
	        		},
	        		accountDateE:{
	        			required:true,
	        			timeCheck:true
	        		},
	        		proScaleMess:{
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
					  accountDateS:{required:"账务起始日期不能为空"},
					  accountDateE:{required:"账务截止日期不能为空"},
					  proScaleMess:{required:"规模描述不能为空"},
					 },
	        });
	    });
	    
   		jQuery.validator.addMethod("StringCheck", function(value, element) {       
		return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);}, "只能包括中文字、英文字母、数字和下划线"); 
   		
		jQuery.validator.addMethod("longCheck", function(value, element) {
			var reg = new RegExp("^[0-9]+(.[0-9]{2})?$", "g");  
			return this.optional(element) || reg.test(value);},"精确到小数点2位的数字");
		
		jQuery.validator.addMethod("numberCheck", function(value, element) {
			if(value!=",")
			value=value.replace(/\,/g,"");
			return this.optional(element) || /^[0-9]*[1-9][0-9]*$/.test(value);},"请输入正整数");
		
		jQuery.validator.addMethod("multipleCheck", function(value, element) {
			value=value.replace(/\,/g,"");
			var  investMinAmt =$("#investMinAmt").val();
			investMinAmt=investMinAmt.replace(/\,/g,"");
			return this.optional(element) || (value%investMinAmt ==0);},"必须是投资起点的整数倍");
		
		jQuery.validator.addMethod("timeCheck", function(value, element) {
			var  J_date_1 =$("#accountDateS").val();
			return this.optional(element) || (J_date_1<=value);},"开始日期<=结束日期");		
		
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
                        <tr><td height="31"><div class="title">记账流水</div></td></tr>
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
                    	<form id="chargeQueryForm" name="chargeQuery" action="${ctx}/portion/chargeQuery" method="post" target="charge_query_body" >
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table border="0" width="100%" >
                                    <tr>
                                        <td width="100" align="center" height="50"><img src="${ctx}/images/base/mime.gif" /></td>
                                        <td valign="center">记账流水ID:</td>
                                        <td valign="center"><input type="text" name="bookId" value="" /></td>
                                        <td valign="center">账务起始日期:</td>
                                        <td valign="center"><input type="text" name="accountDateS" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyyMMdd'})"/></td>
                                        <td valign="center">账务截止日期:</td>
                                        <td valign="center"><input type="text" name="accountDateE" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyyMMdd'})"/></td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="center" height="30"></td>
                                        <td valign="center">交易订单号:</td>
                                        <td valign="center"><input type="text" name="orderId" value="" /></td>
                                        <td valign="center">支付订单号:</td>
                                        <td valign="center"><input type="text" name="paymentId" value="" /></td>
                                        <td valign="center">记账状态:</td>
                                        <td valign="center">
                                        	<select name="accStatus">
	                                              <option value="99" selected="true">未选择</option>
	                                              <option value="00">已记账</option>
	                                              <option value="01">已冲正</option>
	                                        </select>
                                        	
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td width="100" align="center" height="30"></td>
                                    	<td><input type="hidden" name="pageSize" value="8" /></td>
                                    	<td><input type="button" style="width:60px;height:25px" name="Button" value="查&nbsp;&nbsp;询" onClick="javascript:document.chargeQuery.submit();"> </td>
                                    	<td></td>
                                    	<td></td>
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
					</form>
				</table>
              </td>
              <td background="${ctx}/images/base/mail_right_bg.gif">&nbsp;</td>
            </tr>
          </table>
    </body>
</html>