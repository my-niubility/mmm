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
	    	if(window.confirm('确认此操作吗？')){
	            return true;
	         }else{
	            return false;
	        }
	    }
    </script>

	<script type="text/javascript">
        $(function() {
           $("#offshelf1All").click(function() {
                $('input[name="offshelf1"]').prop("checked",this.checked); 
            });
           var $subBox = $("input[name='offshelf1']");
           $subBox.click(function(){
               $("#offshelf1All").prop("checked",$subBox.length == $("input[name='offshelf1']:checked").length ? true : false);
           });
        });
        $(function() {
            $("#upshelf1All").click(function() {
                 $('input[name="upshelf1"]').prop("checked",this.checked); 
             });
            var $subBox = $("input[name='upshelf1']");
            $subBox.click(function(){
                $("#upshelf1All").prop("checked",$subBox.length == $("input[name='upshelf1']:checked").length ? true : false);
            });
         });

        $(function() {
            $("#offshelf2All").click(function() {
                 $('input[name="offshelf2"]').prop("checked",this.checked); 
             });
            var $subBox = $("input[name='offshelf2']");
            $subBox.click(function(){
                $("#offshelf2All").prop("checked",$subBox.length == $("input[name='offshelf2']:checked").length ? true : false);
            });
         });
         $(function() {
             $("#upshelf2All").click(function() {
                  $('input[name="upshelf2"]').prop("checked",this.checked); 
              });
             var $subBox = $("input[name='upshelf2']");
             $subBox.click(function(){
                 $("#upshelf2All").prop("checked",$subBox.length == $("input[name='upshelf2']:checked").length ? true : false);
             });
          });

         $(function() {
             $("#offshelf3All").click(function() {
                  $('input[name="offshelf3"]').prop("checked",this.checked); 
              });
             var $subBox = $("input[name='offshelf3']");
             $subBox.click(function(){
                 $("#offshelf3All").prop("checked",$subBox.length == $("input[name='offshelf3']:checked").length ? true : false);
             });
          });
          $(function() {
              $("#upshelf3All").click(function() {
                   $('input[name="upshelf3"]').prop("checked",this.checked); 
               });
              var $subBox = $("input[name='upshelf3']");
              $subBox.click(function(){
                  $("#upshelf3All").prop("checked",$subBox.length == $("input[name='upshelf3']:checked").length ? true : false);
              });
           });

          $(function() {
              $("#offshelf4All").click(function() {
                   $('input[name="offshelf4"]').prop("checked",this.checked); 
               });
              var $subBox = $("input[name='offshelf4']");
              $subBox.click(function(){
                  $("#offshelf4All").prop("checked",$subBox.length == $("input[name='offshelf4']:checked").length ? true : false);
              });
           });
           $(function() {
               $("#upshelf4All").click(function() {
                    $('input[name="upshelf4"]').prop("checked",this.checked); 
                });
               var $subBox = $("input[name='upshelf4']");
               $subBox.click(function(){
                   $("#upshelf4All").prop("checked",$subBox.length == $("input[name='upshelf4']:checked").length ? true : false);
               });
            });

           $(function() {
               $("#offshelf5All").click(function() {
                    $('input[name="offshelf5"]').prop("checked",this.checked); 
                });
               var $subBox = $("input[name='offshelf5']");
               $subBox.click(function(){
                   $("#offshelf5All").prop("checked",$subBox.length == $("input[name='offshelf5']:checked").length ? true : false);
               });
            });
            $(function() {
                $("#upshelf5All").click(function() {
                     $('input[name="upshelf5"]').prop("checked",this.checked); 
                 });
                var $subBox = $("input[name='upshelf5']");
                $subBox.click(function(){
                    $("#upshelf5All").prop("checked",$subBox.length == $("input[name='upshelf5']:checked").length ? true : false);
                });
             });

            $(function() {
                $("#offshelf6All").click(function() {
                     $('input[name="offshelf6"]').prop("checked",this.checked); 
                 });
                var $subBox = $("input[name='offshelf6']");
                $subBox.click(function(){
                    $("#offshelf6All").prop("checked",$subBox.length == $("input[name='offshelf6']:checked").length ? true : false);
                });
             });
             $(function() {
                 $("#upshelf6All").click(function() {
                      $('input[name="upshelf6"]').prop("checked",this.checked); 
                  });
                 var $subBox = $("input[name='upshelf6']");
                 $subBox.click(function(){
                     $("#upshelf6All").prop("checked",$subBox.length == $("input[name='upshelf6']:checked").length ? true : false);
                 });
              });

             $(function() {
                 $("#offshelf7All").click(function() {
                      $('input[name="offshelf7"]').prop("checked",this.checked); 
                  });
                 var $subBox = $("input[name='offshelf7']");
                 $subBox.click(function(){
                     $("#offshelf7All").prop("checked",$subBox.length == $("input[name='offshelf7']:checked").length ? true : false);
                 });
              });
              $(function() {
                  $("#upshelf7All").click(function() {
                       $('input[name="upshelf7"]').prop("checked",this.checked); 
                   });
                  var $subBox = $("input[name='upshelf7']");
                  $subBox.click(function(){
                      $("#upshelf7All").prop("checked",$subBox.length == $("input[name='upshelf7']:checked").length ? true : false);
                  });
               });
				
              
	</script>
 

   	<script type="text/javascript">
		$(document).ready(function(){
		  $("#upShelfQ").click(function(){
			  $("#upShelf").show();
			  var falgShow = $("#falgShowUp").text();
			  if(falgShow=="暂无数据"){
				  $("#submitup").hide();
			  }else{
				  $("#submitup").show();
			  }
			  
			  $("#offShelf").hide();
			  $("#submitoff").hide()
		  });
		});
	</script>    

   	<script type="text/javascript">
		$(document).ready(function(){
		  $("#offShelfQ").click(function(){
			  $("#upShelf").hide();
			  $("#submitup").hide();
			  $("#offShelf").show();
			  var falgShow = $("#falgShowOff").text();
			  if(falgShow=="暂无数据"){
				  $("#submitoff").hide();
			  }else{
			  	  $("#submitoff").show();
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
                        <tr><td height="31"><div class="title">货架管理</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">平台产品上架、下架管理！</h3></td>
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
                                            <form id="form1" name="form1" action="${ctx}/shelfmanager/upoffshelf" method="post" onsubmit="return checkSubmit()">
                                                <table width="100%" class="cont" border="0">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td align="center"><span style="color: red;">请选择操作：</span></td>
                                                        <td align="left">
														&nbsp;&nbsp;&nbsp;<input id="upShelfQ" style="width:120px;height:30px" type="button" value="新产品上架管理" />
                                                        &nbsp;&nbsp;&nbsp;<input id="offShelfQ" style="width:120px;height:30px" type="button" value="已上架产品管理" />
                                                        &nbsp;&nbsp;&nbsp;<input id="hisShelfQ" style="width:120px;height:30px" type="button" value="历史货架" />
                                                        </td align="center">
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td></td>
                                                        <td>
                                                        <span style="color: red;">&nbsp;注意：第一次出售产品使用“新产品上架管理”，修改货架以及下架产品请使用“已上架产品管理”！</span>
                                                        </td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
													<tr>	
														<td width="2%">&nbsp;</td>
														<td align="center"><span style="color: red;">关联项目</span></td>
														<td>
															<div id="upShelf" style="display:none;">														
																<table width="100%" border="0">
				                                                    <tr>
				                                                        <th>序号</th>
				                                                        <th>产品ID</th>
				                                                        <th>产品名称</th>
				                                                        <th>产品状态</th>
				                                                        <th>货架NO1</th>
				                                                        <th>货架NO2</th>
				                                                        <th>货架NO3</th>
				                                                        <th>货架NO4</th>
				                                                        <th>货架NO5</th>
				                                                        <th>货架NO6</th>
				                                                        <th>货架NO7</th>
				                                                    </tr>
																	<c:forEach var="StandardProductBean" items="${upPruductList}" varStatus="status">
				                                                     	<tr>
				                                                       		<td width="5%" align="center"><c:out value="${status.index + 1}"/></td>
				                                                       		<td width="10%" align="center">
				                                                       			<input type="hidden" id="upflag" name="upflag" value="0"/>
				                                                       			<c:out value="${StandardProductBean.productId}"/>
				                                                       		</td>
					                                                        <td width="20%" align="center"><c:out value="${StandardProductBean.productName}"/></td>
					                                                        <td width="10%" align="center">
					                                                        	<c:choose>
					                                                        		<c:when test="${StandardProductBean.productStatus eq '01'}"><c:out value="待审核"/></c:when>
					                                                        		<c:when test="${StandardProductBean.productStatus eq '02'}"><c:out value="待上架"/></c:when>
					                                                        		<c:when test="${StandardProductBean.productStatus eq '03'}"><c:out value="募集中"/></c:when>
					                                                        		<c:when test="${StandardProductBean.productStatus eq '04'}"><c:out value="募集结束"/></c:when>
					                                                        		<c:when test="${StandardProductBean.productStatus eq '05'}"><c:out value="待还款"/></c:when>
					                                                        		<c:when test="${StandardProductBean.productStatus eq '06'}"><c:out value="待退款"/></c:when>
					                                                        		<c:when test="${StandardProductBean.productStatus eq '07'}"><c:out value="发布撤销"/></c:when>
					                                                        		<c:when test="${StandardProductBean.productStatus eq '08'}"><c:out value="审核失败"/></c:when>
					                                                        		<c:when test="${StandardProductBean.productStatus eq '08'}"><c:out value="已结束"/></c:when>
					                                                        	</c:choose>
					                                                        </td>
					                                                        <td align="center">
					                                                        	<input type="checkbox" value="${StandardProductBean.productId}" name="upshelf1"/><span style="color:red;">&nbsp;上架</span>
					                                                        </td>
					                                                        <td align="center">
					                                                        	<input type="checkbox" value="${StandardProductBean.productId}" name="upshelf2"/><span style="color:green;">&nbsp;上架</span>
					                                                        </td>
					                                                        <td align="center">
					                                                       		<input type="checkbox" value="${StandardProductBean.productId}" name="upshelf3"/><span style="color:orange;">&nbsp;上架</span>
					                                                        </td>
					                                                        <td align="center">
					                                                       		<input type="checkbox" value="${StandardProductBean.productId}" name="upshelf4"/><span style="color:red;">&nbsp;上架</span>
					                                                        </td>
					                                                        <td align="center">
					                                                       		<input type="checkbox" value="${StandardProductBean.productId}" name="upshelf5"/><span style="color:green;">&nbsp;上架</span>
					                                                        </td>
					                                                        <td align="center">
					                                                       		<input type="checkbox" value="${StandardProductBean.productId}" name="upshelf6"/><span style="color:orange;">&nbsp;上架</span>
					                                                        </td>
					                                                        <td align="center">
					                                                       		<input type="checkbox" value="${StandardProductBean.productId}" name="upshelf7"/><span style="color:red;">&nbsp;上架</span>
					                                                        </td>
				                                                     	</tr>
				                                                    </c:forEach>
				                                                    <c:if test="${empty upPruductList}">
																		<tr>
																			<td width="5%" align="center"></td>
																			<td width="10%" align="center"></td>
																			<td width="20%" align="center"></td>
																			<td width="10%" align="center"></td>
																			<td id="falgShowUp">暂无数据</td>
																		</tr>
					                                            	</c:if>
					                                            	<c:if test="${!empty upPruductList}">
					                                                    <tr>
																			<td width="5%" align="center"></td>
																			<td width="10%" align="center"></td>
																			<td width="20%" align="center"></td>
																			<td width="10%" align="center"></td>
																			<td align="center"><input id="upshelf1All" type="checkbox" value="upshelf1All" name="upshelf1All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="upshelf2All" type="checkbox" value="upshelf2All" name="upshelf2All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="upshelf3All" type="checkbox" value="upshelf3All" name="upshelf3All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="upshelf4All" type="checkbox" value="upshelf4All" name="upshelf4All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="upshelf5All" type="checkbox" value="upshelf5All" name="upshelf5All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="upshelf6All" type="checkbox" value="upshelf6All" name="upshelf6All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="upshelf7All" type="checkbox" value="upshelf7All" name="upshelf7All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																		</tr>
																	</c:if>
																</table>
															</div>

															<div id="offShelf" style="display:none;">														
																<table width="100%" border="0">
				                                                    <tr>
				                                                        <th>序号</th>
				                                                        <th>产品ID</th>
				                                                        <th>产品名称</th>
				                                                        <th>产品状态</th>
				                                                        <th>货架NO1</th>
				                                                        <th>货架NO2</th>
				                                                        <th>货架NO3</th>
				                                                        <th>货架NO4</th>
				                                                        <th>货架NO5</th>
				                                                        <th>货架NO6</th>
				                                                        <th>货架NO7</th>
				                                                    </tr>
																	<c:forEach var="StandardProductBean" items="${offPruductList}" varStatus="status">
				                                                     	<tr>
				                                                       		<td width="5%" align="center"><c:out value="${status.index + 1}"/></td>
				                                                       		<td width="10%" align="center">
				                                                       			<input type="hidden" id=productId name="productId" value='${StandardProductBean.productId}'/>
				                                                       			<input type="hidden" id="offflag" name="offflag" value="1"/>
				                                                       			<c:out value="${StandardProductBean.productId}"/>
				                                                       		</td>
					                                                        <td width="20%" align="center"><c:out value="${StandardProductBean.productName}"/></td>
					                                                        <td width="10%" align="center">
					                                                        	<c:out value="募集中"/>
					                                                        </td>
					                                                        <td align="center">
					                                                        	<c:choose>
																					<c:when test="${StandardProductBean.shelfBean.shelf1 eq 'Y'}">
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf1" checked="checked"/><span style="color:red;">&nbsp;已上架</span>
					                                                        		</c:when>
					                                                        		<c:otherwise>
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf1" /><span style="color:black;">&nbsp;下架</span>
					                                                        		</c:otherwise>
					                                                        	</c:choose>
					                                                        </td>
					                                                        <td align="center">
					                                                        	<c:choose>
																					<c:when test="${StandardProductBean.shelfBean.shelf2 eq 'Y'}">
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf2" checked="checked"/><span style="color:red;">&nbsp;已上架</span>
					                                                        		</c:when>
					                                                        		<c:otherwise>
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf2"/><span style="color:black;">&nbsp;下架</span>
					                                                        		</c:otherwise>
					                                                        	</c:choose>
					                                                        </td>
					                                                        <td align="center">
						                                                        <c:choose>
																					<c:when test="${StandardProductBean.shelfBean.shelf3 eq 'Y'}">
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf3" checked="checked"/><span style="color:red;">&nbsp;已上架</span>
					                                                        		</c:when>
					                                                        		<c:otherwise>
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf3"/><span style="color:black;">&nbsp;下架</span>
					                                                        		</c:otherwise>
					                                                        	</c:choose>
					                                                        </td>
					                                                        <td align="center">
					                                                       		<c:choose>
																					<c:when test="${StandardProductBean.shelfBean.shelf4 eq 'Y'}">
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf4" checked="checked"/><span style="color:red;">&nbsp;已上架</span>
					                                                        		</c:when>
					                                                        		<c:otherwise>
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf4"/><span style="color:black;">&nbsp;下架</span>
					                                                        		</c:otherwise>
					                                                        	</c:choose>
					                                                        </td>
					                                                        <td align="center">
					                                                        	<c:choose>
																					<c:when test="${StandardProductBean.shelfBean.shelf5 eq 'Y'}">
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf5" checked="checked"/><span style="color:red;">&nbsp;已上架</span>
					                                                        		</c:when>
					                                                        		<c:otherwise>
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf5"/><span style="color:black;">&nbsp;下架</span>
					                                                        		</c:otherwise>
					                                                        	</c:choose>
					                                                        </td>
					                                                        <td align="center">
																				<c:choose>
																					<c:when test="${StandardProductBean.shelfBean.shelf6 eq 'Y'}">
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf6" checked="checked"/><span style="color:red;">&nbsp;已上架</span>
					                                                        		</c:when>
					                                                        		<c:otherwise>
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf6"/><span style="color:black;">&nbsp;下架</span>
					                                                        		</c:otherwise>
					                                                        	</c:choose>
					                                                        </td>
					                                                        <td align="center">
					                                                        	<c:choose>
																					<c:when test="${StandardProductBean.shelfBean.shelf7 eq 'Y'}">
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf7" checked="checked"/><span style="color:red;">&nbsp;已上架</span>
					                                                        		</c:when>
					                                                        		<c:otherwise>
					                                                        			<input type="checkbox" value="${StandardProductBean.productId}" name="offshelf7"/><span style="color:black;">&nbsp;下架</span>
					                                                        		</c:otherwise>
					                                                        	</c:choose>
					                                                        </td>
				                                                     	</tr>
				                                                    </c:forEach>
				                                                    <c:if test="${empty offPruductList}">
																		<tr>
																			<td width="5%" align="center"></td>
																			<td width="10%" align="center"></td>
																			<td width="20%" align="center"></td>
																			<td width="10%" align="center"></td>
																			<td id="falgShowOff">暂无数据</td>
																		</tr>
					                                            	</c:if>
					                                            	<c:if test="${!empty offPruductList}">
					                                                    <tr>
																			<td width="5%" align="center"></td>
																			<td width="10%" align="center"></td>
																			<td width="20%" align="center"></td>
																			<td width="10%" align="center"></td>
																			<td align="center"><input id="offshelf1All" type="checkbox" value="offshelf1All" name="offshelf1All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="offshelf2All" type="checkbox" value="offshelf2All" name="offshelf2All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="offshelf3All" type="checkbox" value="offshelf3All" name="offshelf3All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="offshelf4All" type="checkbox" value="offshelf4All" name="offshelf4All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="offshelf5All" type="checkbox" value="offshelf5All" name="offshelf5All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="offshelf6All" type="checkbox" value="offshelf6All" name="offshelf6All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																			<td align="center"><input id="offshelf7All" type="checkbox" value="offshelf7All" name="offshelf7All"/><span style="color:green;">&nbsp;&nbsp;全选</span></td>
																		</tr>
																	</c:if>
																</table>
															</div>	
														</td>
														<td></td>
                                                    </tr>
													
                                                    <tr>
                                                        <td><input id="creater" type="hidden" value="<shiro:principal/>" name="creater" /></td>
                                                        <td></td>
                                                        <td>
                                                        &nbsp;&nbsp;&nbsp;<div id="submitup" style="display:none;"><input style="width:120px;height:30px" type="submit" value="执行上架操作" /></div>
                                                        &nbsp;&nbsp;&nbsp;<div id="submitoff" style="display:none;"><input style="width:120px;height:30px" type="submit" value="执行下架操作" /></div>
                                                        </td>
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