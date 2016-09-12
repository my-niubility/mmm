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
                                                        <th>选中</th>
                                                        <th>序号</th>
                                                        <th>科目编号</th>
                                                        <th>科目名称</th>
                                                        <th>科目类型</th>
                                                        <th>借贷方向</th>
                                                        <th>科目余额</th>
                                                        <th>项目属性</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    <tr align="center" class="d">
                                                        <td><input type="checkbox" value="" /></td>
                                                        <td>1</td>
                                                        <td>1001</td>
                                                        <td>资产份额</td>
                                                        <td>资产</td>
                                                        <td>借</td>
                                                        <td>4500</td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr align="center" class="d">
                                                        <td><input type="checkbox" value="" /></td>
                                                        <td></td>
                                                        <td>1001100</td>
                                                        <td>资管人份额</td>
                                                        <td>资产</td>
                                                        <td>借</td>
                                                        <td>1500</td>
                                                        <td>光伏系列</td>
                                                        <td><a href="${ctx}/portion/subjectDetail" target="main">查看份额资产</a></td>
                                                    </tr>
                                                    <tr align="center" class="d">
                                                        <td><input type="checkbox" value="" /></td>
                                                        <td></td>
                                                        <td>1001200</td>
                                                        <td>投资人份额</td>
                                                        <td>资产</td>
                                                        <td>借</td>
                                                        <td>1000</td>
                                                        <td>能源系列</td>
                                                        <td><a href="${ctx}/portion/subjectDetail" target="main">查看份额资产</a></td>
                                                    </tr>
                                                    <tr align="center" class="d">
                                                        <td><input type="checkbox" value="" /></td>
                                                        <td></td>
                                                        <td>1001100</td>
                                                        <td>资管人份额</td>
                                                        <td>资产</td>
                                                        <td>借</td>
                                                        <td>2000</td>
                                                        <td>众筹系列</td>
                                                        <td><a href="${ctx}/portion/subjectDetail" target="main">查看份额资产</a></td>
                                                    </tr>
                                                    
                                                    <tr align="center" class="d">
                                                        <td><input type="checkbox" value="" /></td>
                                                        <td>2</td>
                                                        <td>2001</td>
                                                        <td>其他应付份额</td>
                                                        <td>负债</td>
                                                        <td>贷</td>
                                                        <td>0</td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr align="center" class="d">
                                                        <td><input type="checkbox" value="" /></td>
                                                        <td></td>
                                                        <td>2001100</td>
                                                        <td>其他应付款份额</td>
                                                        <td>负债</td>
                                                        <td>贷</td>
                                                        <td>0</td>
                                                        <td>能源系列</td>
                                                        <td><a href="${ctx}/portion/subjectDetail" target="main">查看份额负债</a></td>
                                                    </tr>
                                                    <tr align="center" class="d">
                                                        <td><input type="checkbox" value="" /></td>
                                                        <td></td>
                                                        <td>2001100</td>
                                                        <td>其他应付款份额</td>
                                                        <td>负债</td>
                                                        <td>贷</td>
                                                        <td>0</td>
                                                        <td>众筹系列</td>
                                                        <td><a href="${ctx}/portion/subjectDetail" target="main">查看份额负债</a></td>
                                                    </tr>
                                                     <tr align="center" class="d">
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><a href="javascript:void(0)" target="subject_query_body">上一页</a></td>
                                                        <td><a href="javascript:void(0)" target="subject_query_body">下一页</a></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>

                                                </table>
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
                                <img src="${ctx}/images/base/icon_mail.gif" width="16" height="11"> 客户服务邮箱：tangxc@zlebank.com<br />
                                <img src="${ctx}/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="http://www.zelbank.com/" target="_blank">证联资本</a>
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