<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/page.css" />
    <script src="${ctx}/js/tableExcelport/tableExport.js" type="text/javascript" ></script>
    <script src="${ctx}/js/tableExcelport/jquery.base64.js" type="text/javascript" ></script>
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
                                            <form action="${ctx }/trade/maxLimitQuery" method="post">
                                                <table width="100%"  class="cont tr_color">
                                                    <tr>
                                                        <th>选中</th>
                                                        <th>序号</th>
                                                        <th>交易订单</th>
                                                        <th>产品ID</th>
                                                        <th>产品名称</th>
                                                        <th>交易总额(元)</th>
                                                        <th>购买份额</th>
                                                        <th>交易类型</th>
                                                        <th>订单状态</th>
                                                        <th>支付订单</th>
                                                        <th>创建时间</th>
                                                    </tr>
                                                    <c:forEach var="TradeOrderBean" items="${tradeOrderList}" varStatus="status">
                                                        <tr align="center" class="d">
                                                        	<td><input type="checkbox" value="" /></td>
	                                                        <td><c:out value="${status.index + 1}"/></td>
	                                                        <td><c:out value="${TradeOrderBean.id}"/></td>	                                                        	
	                                                        <td><c:out value="${TradeOrderBean.productId}"/></td>
	                                                        <td><c:out value="${TradeOrderBean.productNane}"/></td>
	                                                        <td><c:out value="${TradeOrderBean.tradeTalAmt}"/></td>
	                                                        <td><c:out value="${TradeOrderBean.purchasePortion}"/></td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${TradeOrderBean.invenstType eq '0'}"><c:out value="投资"/></c:when>
	                                                        		<c:when test="${TradeOrderBean.invenstType eq '1'}"><c:out value="协议转让"/></c:when>
	                                                        		<c:when test="${TradeOrderBean.invenstType eq '2'}"><c:out value="划款"/></c:when>
	                                                        		<c:when test="${TradeOrderBean.invenstType eq '3'}"><c:out value="融资人还款"/></c:when>
	                                                        		<c:when test="${TradeOrderBean.invenstType eq '4'}"><c:out value="资管人还款"/></c:when>
	                                                        		<c:when test="${TradeOrderBean.invenstType eq '5'}"><c:out value="资管人退款"/></c:when>
	                                                        		<c:when test="${TradeOrderBean.invenstType eq '6'}"><c:out value="补贴发放"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td>
	                                                        	<c:choose>
	                                                        		<c:when test="${TradeOrderBean.orderStatus eq '00'}"><c:out value="等待付款"/></c:when>
	                                                        		<c:when test="${TradeOrderBean.orderStatus eq '01'}"><c:out value="支付成功"/></c:when>
	                                                        		<c:when test="${TradeOrderBean.orderStatus eq '02'}"><c:out value="支付失败"/></c:when>
	                                                        		<c:when test="${TradeOrderBean.orderStatus eq '03'}"><c:out value="订单取消"/></c:when>
	                                                        	</c:choose>
	                                                        </td>
	                                                        <td><c:out value="${TradeOrderBean.payOrderNo}"/></td>
	                                                        <td><fmt:formatDate value="${TradeOrderBean.createTime}"  pattern="yyyy-MM-dd HH:mm:ss"/>  </td>
                                                    	</tr>                                                    
                                                    </c:forEach>
                                                </table>
                                                <c:if test="${!empty tradeOrderList}">
	                                                <table width="100%"  class="pager">
	                                                	<tr >
	                                                		<pg:pager url="${ctx}/trade/tradeOrderPageList" items="${tradeOrderCount}" maxIndexPages="5" maxPageItems="${chargeSize}"
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
                                                <c:if test="${empty tradeOrderList}">
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