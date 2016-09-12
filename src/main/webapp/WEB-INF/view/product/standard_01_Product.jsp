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
	        		scaleLimit:{
	        			required:true,
	        			numberCheck:true
	        			},
	        		unitcost:{
	        			required:true,
	        			longCheck:true
	        		},
	        		investMin:{
	        			required:true,
	        			numberCheck:true
	        		},
	        		rate:{
	        			required:true,
	        			longCheck:true
	        		},
	        		startTime:{
	        			required:true
	        		},
	        		
	        		endTime:{
	        			required:true,
	        			timeCheck:true,
	        		},
	        		holdday:{
	        			required:true,
	        			numberCheck:true
	        		},
	        		blockday:{
	        			required:true,
	        			numberCheck:true
	        		},
	        		tlockday:{
	        			numberCheck:true
	        		},
	        		backday:{
	        			required:true,
	        			numberCheck:true,
	        			mothCheck:true
	        		},
	        		subsidyDay:{
	        			required:true,
	        			numberCheck:true
	        		},
	        		subsidyRate:{
	        			required:true,
	        			longCheck:true
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
					  scaleLimit:{required:"募集规模不能为空"},
					  unitcost:{required:"单价不能为空"},
					  investMin:{required:"投资下限不能为空"},
				 	  rate:{required:"年化利率不能为空"},
					  startTime:{required:"募集开始时间不能为空"},
					  endTime:{required:"募集结束时间不能为空"},
					  holdday:{required:"募集期不能为空"},
					  blockday:{required:"赎回锁定期不能为空"},
					  backday:{required:"返租日期不能为空"},
					  subsidyDay:{required:"补贴天数不能为空"},
					  subsidyRate:{required:"补贴年化利率不能为空"},
					 },
	        });
	    });
	    
   		jQuery.validator.addMethod("StringCheck", function(value, element) {       
		return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);}, "只能包括中文字、英文字母、数字和下划线"); 
   		
		jQuery.validator.addMethod("longCheck", function(value, element) {
			var reg = new RegExp("^[0-9]+(.[0-9]{2})?$", "g");  
			return this.optional(element) || reg.test(value);},"精确到小数点2位的数字");
	
		jQuery.validator.addMethod("mothCheck", function(value, element) {
			var reg = new RegExp("^((0?[1-9])|((1|2)[0-8]))$", "g");  
			return this.optional(element) || reg.test(value);},"只能指定1到28日");
		
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
			var  J_date_1 =$("#startTime").val();
			return this.optional(element) || (J_date_1 <= value);},"开始日期大于结束日期");		
		
   	</script>	
    
    
    <script type="text/javascript">
		$(document).ready(function(){
		  $("#hodt").show();
		  $("#hody").hide();
		  $("#bodt").show();
		  $("#body").hide();
		  $("#todt").show();
		  $("#tody").hide();

		  $("#rentMode").change(function(){
			 var bb = $("#rentMode").val();
			 if("0"==bb){
				 $("#hody").show();
				 $("#hodt").hide();
				 $("#body").show();
				 $("#bodt").hide();
				 $("#tody").show();
				 $("#todt").hide();
			 }else if("1"==bb){
				 $("#hody").show();
				 $("#hodt").hide();
				 $("#body").show();
				 $("#bodt").hide();
				 $("#tody").show();
				 $("#todt").hide();
			 }else if("2"==bb){
				 $("#hodt").show();
				 $("#hody").hide();
				 $("#bodt").show();
				 $("#body").hide();
				 $("#todt").show();
				 $("#tody").hide();
			 }else if("3"==bb){
				 $("#hody").show();
				 $("#hodt").hide();
				 $("#body").show();
				 $("#bodt").hide();
				 $("#tody").show();
				 $("#todt").hide();
			 }else if("4"==bb){
				 $("#hodt").show();
				 $("#hody").hide();
				 $("#bodt").show();
				 $("#body").hide();
				 $("#todt").show();
				 $("#tody").hide();
			 }
		  });
		});
	</script>
    
    <script type="text/javascript">
		$(document).ready(function(){

		  $("#establish").change(function(){
			 var bb = $("#establish").val();
			 if("0"==bb){
				 $("#xxEstab").hide();
				 $("#blEstab").hide();
			 }else if("1"==bb){
				 $("#blEstab").show();
				 $("#xxEstab").hide();
			 }else if("2"==bb){
				 $("#xxEstab").show();
				 $("#blEstab").hide();
			 }
		  });
		});
	</script>
    
    <script type="text/javascript">
		$(document).ready(function(){

		  $("#scaleLimitFlag").change(function(){
			 var bb = $("#scaleLimitFlag").val();
			 if("0"==bb){
				 $("#scaleLimit").hide();
			 }else if("1"==bb){
				 $("#scaleLimit").show();
			 }
		  });
		});
	</script>
    
   	<script type="text/javascript">
		$(document).ready(function(){

		  $("#subsidyFlag").change(function(){
			 var bb = $("#subsidyFlag").val();
			 if("0"==bb){
				 $("#subsidy").hide();
			 }else if("1"==bb){
				 $("#subsidy").show();
			 }
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
                                        <td valign="bottom"><h3 style="letter-spacing:3px;">发布标准产品步骤1-->产品要素</h3></td>
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
                                            <form id="productForm" action="${ctx}/publish/project/standard_02" method="post">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="3%">&nbsp;</td>
                                                        <td width="15%">产品名称：</td>
                                                        <td width="35%">
                                                        	<input style="height:20px;" type="text" name="productName" size="40"/>
                                                        	<input type="hidden" name="productType" value="${productType}"/>
                                                        </td>
														<td style="color: green;">(*必填) 设置产品名称</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>募集开始时间：</td>
                                                        <td width="20%"><input style="width:150px;height:20px;" type="text" id="startTime" name="startTime"  readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                                                        <td style="color: green;">(*必填) 产品设定从什么时间开始募集</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>募集结束时间：</td>
                                                        <td width="20%"><input style="width:150px;height:20px;" type="text" id="endTime" name="endTime"  readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                                                        <td style="color: green;">(*必填) 产品预计结束时间</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>融资规模：</td>
                                                        <td width="20%"><input style="width:100px;height:20px;" type="text" name="scale"  />
                                                        </td>
                                                        <td style="color: green;">(*必填) 以份为单位</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>产品价格：</td>
                                                        <td width="20%"><input class="text" style="width:100px;height:20px;" type="text" name="unitcost"  /></td>
                                                         <td style="color: green;">(*必填) 填写产品单位价格(元)</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>投资下限：</td>
                                                        <td width="20%"><input class="text" style="width:100px;height:20px;" type="text" name="investMin" /></td>
                                                        <td style="color: green;">(*必填) 投资下限 以份为单位</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>预期年化收益率：</td>
                                                        <td width="20%"><input class="text" style="width:100px;height:20px;" type="text" name="rate" /></td>
                                                        <td style="color: green;">(*必填) 预期年化收益率</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>投资上限设定：</td>
                                                        <td width="20%">
                                                            <select id="scaleLimitFlag" name="scaleLimitFlag" style="height:20px;">
                                                                <option value="0" selected="true">不设定</option>
                                                                <option value="1" >设定</option>
                                                            </select>
														</td>
                                                        <td style="color: red;">
                                                        <div id="scaleLimit" style="display:none;">投资上限：<input style="width:100px;height:20px;" type="text" name="scaleLimit" />&nbsp;以份为单位</div>
                                                        </td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>利息返回方式：</td>
                                                        <td>
                                                            <select id="rentMode" name="rentMode" style="height:20px;">
                                                                <option value="0" >等额本息（月）</option>
                                                                <option value="2" >等额本金（月）</option>
                                                                <option value="1" selected="true">一次还本付息（天）</option>
                                                                <option value="3" >每月付息到期还本（月）</option>
                                                                <option value="4" >每月付息到期还本（天）</option>
                                                            </select>
                                                        </td>
                                                        <td style="color: green;">(*必填) 默认一次还本付息</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>融资期限：</td>
                                                        <td width="20%"><input class="text" style="width:100px;height:20px;" type="text" name="holdday" /><div id="hody" style="display:inline;color: red" >&nbsp;月</div><div id="hodt" style="display:inline;color: red">&nbsp;天</div></td>
                                                        <td style="color: green;">(*必填) 月单位为标准30天</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>赎回锁定期：</td>
                                                        <td width="20%"><input class="text" style="width:100px;height:20px;" type="text" name="blockday" /><div id="body" style="display:inline;color: red" >&nbsp;月</div><div id="bodt" style="display:inline;color: red">&nbsp;天</div></td>
                                                        <td style="color: green;">(*必填) 月单位为标准30天</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>是否允许转让：</td>
                                                        <td>
                                                            <select id="transferFlag" name="transferFlag" style="height:20px;">
                                                                <option value="0" selected="true">允许转让</option>
                                                                <option value="1" >不允许转让</option>
                                                            </select>
                                                        </td>
                                                        <td style="color: red;"></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>转让锁定期：</td>
                                                        <td width="20%">
                                                        <input class="text" style="width:100px;height:20px;" type="text" name="tlockday"  /><div id="tody" style="display:inline;color: red" >&nbsp;月</div><div id="todt" style="display:inline;color: red">&nbsp;天</div>
                                                        </td>
                                                        <td style="color: green;">(*选填) 月单位为标准30天，不填表示不锁定</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>计租方式：</td>
                                                        <td>
                                                            <select name="rentType" style="height:20px;">
                                                                <option value="0" selected="true">次日记租</option>
                                                                <option value="1" >成立记租</option>
                                                            </select>
                                                        </td>
                                                        <td style="color: green;">默认购买次日记租</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>每月返租日期：</td>
                                                        <td width="20%"><input class="text" style="width:100px;height:20px;" type="text" name="backday" /></td>
                                                        <td style="color: green;">选择每个月的某一天返租</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目成立条件：</td>
                                                        <td width="20%">
                                                            <select id="establish" name="establish" style="height:20px;">
                                                                <option value="" selected="true">不限</option>
                                                                <option value="1" >比例</option>
                                                                <option value="2" >下线</option>
                                                            </select>
														</td>
                                                        <td style="color: red;">
                                                        <div id="xxEstab" style="display:none;">下线选择：<input class="text" style="width:100px;height:20px;" type="text" name="xxEstabValue"  />&nbsp;份</div>
                                                        <div id="blEstab" style="display:none;">比例选择：
                                                            <select id="blEstabValue" name="blEstabValue" style="height:20px;">
                                                            	<option value="" selected="true"></option>
                                                                <option value="10" >10%</option>
                                                                <option value="15" >15%</option>
                                                                <option value="20" >20%</option>
                                                                <option value="25" >25%</option>
                                                                <option value="30" >30%</option>
                                                                <option value="35" >35%</option>
                                                                <option value="40" >40%</option>
                                                                <option value="45" >45%</option>
                                                                <option value="50" >50%</option>
                                                                <option value="55" >60%</option>
                                                                <option value="60" >70%</option>
                                                                <option value="65" >80%</option>
                                                            </select>
                                                        </td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>是否存在补贴：</td>
                                                        <td width="20%">
                                                            <select id="subsidyFlag" name="subsidyFlag" style="height:20px;">
                                                                <option value="0" selected="true">不补贴</option>
                                                                <option value="1" >补贴</option>
                                                            </select>
														</td>
                                                        <td style="color: red;">
                                                        <div id="subsidy" style="display:none;">补贴年化利率：<input class="text" style="width:50px;height:20px;" type="text" name="subsidyRate"  />&nbsp;补贴天数：<input class="text" style="width:50px;height:20px;" type="text" name="subsidyDay" value="${product.subsidyDay}" /></div>
                                                        </td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>红包类型：</td>
                                                        <td width="25%">
                                                            <select name="redType">
                                                            	<option value="99" selected="true">未选择</option>
                                                                <option value="01" >按用户发放</option>
                                                                <option value="02" >按产品发放</option>
                                                                <option value="03" >按投资金额发放</option>
                                                                <option value="04" >按活动类型发放</option>
                                                            </select>
														</td>
                                                        <td style="color: red;">
                                                        	
                                                        </td>
                                                        <td width="2%">&nbsp;</td>
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