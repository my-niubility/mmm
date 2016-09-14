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
		  $(":radio").click(function(){
			  $("#financeName").val($(this).val());
			  var financeName = $("#financeName").val();
			  if(financeName){
				  $("#submitPre").show();
			  }
		  });
		 });
	</script>
	<script type="text/javascript">
	    function checkSubmit(){
	            return true;
	    }
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">发布基金产品步骤2-->融资人要素</h3></td>
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
                                            <form id="form1" name="form1" action="${ctx}/publish/project/fund_03" method="post" onsubmit="return checkSubmit()">
                                                <table width="100%" class="cont" border="0">
                                                
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>您选择的融资企业：</td>
                                                        <td>
                                                        <input id="financeName" type="text" name="financeName" value="" size="50" readonly="readonly" maxlength="50" style="border:0px;color:red;"/>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td></td>
                                                        <td>
                                                        <input id="submitPre" class="text" type="submit" style="display:none;" name="submitPre" value="发布预览" maxlength="50"/>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td></td>
                                                        <td>
                                                        <span style="color: red;">&nbsp;请选择下面融资企业</span>
                                                        </td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
													<tr>	
														<td width="2%">&nbsp;</td>
														<td><span style="color: red;">关联到的企业</span></td>
														<td>															
															<table width="100%" border="0">
			                                                    <tr>
			                                                    	<th>选择</th>
			                                                        <th>序号</th>
			                                                        <th>融资人ID</th>
			                                                        <th>融资人名称</th>
			                                                        <th>企业状态</th>
			                                                        <th>认证状态</th>
			                                                        <th>审核状态</th>
			                                                        <th>创建时间</th>
			                                                    </tr>
			                                                    <c:forEach var="CustEnterpriseBean" items="${cbList}" varStatus="status">
			                                                     	<tr>
			                                                     		<td width="5%" align="center"><input type="radio" name="finChoice" value="${CustEnterpriseBean.name}:${CustEnterpriseBean.id}" /></td>
			                                                       		<td width="5%" align="center"><c:out value="${status.index + 1}"/></td>
			                                                       		<td width="10%" align="center"><c:out value="${CustEnterpriseBean.id}"/></td>
				                                                        <td width="20%" align="center"><c:out value="${CustEnterpriseBean.name}"/></td>
				                                                        <td width="15%" align="center">
				                                                        	<c:choose>
				                                                        		<c:when test="${CustEnterpriseBean.status eq 'EFFECTIVE'}"><c:out value="有效"/></c:when>
				                                                        		<c:when test="${CustEnterpriseBean.status eq 'FROZEN'}"><c:out value="无效"/></c:when>
				                                                        	</c:choose>
				                                                        </td>
				                                                        <td width="15%" align="center">
				                                                        	<c:choose>
				                                                        		<c:when test="${CustEnterpriseBean.certStatus eq 'NEW'}"><c:out value="未认证"/></c:when>
				                                                        		<c:when test="${CustEnterpriseBean.certStatus eq 'PASSED'}"><c:out value="已认证"/></c:when>
				                                                        		<c:when test="${CustEnterpriseBean.certStatus eq 'NOT_PASSED'}"><c:out value="认证失败"/></c:when>
				                                                        	</c:choose>
				                                                        </td>
				                                                        <td width="15%" align="center">
				                                                        	<c:choose>
				                                                        		<c:when test="${CustEnterpriseBean.prStatus eq 'NEW'}"><c:out value="待审核"/></c:when>
				                                                        		<c:when test="${CustEnterpriseBean.prStatus eq 'PASSED'}"><c:out value="审核通过"/></c:when>
				                                                        		<c:when test="${CustEnterpriseBean.certStatus eq 'NOT_PASSED'}"><c:out value="审核拒绝"/></c:when>
				                                                        	</c:choose>
				                                                        </td>
				                                                        <td width="15%" align="center">
				                                                       		 <fmt:formatDate value="${CustEnterpriseBean.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				                                                        </td>
			                                                     	</tr>
			
			                                                    </c:forEach>
															</table>
														</td>
														<td></td>
                                                    </tr>
                                                </table>
                                                
                                                <table width="100%"  class="pager" border="0">
                                                	<tr >
                                                		<pg:pager url="${ctx}/publish/project/fund_02/pageList" items="${accountCount}" maxIndexPages="5" maxPageItems="${accountSize}"
                                                		export="currentPageNumber=pageNumber"> 
                                                			<pg:param name="parentId"/>  
												            <!-- 首页 -->  
												            <pg:first>  
												                <!-- 生成链接 -->  
												                <td><a href="${pageUrl}">首页</a></td>  
												      
												            </pg:first>  
												            <pg:prev>  
												                <td><a href="${pageUrl}">前一页</a></td>   
												            </pg:prev>  
												            <pg:pages>  
												                <c:choose>  
												                    <c:when test="${currentPageNumber eq pageNumber }">  
												                        <td><font color="red">${pageNumber }</font></td>   
												                    </c:when>  
												                    <c:otherwise>  
												                        <td><a href="${pageUrl}">${pageNumber }</a></td>   
												                    </c:otherwise>  
												                </c:choose>  
												      
												            </pg:pages>  
												            <pg:next>  
												                <td><a href="${pageUrl}">后一页</a></td>   
												            </pg:next>  
												            <pg:last>  
												                <td><a href="${pageUrl}">尾页</a></td>   
												            </pg:last>  
														</pg:pager>
														<td width="70%"></td>
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