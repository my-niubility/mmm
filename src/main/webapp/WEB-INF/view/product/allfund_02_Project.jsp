<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/uploadify.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/error.css" />
    <script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery-1.12.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery.uploadify.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
    
<script type="text/javascript">
    $(function () {  
        $("#projectMap").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proMapQueue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/publish/upload',  
            'width': '75',  
            'height': '24',  
            //是否支持多文件上传，这里为true，你在选择文件的时候，就可以选择多个文件  
            'multi': false,  
            'fileTypeDesc': '支持的格式：',  
            'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',  
            'fileSizeLimit': '2MB',  
            //上传完成后多久删除进度条 
            'removeCompleted':false,

            //返回一个错误，选择文件的时候触发    
            'onSelectError': function (file, errorCode, errorMsg) {  
                switch (errorCode) {  
                    case -100:  
                        alert("上传的文件数量已经超出系统限制的" + $('#projectMap').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#projectMap').uploadify('settings', 'fileSizeLimit') + "大小！");  
                        break;  
                    case -120:  
                        alert("文件 [" + file.name + "] 大小异常！");  
                        break;  
                    case -130:  
                        alert("文件 [" + file.name + "] 类型不正确！");  
                        break;  
                }  
            },  
            //检测FLASH失败调用    
            'onFallback': function () {  
                alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");  
            },  
            //上传到服务器，服务器返回相应信息到data里    
            'onUploadSuccess': function (file, data, response) {  
                //alert(file.name);  
               // $("#mypic").attr("src", data);  
            },  
            //多文件上传，服务器返回相应的信息  
            'onQueueComplete': function (queueData) {  
                //alert(queueData.uploadsSuccessful);  
            }  
        });  
    });  

    //开始上传  
    function proMapUpload() {  
        $('#projectMap').uploadify('upload', '*');  
    }  
    //停止上传  
    function proMapCloseLoad() {  
        $('#projectMap').uploadify('cancel', '*');  
    }  

    $(function () {  
        $("#projectEvn1").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv1Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/publish/upload',  
            'width': '75',  
            'height': '24',  
            //是否支持多文件上传，这里为true，你在选择文件的时候，就可以选择多个文件  
            'multi': false,  
            'fileTypeDesc': '支持的格式：',  
            'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',  
            'fileSizeLimit': '2MB',  
            //上传完成后多久删除进度条 
            'removeCompleted':false,

            //返回一个错误，选择文件的时候触发    
            'onSelectError': function (file, errorCode, errorMsg) {  
                switch (errorCode) {  
                    case -100:  
                        alert("上传的文件数量已经超出系统限制的" + $('#projectEvn1').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#projectEvn1').uploadify('settings', 'fileSizeLimit') + "大小！");  
                        break;  
                    case -120:  
                        alert("文件 [" + file.name + "] 大小异常！");  
                        break;  
                    case -130:  
                        alert("文件 [" + file.name + "] 类型不正确！");  
                        break;  
                }  
            },  
            //检测FLASH失败调用    
            'onFallback': function () {  
                alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");  
            },  
            //上传到服务器，服务器返回相应信息到data里    
            'onUploadSuccess': function (file, data, response) {  
                //alert(file.name);  
               // $("#mypic").attr("src", data);  
            },  
            //多文件上传，服务器返回相应的信息  
            'onQueueComplete': function (queueData) {  
                //alert(queueData.uploadsSuccessful);  
            }  
        });  
    });  

    //开始上传  
    function proEvn1Upload() {  
        $('#projectEvn1').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn1CloseLoad() {  
        $('#projectEvn1').uploadify('cancel', '*');  
    }  

    $(function () {  
        $("#projectEvn2").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv2Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/publish/upload',  
            'width': '75',  
            'height': '24',  
            //是否支持多文件上传，这里为true，你在选择文件的时候，就可以选择多个文件  
            'multi': false,  
            'fileTypeDesc': '支持的格式：',  
            'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',  
            'fileSizeLimit': '2MB',  
            //上传完成后多久删除进度条 
            'removeCompleted':false,

            //返回一个错误，选择文件的时候触发    
            'onSelectError': function (file, errorCode, errorMsg) {  
                switch (errorCode) {  
                    case -100:  
                        alert("上传的文件数量已经超出系统限制的" + $('#projectEvn2').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#projectEvn2').uploadify('settings', 'fileSizeLimit') + "大小！");  
                        break;  
                    case -120:  
                        alert("文件 [" + file.name + "] 大小异常！");  
                        break;  
                    case -130:  
                        alert("文件 [" + file.name + "] 类型不正确！");  
                        break;  
                }  
            },  
            //检测FLASH失败调用    
            'onFallback': function () {  
                alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");  
            },  
            //上传到服务器，服务器返回相应信息到data里    
            'onUploadSuccess': function (file, data, response) {  
                //alert(file.name);  
               // $("#mypic").attr("src", data);  
            },  
            //多文件上传，服务器返回相应的信息  
            'onQueueComplete': function (queueData) {  
                //alert(queueData.uploadsSuccessful);  
            }  
        });  
    });  

    //开始上传  
    function proEvn2Upload() {  
        $('#projectEvn2').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEnv2CloseLoad() {  
        $('#projectEvn2').uploadify('cancel', '*');  
    }     

    $(function () {  
        $("#projectEvn3").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv3Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/publish/upload',  
            'width': '75',  
            'height': '24',  
            //是否支持多文件上传，这里为true，你在选择文件的时候，就可以选择多个文件  
            'multi': false,  
            'fileTypeDesc': '支持的格式：',  
            'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',  
            'fileSizeLimit': '2MB',  
            //上传完成后多久删除进度条 
            'removeCompleted':false,

            //返回一个错误，选择文件的时候触发    
            'onSelectError': function (file, errorCode, errorMsg) {  
                switch (errorCode) {  
                    case -100:  
                        alert("上传的文件数量已经超出系统限制的" + $('#projectEvn3').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#projectEvn3').uploadify('settings', 'fileSizeLimit') + "大小！");  
                        break;  
                    case -120:  
                        alert("文件 [" + file.name + "] 大小异常！");  
                        break;  
                    case -130:  
                        alert("文件 [" + file.name + "] 类型不正确！");  
                        break;  
                }  
            },  
            //检测FLASH失败调用    
            'onFallback': function () {  
                alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");  
            },  
            //上传到服务器，服务器返回相应信息到data里    
            'onUploadSuccess': function (file, data, response) {  
                //alert(file.name);  
               // $("#mypic").attr("src", data);  
            },  
            //多文件上传，服务器返回相应的信息  
            'onQueueComplete': function (queueData) {  
                //alert(queueData.uploadsSuccessful);  
            }  
        });  
    });  

    //开始上传  
    function proEvn3Upload() {  
        $('#projectEvn3').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn3CloseLoad() {  
        $('#projectEvn3').uploadify('cancel', '*');  
    }  

    $(function () {  
        $("#projectEvn4").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv4Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/publish/upload',  
            'width': '75',  
            'height': '24',  
            //是否支持多文件上传，这里为true，你在选择文件的时候，就可以选择多个文件  
            'multi': false,  
            'fileTypeDesc': '支持的格式：',  
            'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',  
            'fileSizeLimit': '2MB',  
            //上传完成后多久删除进度条 
            'removeCompleted':false,

            //返回一个错误，选择文件的时候触发    
            'onSelectError': function (file, errorCode, errorMsg) {  
                switch (errorCode) {  
                    case -100:  
                        alert("上传的文件数量已经超出系统限制的" + $('#projectEvn4').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#projectEvn4').uploadify('settings', 'fileSizeLimit') + "大小！");  
                        break;  
                    case -120:  
                        alert("文件 [" + file.name + "] 大小异常！");  
                        break;  
                    case -130:  
                        alert("文件 [" + file.name + "] 类型不正确！");  
                        break;  
                }  
            },  
            //检测FLASH失败调用    
            'onFallback': function () {  
                alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");  
            },  
            //上传到服务器，服务器返回相应信息到data里    
            'onUploadSuccess': function (file, data, response) {  
                //alert(file.name);  
               // $("#mypic").attr("src", data);  
            },  
            //多文件上传，服务器返回相应的信息  
            'onQueueComplete': function (queueData) {  
                //alert(queueData.uploadsSuccessful);  
            }  
        });  
    });  

    //开始上传  
    function proEvn4Upload() {  
        $('#projectEvn4').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn4CloseLoad() {  
        $('#projectEvn4').uploadify('cancel', '*');  
    }  

</script>
<script type="text/javascript">
		$(function(){
		    $("#projectForm").validate({
		    	rules:{   
		    		projectName:{
		    			required:true,
		    			},
		    		projectIntro:{
		    			required:true,
		    			},
		    		projectBenefit:{
		    			required:true,
		    		},
		    		projectStaMess:{
		    			required:true,
		    		},
		    		rentRights:{
		    			required:true,
		    		},
		    		rentTraceMess:{
		    			required:true,
		    		},
		    		rentOperateMess:{
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
					  projectName:{required:"项目名称不能为空"},
					  projectIntro:{required:"项目概况不能为空"},
					  projectBenefit:{required:"收益描述不能为空"},
					  projectStaMess:{required:"当前状态描述不能为空"},
					  rentRights:{required:"所有权描述不能为空"},
					  rentTraceMess:{required:"跟踪情况描述不能为空"},
					  rentOperateMess:{required:"运维情况描述不能为空"},
					 },
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
                        <tr><td height="31"><div class="title">项目要素</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">发布光伏系列产品之02---项目要素</h3></td>
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
                                            <form id="projectForm" action="${ctx}/publish/finance/front" method="post" enctype="multipart/form-data">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="15%">项目名称：</td>
                                                        <td width="25%"><input class="text" type="text" name="projectName" value="" /></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目概况：</td>
                                                        <td width="20%"><textarea name="projectIntro"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目收益描述：</td>
                                                        <td width="20%"><textarea name="projectBenefit"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目当前状态描述：</td>
                                                        <td width="20%"><textarea name="projectStaMess"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>租赁物所有权描述：</td>
                                                        <td width="20%"><textarea name="rentRights"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>跟踪情况描述：</td>
                                                        <td width="20%"><textarea name="rentTraceMess"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>运维情况描述：</td>
                                                        <td width="20%"><textarea name="rentOperateMess"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目所有在地地图：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="projectMap" id="projectMap"/></td>
                                                        <td>  
                                                      		<input type="button" value="上传" onclick="proMapUpload()" />                                                     
                                                        </td>
                                                        <td width="2%">
                                                        	<div id="proMapQueue" style="padding: 3px;">    
                											</div>               											
                										</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目真实环境1：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="projectEvn1" id="projectEvn1"/></td>
                                                        <td>  
                                                      		<input type="button" value="上传" onclick="proEvn1Upload()" />                                                     
                                                        </td>
                                                        <td width="2%">
                                                        	<div id="proEnv1Queue" style="padding: 3px;">    
                											</div>               											
                										</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目真实环境2：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="projectEvn2" id="projectEvn2"/></td>
                                                        <td>  
                                                      		<input type="button" value="上传" onclick="proEvn2Upload()" />                                                     
                                                        </td>
                                                        <td width="2%">
                                                        	<div id="proEnv2Queue" style="padding: 3px;">    
                											</div>               											
                										</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目真实环境3：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="projectEvn3" id="projectEvn3"/></td>
                                                        <td>  
                                                      		<input type="button" value="上传" onclick="proEvn3Upload()" />                                                     
                                                        </td>
                                                        <td width="2%">
                                                        	<div id="proEnv3Queue" style="padding: 3px;">    
                											</div>               											
                										</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目真实环境4：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="projectEvn4" id="projectEvn4"/></td>
                                                        <td>  
                                                      		<input type="button" value="上传" onclick="proEvn4Upload()" />                                                     
                                                        </td>
                                                        <td width="2%">
                                                        	<div id="proEnv4Queue" style="padding: 3px;">    
                											</div>               											
                										</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目其他描述1：</td>
                                                        <td width="20%"><textarea name="projectRemark1"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目其他描述2：</td>
                                                        <td width="20%"><textarea name="projectRemark1"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目其他描述3：</td>
                                                        <td width="20%"><textarea name="projectRemark3"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>项目其他描述4：</td>
                                                        <td width="20%"><textarea name="projectRemark4"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><a href="${ctx}/publish/product" class="btn" >上一页</a><input class="btn" type="submit" value="下一页" /></td>
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