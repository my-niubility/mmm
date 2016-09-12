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
    <script src="${ctx}/js/echarts.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#regAllQuery").click(function(){
				var myChart = echarts.init(document.getElementById('main'));
				var option = {
					    title: {
					    	show: true, //是否显示标题组件 （boolean 类型   默认是true）
					        text: '重复投资对比图',
					        textStyle:{
					        	color:'#333333',
					        	fontStyle:'normal',//normal（默认）   italic oblique
					        	fontWeight:'bolder',//normal bold bolder(默认) lighter
					        	fontFamily:'sans-serif',
					        	fontSize:'16'
					        },
					        left:'60'
					        //textAlign:'right'//标题文本水平对齐，支持 'left', 'center', 'right'，默认根据标题位置决定
							//textBaseline:'top' //标题文本垂直对齐，支持 'top', 'middle', 'bottom'，默认根据标题位置决定。
					    },
					    tooltip: {
					    	trigger: 'item',//没有坐标轴为 item  反之用  axis
					        formatter: "{a} <br/>{b}: {c} ({d}%)"
					    },
					    color:[
					    	'#60a1a9','#e60012'       
					    ],
					    legend: {
					    	 orient: 'vertical',//horizontal vertical
					    	 right: '40',
					         data:[
					               {name:'重复投资',textStyle: {color: '#2e4454'}},
					               {name:'未重复投资',textStyle: {color: '#2e4454'}}
					              ]
					    },
					    series: [{
				            name:'重复投资来源',
				            type:'pie',
				            radius: ['50%', '70%'],//环型参数   内半径  外半径
				            avoidLabelOverlap: false,
				            label: {
				                normal: {
				                    show: false,
				                    position: 'center'//outside属性 data字体显示在环形外侧    center 环形中心  inner 环形内侧
				                   
				                },
				                emphasis: {
				                    show: true,
				                    textStyle: {
				                        fontSize: '30',
				                        fontWeight: 'bold'
				                    }
				                }
				            },
				            labelLine: {
				                normal: {
				                    show: false,
				                }
				            },
				            data:[
								{name:'重复投资',value:1548},
				                {name:'未重复投资',value:200}
				            ]
				        }]
					};
				myChart.setOption(option);
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
                        <tr><td height="31"><div class="title">重复投资</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:3px;">用户进行重复投资转化比例</h3></td>
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
                                		<td width="10%"></td>
                                		<td width="80%" height="40px" align="center">
                                			<input id="regAllQuery" style="cursor:pointer ;cursor:hand;" type="button" name="regAllQuery" value="全部" >&nbsp;&nbsp;&nbsp;&nbsp;
                                			<input id="regTopMonthQuery" style="cursor:pointer ;cursor:hand;" type="button" name="regTopMonthQuery" value="上月" >&nbsp;&nbsp;&nbsp;&nbsp;
                                			<input id="regThisMonthQuery" style="cursor:pointer ;cursor:hand;" type="button" name="regThisMonthQuery" value="本月" >&nbsp;&nbsp;&nbsp;&nbsp;
                                			<input id="regThisWeekQuery" style="cursor:pointer ;cursor:hand;" type="button" name="regThisWeekQuery" value="本周" >
                                		</td>
                                		<td width="10%"></td>
                                	</tr>	
                                	<tr>
                                		<td width="10%"></td>
                                		<td width="80%" height="40px" align="center"><span style="color: green">==========================================================================</span></td>
                                		<td width="10%"></td>
                                	</tr>	
                                
                                    <tr>
                                   		<td width="10%"></td>
										<td width="80%" align="center">
											<div id="main" style="width: 600px;height:400px;"></div>
                                        </td>
                                        <td width="10%"></td>
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