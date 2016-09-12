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
	        $("#productQuery").validate({
	        	rules:{   
	        		startdt:{
	        			required:true,
	        		},
	        		enddt:{
	        			required:true,
	        			timeCheck:true,
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
					  startdt:{required:"募集开始日期不能为空"},
					  enddt:{required:"募集截止日期不能为空"},

					 },
	        });
	    });
	    
		jQuery.validator.addMethod("timeCheck", function(value, element) {
			var  J_date_1 =$("#startdt").val();
			return this.optional(element) || (J_date_1 <= value);},"开始日期大于结束日期");		
		
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
                        <tr><td height="31"><div class="title">募结审核</div></td></tr>
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
                            	<form id="productQuery" action="${ctx}/estcheck/productQuery" method="post" target="product_estcheck_body" >
                                <table border="0" width="100%" >
                                    <tr>
                                        <td width="100" align="center" height="50"><img src="${ctx}/images/base/mime.gif" /></td>
                                        <td valign="center">募集开始日期<span style="color: red;">&nbsp;(*必填)：</td>
                                        <td valign="center"><input style="width:100px;" type="text" id="startdt" name="startdt" value="" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyyMMdd'})"/></td>
                                        <td valign="center">募集截止日期<span style="color: red;">&nbsp;(*必填)：</td>
                                        <td valign="center"><input style="width:100px;" type="text" id="enddt" name="enddt" value="" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyyMMdd'})"/></td>
                                        <td valign="center">产品编号：</td>
                                        <td valign="center"><input type="text" name="productId" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td width="100" align="center" height="30"></td>
                                        <td valign="center">产品类型：</td>
                                        <td valign="center">
                                        	<select name="productType">
                                               <option value="999" selected="true">不限</option>
                                               <option value="005">标准系列</option>
                                               <option value="002">基金系列</option>
                                               <option value="003">信托系列</option>
                                               <option value="004">众筹系列</option>
                                               <option value="000">光伏系列</option>
                                               <option value="001">电能系列</option>
                                               
	                                        </select>
	                                    </td>
	                                    <td valign="center">还款方式：</td>
                                        <td valign="center">
                                         	<select name="repayMode">
                                               <option value="9" selected="true">不限</option>
                                               <option value="0">等额本息（月）</option>
                                               <option value="2">等额本金（月）</option>
                                               <option value="1">一次还本付息（天）</option>
                                               <option value="3">每月付息到期还本（月）</option>
                                               <option value="4">每月付息到期还本（天）</option>
	                                        </select>
                                        </td>
	                                    
                                    </tr>
                                    <tr>
                                    	<td width="100" align="center" height="30"></td>
                                    	<td></td>
                                    	<td><input class="btn"  type="submit" style="width:60px;height:25px" value="查&nbsp;&nbsp;询"> </td>
                                    	<td></td>
                                    	<td></td>
                                    </tr>
                                </table>
                                </form>
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
				</table>
              </td>
              <td background="${ctx}/images/base/mail_right_bg.gif">&nbsp;</td>
            </tr>
          </table>
    </body>
</html>