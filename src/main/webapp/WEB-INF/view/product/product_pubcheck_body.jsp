<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
</head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <!-- 中间部分开始 -->
            <tr>
                <!--第一行左边框-->
                <td valign="middle" background="${ctx}/images/base/mail_left_bg.gif">&nbsp;</td>
                <!--第一行中间内容-->
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="1%">&nbsp;</td>
                            <td width="98%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="" method="">
                                                <table width="100%"  class="cont tr_color">
                                                    <tr>
                                                        <th>序号</th>
                                                        <th>产品ID</th>
                                                        <th>产品名称</th>
                                                        <th>产品分类</th>
                                                        <th>还款方式</th>
                                                        <th>募集规模(份)</th>
                                                        <th>产品单价(元)</th>
                                                        <th>年化利率</th>
                                                        <th>产品状态</th>
                                                        <th>募集开始日期</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    <c:forEach var="StandardProductBean" items="${pruductList}" varStatus="status">
                                                        <tr align="center" class="d">
	                                                        <td><c:out value="${status.index + 1}"/></td>
	                                                        <td><c:out value="${StandardProductBean.productId}"/></td>
	                                                        <td><c:out value="${StandardProductBean.productName}"/></td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${StandardProductBean.productType eq '005'}"><c:out value="标准系列"/></c:when>
	                                                        		<c:when test="${StandardProductBean.productType eq '004'}"><c:out value="众筹系列"/></c:when>
	                                                        		<c:when test="${StandardProductBean.productType eq '003'}"><c:out value="信托系列"/></c:when>
	                                                        		<c:when test="${StandardProductBean.productType eq '002'}"><c:out value="众筹系列"/></c:when>
	                                                        		<c:when test="${StandardProductBean.productType eq '001'}"><c:out value="电能系列"/></c:when>
	                                                        		<c:when test="${StandardProductBean.productType eq '000'}"><c:out value="光伏系列"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${StandardProductBean.rentMode eq '0'}"><c:out value="等额本息（月）"/></c:when>
	                                                        		<c:when test="${StandardProductBean.rentMode eq '1'}"><c:out value="一次还本付息（天）"/></c:when>
	                                                        		<c:when test="${StandardProductBean.rentMode eq '2'}"><c:out value="等额本金（月）"/></c:when>
	                                                        		<c:when test="${StandardProductBean.rentMode eq '3'}"><c:out value="每月付息到期还本（月）"/></c:when>
	                                                        		<c:when test="${StandardProductBean.rentMode eq '4'}"><c:out value="每月付息到期还本（天）"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td><c:out value="${StandardProductBean.scale}"/></td>
	                                                        <td><c:out value="${StandardProductBean.unitcost/100}"/></td>
	                                                        <td><c:out value="${StandardProductBean.rate}%"/></td>
	                                                        <td>
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
	                                                        <td><c:out value="${StandardProductBean.startdt}"/></td>
	                                                        <td><a href="${ctx}/pubcheck/productDetail?productId=${StandardProductBean.productId}" target="main"><span style="color:red;">进入审核</span></a></td>
                                                    	</tr>                                                    
                                                    </c:forEach>
                                                </table>
                                                <c:if test="${!empty pruductList}">
	                                                <table width="100%"  class="pager">
	                                                	<tr >
	                                                		<pg:pager url="${ctx}/pubcheck/productQuery/pageList" items="${productCount}" maxIndexPages="5" maxPageItems="${pageSize}"
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
                                                </c:if>
                                                <c:if test="${empty pruductList}">
	                                               	<table width="100%" class="noData">
														<tr>
															<th>暂无数据</th>
														</tr>
													</table>
                                           		</c:if>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="1%">&nbsp;</td>
                        </tr>
                        <!-- 产品列表结束 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="1%">&nbsp;</td>
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