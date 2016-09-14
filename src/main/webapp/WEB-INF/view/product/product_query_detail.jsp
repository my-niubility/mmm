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
            <!-- 头部开始 -->
            <tr>
                <td width="17" valign="top" background="${ctx}/images/base/mail_left_bg.gif">
                    <img src="${ctx}/images/base/left_top_right.gif" width="17" height="29" />
                </td>
                <td valign="top" background="${ctx}/images/base/content_bg.gif">
                    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="${ctx}/images/base/content_bg.gif">
                        <tr><td height="31"><div class="title">产品详情</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">产品详细信息展示页面</h3></td>
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
                                        	<form name="productDetailForm" id="productDetailForm" action="${ctx}/product/toQueryMain" method="post" target="main" >
                                                <table width="100%"class="cont">
                                                
                                                   <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">资管人编号：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="assetId" value="${product.assetId}" />
                                                        </td>
														<td width="10%">资管人名称：</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="assetName" value="${product.assetName}" />
														</td>
														<td width="10%">产品编号:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="productId" value="${product.productId}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">产品名称：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="productName" value="${product.productName}" />
                                                        </td>
														<td width="10%">募集开始时间：</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="startTime" value="<fmt:formatDate value="${product.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
														</td>
														<td width="10%">募集结束时间:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="endTime" value="<fmt:formatDate value="${product.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">融资规模(份)：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="scale" value="${product.financePortion}" />
                                                        </td>
														<td width="10%">产品价格(元):</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="unitcost" value="${(product.unitcost)/100}" />
														</td>
														<td width="10%">收益率:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="rate" value="${product.rate}%"  />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
														<td width="10%">投资上限(份):</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="scaleLimit" value='${product.scaleLimit}'/>
														</td>
														<td width="10%">投资下限(份):</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="scaleLimit" value='${product.investMin}'/>
														</td>
														<td width="10%">利息返回方式:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="rentMode" value="<c:choose><c:when test="${product.rentMode eq '0'}">等额本息（月）</c:when><c:when test="${product.rentMode eq '2'}">等额本金（月）</c:when><c:when test="${product.rentMode eq '1'}">一次还本付息（天）</c:when><c:when test="${product.rentMode eq '3'}">每月付息到期还本（月）</c:when><c:when test="${product.rentMode eq '4'}">每月付息到期还本（天）</c:when></c:choose>"/>
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">融资期限(月/天)：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="holdday" value="${product.holdday}" />
                                                        </td>
														<td width="10%">赎回锁定期 (月/天):</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="blockday" value="${product.blockday}" />
														</td>
														<td width="10%">是否允许转让:</td>
														<td width="20%"s>
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="transferFlag" value="<c:choose><c:when test="${product.transferFlag eq '0'}">允许转让</c:when><c:when test="${product.transferFlag eq '1'}">不允许转让</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">日间融资额（份）：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="dayFinanceAmt" value="${product.dayFinanceAmt}" />
                                                        </td>
														<td width="10%">确认融资额（份）:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="confFinanceAmt" value="${product.confFinanceAmt}" />
														</td>
														<td width="10%">结算融资额（份）:</td>
														<td width="20%"s>
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="realFinanceAmt" value="${product.realFinanceAmt}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    
                                                    
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">转让锁定期(月/天)：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="tlockday" value="${product.tlockday}"/>
                                                        </td>
														<td width="10%">计租方式:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="rentType" value="<c:choose><c:when test="${product.rentType eq '0'}">次日记租</c:when><c:when test="${product.rentType eq '1'}">成立记租</c:when></c:choose>" />
														</td>
														<td width="10%">每月返租日期:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="backday" value="${product.backday}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">正常回购日：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="nonbackday" value="<c:out value="${empty product.nonbackday ? '无' : product.nonbackday}"/> "/>
                                                        </td>
														<td width="10%">合同到期日:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="contrday" value="${product.contrday}"/>
														</td>
														<td width="10%">项目成立条件:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="establish" value="<c:choose><c:when test="${empty product.establish}">未选择</c:when><c:when test="${product.establish eq '1'}">比例</c:when><c:when test="${product.establish eq '2'}">下线</c:when></c:choose>" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">下限选择：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="xxEstabValue" value="<c:out value="${empty product.xxEstabValue ? '无' : product.xxEstabValue}"/> "/>
                                                        </td>
														<td width="10%">比例选择(%):</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="blEstabValue" value="<c:out value="${empty product.blEstabValue ? '无' : product.blEstabValue}"/> " />
														</td>
														<td width="10%">融资人编号:</td>
														<td width="20%"s>
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="financeId" value="${product.financeId}" />
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>

                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="10%">补贴年化利率：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="subsidyRate" value="<c:out value="${empty product.subsidyRate ? '0.00' : product.subsidyRate}"/>%"/>
                                                        </td>
														<td width="10%">补贴天数:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text"  name="subsidyDay" value="<c:out value="${empty product.subsidyDay ? '0' : product.subsidyDay}"/>天" />
														</td>
														<td width="10%">融资人名称：</td>
                                                        <td width="20%">
                                                        	<input style="width:180px;height:20px;" readonly="readonly" type="text" name="financeName" value="${product.financeName}"/>
                                                        </td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
														<td width="10%">创建日期:</td>
														<td width="20%">
															<input style="width:180px;height:20px;" readonly="readonly" type="text" name="createTime" value="<fmt:formatDate value='${product.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
														</td>
														<td width="10%"></td>
														<td width="20%">
														</td>
                                                        <td width="5%">&nbsp;</td>                                                        
                                                    </tr>
													<tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="button" value="返回" onclick="javascript:document.productDetailForm.submit();" /></td>
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
                                <img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：${serviceEmail}<br />
                                <img src="${ctx}/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="${companyUrl}" target="_blank">${companyName}</a>
                            </td>
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