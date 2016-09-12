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
	        $("#productForm").validate({
	        	rules:{   
	        		productName:{
	        			required:true,
	        			StringCheck :true
	        			},
	        		scale:{
	        			required:true,
	        			numberCheck:true
	        			},
	        		unitcost:{
	        			required:true,
	        			longCheck:true
	        		},
	        		rate:{
	        			required:true,
	        			longCheck:true
	        		},
	        		startdt:{
	        			required:true,
	        		},
	        		holdday:{
	        			required:true,
	        			numberCheck:true
	        		},
	        		lockday:{
	        			required:true,
	        			numberCheck:true
	        		},
	        		backday:{
	        			required:true,
	        			numberCheck:true
	        		},
	        		nonbackday:{
	        			required:true,
	        		},
	        		contrday:{
	        			required:true,
	        		},
	        		proAddress:{
	        			required:true,
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
					  productName:{required:"产品名称不能为空"},
					  scale:{required:"募集规模不能为空"},
					  unitcost:{required:"单价不能为空"},
					  rate:{required:"年化利率不能为空"},
					  startdt:{required:"募集日期不能为空"},
					  holdday:{required:"持有期不能为空"},
					  lockday:{required:"锁定期不能为空"},
					  backday:{required:"返租日期不能为空"},
					  nonbackday:{required:"正常回购日不能为空"},
					  contrday:{required:"合同到期日不能为空"},
					  proAddress:{required:"项目地址不能为空"},
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
			var  J_date_1 =$("#startDate").val();
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
                        <tr><td height="31"><div class="title">产品要素</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">发布光伏系列产品之01---产品要素</h3></td>
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
                                            <form id="productForm" action="${ctx}/publish/project/front" method="post">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="15%">产品名称：</td>
                                                        <td width="25%"><input type="text" name="productName" value="${product.productName}" />
                                                        </td>
														<td>设置产品名称</td>
                                                        <td width="2%">&nbsp;</td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>产品类型：</td>
                                                        <td>
                                                        	<c:if test="${product.productType==null}">
	                                                            <select name="productType">
	                                                                <option value="01" selected="true">美桔系列</option>
	                                                                <option value="02">美橙系列</option>
	                                                                <option value="03">金桔系列</option>
	                                                                <option value="04">美柚系列</option>
	                                                            </select>
                                                            </c:if>
															<c:if test="${product.productType=='01'}">
	                                                            <select name="productType">
	                                                                <option value="01" selected="true">美桔系列</option>
	                                                                <option value="02">美橙系列</option>
	                                                                <option value="03">金桔系列</option>
	                                                                <option value="04">美柚系列</option>
	                                                            </select>
                                                            </c:if>
															<c:if test="${product.productType=='02'}">
	                                                            <select name="productType">
	                                                                <option value="01">美桔系列</option>
	                                                                <option value="02" selected="true">美橙系列</option>
	                                                                <option value="03">金桔系列</option>
	                                                                <option value="04">美柚系列</option>
	                                                            </select>
                                                            </c:if>
															<c:if test="${product.productType=='03'}">
	                                                            <select name="productType">
	                                                                <option value="01">美桔系列</option>
	                                                                <option value="02">美橙系列</option>
	                                                                <option value="03" selected="true">金桔系列</option>
	                                                                <option value="04">美柚系列</option>
	                                                            </select>
                                                            </c:if>
															<c:if test="${product.productType=='04'}">
	                                                            <select name="productType">
	                                                                <option value="01">美桔系列</option>
	                                                                <option value="02">美橙系列</option>
	                                                                <option value="03">金桔系列</option>
	                                                                <option value="04" selected="true">美柚系列</option>
	                                                            </select>
                                                            </c:if>
                                                            
                                                        </td>
                                                        <td>设置产品级别</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>项目进度：</td>
                                                        <td>
															<c:if test="${product.projectStep==null}">
	                                                            <select name="projectStep">
	                                                                <option value="01" selected="true">政府立项</option>
	                                                                <option value="02">现场勘查及设计</option>
	                                                                <option value="03">资料报备及验货</option>
	                                                                <option value="04">设备到场及验收</option>
	                                                                <option value="05">工程实施及验收</option>
	                                                                <option value="06">投产运营</option>
	                                                            </select>
	                                                        </c:if>
															<c:if test="${product.projectStep=='01'}">
	                                                            <select name="projectStep">
	                                                                <option value="01" selected="true">政府立项</option>
	                                                                <option value="02">现场勘查及设计</option>
	                                                                <option value="03">资料报备及验货</option>
	                                                                <option value="04">设备到场及验收</option>
	                                                                <option value="05">工程实施及验收</option>
	                                                                <option value="06">投产运营</option>
	                                                            </select>
	                                                        </c:if>
															<c:if test="${product.projectStep=='02'}">
	                                                            <select name="projectStep">
	                                                                <option value="01">政府立项</option>
	                                                                <option value="02" selected="true">现场勘查及设计</option>
	                                                                <option value="03">资料报备及验货</option>
	                                                                <option value="04">设备到场及验收</option>
	                                                                <option value="05">工程实施及验收</option>
	                                                                <option value="06">投产运营</option>
	                                                            </select>
	                                                        </c:if>
															<c:if test="${product.projectStep=='03'}">
	                                                            <select name="projectStep">
	                                                                <option value="01">政府立项</option>
	                                                                <option value="02">现场勘查及设计</option>
	                                                                <option value="03" selected="true">资料报备及验货</option>
	                                                                <option value="04">设备到场及验收</option>
	                                                                <option value="05">工程实施及验收</option>
	                                                                <option value="06">投产运营</option>
	                                                            </select>
	                                                        </c:if>
															<c:if test="${product.projectStep=='04'}">
	                                                            <select name="projectStep">
	                                                                <option value="01">政府立项</option>
	                                                                <option value="02">现场勘查及设计</option>
	                                                                <option value="03">资料报备及验货</option>
	                                                                <option value="04" selected="true">设备到场及验收</option>
	                                                                <option value="05">工程实施及验收</option>
	                                                                <option value="06">投产运营</option>
	                                                            </select>
	                                                        </c:if>
															<c:if test="${product.projectStep=='05'}">
	                                                            <select name="projectStep">
	                                                                <option value="01">政府立项</option>
	                                                                <option value="02">现场勘查及设计</option>
	                                                                <option value="03">资料报备及验货</option>
	                                                                <option value="04">设备到场及验收</option>
	                                                                <option value="05" selected="true">工程实施及验收</option>
	                                                                <option value="06">投产运营</option>
	                                                            </select>
	                                                        </c:if>
															<c:if test="${product.projectStep=='06'}">
	                                                            <select name="projectStep">
	                                                                <option value="01">政府立项</option>
	                                                                <option value="02">现场勘查及设计</option>
	                                                                <option value="03">资料报备及验货</option>
	                                                                <option value="04">设备到场及验收</option>
	                                                                <option value="05">工程实施及验收</option>
	                                                                <option value="06" selected="true">投产运营</option>
	                                                            </select>
	                                                        </c:if>
                                                        </td>
                                                        <td>设置实际项目所处阶段</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>募集开始日期：</td>
                                                        <td width="20%"><input style="width:100px;" type="text" name="startdt" value="${product.startdt}" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                                                        <td>产品发售日期</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>融资规模：</td>
                                                        <td width="20%"><input style="width:50px;" type="text" name="scale" value="${product.scale}" />
                                                        </td>
                                                        <td>以块为单位</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>产品价格：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="unitcost" value="${product.unitcost}" /></td>
                                                        <td>填写产品单位价格(元)</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>收益率：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="rate" value="${product.rate}" /></td>
                                                        <td>年化收益率</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>可持有年限：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="holdday" value="${product.holdday}" /></td>
                                                        <td>以天为单位，比如365天</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>锁定期：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="lockday" value="${product.lockday}" /></td>
                                                        <td>以天为单位，比如35天</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>计租方式：</td>
                                                        <td>
                                                            <select name="rentType">
                                                                <option value="0" selected="true">次日记租</option>
                                                            </select>
                                                        </td>
                                                        <td>默认购买次日记租</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>每月返租日期：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="backday" value="${product.backday}" /></td>
                                                        <td>选择每个月的某一天返租</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>正常回购日：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="nonbackday" value="${product.nonbackday}" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>合同到期日：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="contrday" value="${product.contrday}" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>预期产生碳豆：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="carbon" value="${product.carbon}" /></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目地址：</td>
                                                        <td width="20%"><textarea name="proAddress" value="${product.proAddress}"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目规模描述：</td>
                                                        <td width="20%"><textarea name="proScaleMess" value="${product.proScaleMess}"></textarea></td>
                                                        <td>简单描述项目的规模情况</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>转让人介绍 ：</td>
                                                        <td><textarea name="transfer" value="${product.transfer}"></textarea></td>
                                                        <td>转让人情况说明</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="submit" value="下一页" /></td>
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