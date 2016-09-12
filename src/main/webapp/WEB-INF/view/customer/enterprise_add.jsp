<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/base/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/skin.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/error.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/base/uploadify.css" />
    <script src="${ctx}/js/jquery-1.12.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/sha512.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery.uploadify.min.js" type="text/javascript"></script>
    
    
    <script type="text/javascript">
	    function checkSubmit(){
	    	if(window.confirm('你确定要增加企业客户吗？')){
	            return true;
	         }else{
	            return false;
	        }
	    }
    </script>
   	

   	<script type="text/javascript">
	    $(function(){
	    	$("#name").blur(function(e){
	    		$.post("${ctx}/enterprise/checkQuery", { "name": name},
	    				   function(data){
	    					 var msflag = data.meta.success;
	    					 if(msflag == false){
	    						 alert("企业名称已存在，请重新输入！");
	    						 $("#name").focus();
	    					 }
	    				     }, "json");
	    	});
	    });
    </script>
    <script type="text/javascript">
    $(function () {  
        $("#companyImg").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proMapQueue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#companyImg').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#companyImg').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
        $('#companyImg').uploadify('upload', '*');  
    }  
    //停止上传  
    function proMapCloseLoad() {  
        $('#companyImg').uploadify('cancel', '*');  
    }  

    $(function () {  
        $("#organiztionImg").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv1Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#organiztionImg').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#organiztionImg').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
                alert(file.name);  
                $("#mypic").attr("src", data);  
            },  
            //多文件上传，服务器返回相应的信息  
            'onQueueComplete': function (queueData) {  
                //alert(queueData.uploadsSuccessful);  
            }  
        });  
    });  

    //开始上传  
    function proEvn1Upload() {  
        $('#organiztionImg').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn1CloseLoad() {  
        $('#organiztionImg').uploadify('cancel', '*');  
    }  

    $(function () {  
        $("#taxImg").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv2Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#taxImg').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#taxImg').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
        $('#taxImg').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEnv2CloseLoad() {  
        $('#taxImg').uploadify('cancel', '*');  
    }     

    $(function () {  
        $("#bankAccImg").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv3Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#bankAccImg').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#bankAccImg').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
        $('#bankAccImg').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn3CloseLoad() {  
        $('#bankAccImg').uploadify('cancel', '*');  
    }  

    $(function () {  
        $("#legalpersonId").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv4Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#legalpersonId').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#legalpersonId').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
        $('#legalpersonId').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn4CloseLoad() {  
        $('#legalpersonId').uploadify('cancel', '*');  
    }  
    
    $(function () {  
        $("#legalpersonBackId").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv4Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#legalpersonBackId').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#legalpersonBackId').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
    function proEvn5Upload() {  
        $('#legalpersonBackId').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn5CloseLoad() {  
        $('#legalpersonBackId').uploadify('cancel', '*');  
    } 
    
    $(function () {  
        $("#companyPoaId").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv4Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#companyPoaId').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#companyPoaId').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
    function proEvn6Upload() {  
        $('#companyPoaId').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn6CloseLoad() {  
        $('#companyPoaId').uploadify('cancel', '*');  
    }
    
    $(function () {  
        $("#agentId").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv4Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#agentId').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#agentId').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
    function proEvn7Upload() {  
        $('#agentId').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn7CloseLoad() {  
        $('#agentId').uploadify('cancel', '*');  
    }
    
    
    $(function () {  
        $("#agentBackId").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv4Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#agentBackId').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#agentBackId').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
    function proEvn8Upload() {  
        $('#agentBackId').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn8CloseLoad() {  
        $('#agentBackId').uploadify('cancel', '*');  
    }
    
    $(function () {  
        $("#projectEvn9").uploadify({  
            //是否自动上传    
            'auto': false,  
            'buttonText': '请选择照片',  
            //flash    
            'swf': '${ctx}/images/base/uploadify.swf',  
            'queueSizeLimit': 1,  
            //文件选择后的容器ID    
            'queueID': 'proEnv4Queue',  
            //后台运行上传的程序  
            'uploader': '${ctx}/enterprise/upload',  
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
                        alert("上传的文件数量已经超出系统限制的" + $('#projectEvn9').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                        break;  
                    case -110:  
                        alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#projectEvn9').uploadify('settings', 'fileSizeLimit') + "大小！");  
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
    function proEvn9Upload() {  
        $('#projectEvn9').uploadify('upload', '*');  
    }  
    //停止上传  
    function proEvn9CloseLoad() {  
        $('#projectEvn9').uploadify('cancel', '*');  
    }

</script>
    
    
    <script type="text/javascript">
	    $(function(){
	        $("#form1").validate({
	        	rules:{   
	        		name:{
	        			required:true,
	        			StringCheck:true,
	        			},
	        		phone:{
	        			required:false,
		        		StringCheck:true,
	        			},	        			
	        		legalpersonMobile:{
	        			required:false,
	        			numberCheck:true
	        			}
				},
				messages:{
					name:{required:"企业名称不能为空"}
				},

	        });
	    });
	    
   		jQuery.validator.addMethod("StringCheck", function(value, element) {       
   			return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);}, "只能包括中文字、英文字母、数字和下划线"); 
   		
   		jQuery.validator.addMethod("numberCheck", function(value, element) {
			return this.optional(element) || /^[1]+[3,5,8]+\d{9}/.test(value);},"请输入正确的手机号");
   		
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
                        <tr><td height="31"><div class="title" width="150px">新建企业客户</div></td></tr>
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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">创建证联资本管理平台企业客户！</h3></td>
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
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form id="form1" name="form1" action="${ctx}/enterprise/addResult" method="post" onsubmit="return checkSubmit()">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">企业名称：</td>
                                                        <td width="20%"><input id="name" type="text" name="name" maxlength="32"/></td>
                                                        <td style="color: red;">&nbsp;(*必填) &nbsp;填写企业名称</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">联系电话 ：</td>
                                                        <td width="20%"><input type="text" name="phone"/></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">传真：</td>
                                                        <td width="20%"><input type="text" name="fax" /></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">常用地址：</td>
                                                        <td width="20%">
                                                        	<textarea name="address" maxlength="160"></textarea>
                                                        </td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">企业简介：</td>
                                                        <td width="20%"><textarea name="summary"></textarea></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">企业营业执照：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="companyImg" id="companyImg"/>
                                                        </td>
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
                                                        <td width="20%">机构代码照：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="organiztionImg" id="organiztionImg"/></td>
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
                                                        <td width="20%">税务登记照：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="taxImg" id="taxImg"/></td>
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
                                                        <td width="20%">银行开户许可照：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="bankAccImg" id="bankAccImg"/></td>
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
                                                        <td width="20%">法人-身份证正面：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="legalpersonId" id="legalpersonId"/></td>
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
                                                        <td width="20%">法人-身份证背面：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="legalpersonBackId" id="legalpersonBackId"/></td>
                                                        <td>  
                                                      		<input type="button" value="上传" onclick="proEvn5Upload()" />                                                     
                                                        </td>
                                                        <td width="2%">
                                                        	<div id="proEnv5Queue" style="padding: 3px;">    
                											</div>               											
                										</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">法人手机号：</td>
                                                        <td width="20%"><input type="text" name="legalpersonMobile" maxlength="11"/></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">企业委托书文件：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="companyPoaId" id="companyPoaId"/></td>
                                                        <td>  
                                                      		<input type="button" value="上传" onclick="proEvn6Upload()" />                                                     
                                                        </td>
                                                        <td width="2%">
                                                        	<div id="proEnv6Queue" style="padding: 3px;">    
                											</div>               											
                										</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">代理人-身份证正面：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="agentId" id="agentId"/></td>
                                                        <td>  
                                                      		<input type="button" value="上传" onclick="proEvn7Upload()" />                                                     
                                                        </td>
                                                        <td width="2%">
                                                        	<div id="proEnv7Queue" style="padding: 3px;">    
                											</div>               											
                										</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">代理人-身份证背面：</td>
                                                        <td width="20%">
                                                        	<input type="file" name="agentBackId" id="agentBackId"/></td>
                                                        <td>  
                                                      		<input type="button" value="上传" onclick="proEvn8Upload()" />                                                     
                                                        </td>
                                                        <td width="2%">
                                                        	<div id="proEnv8Queue" style="padding: 3px;">    
                											</div>               											
                										</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="20%">代理人手机号：</td>
                                                        <td width="20%"><input type="text" name="agentMobile" maxlength="11"/></td>
                                                        <td></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="submit" value="提交" /></td>
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
                                <img src="${ctx}/images/base/icon_phone.gif" width="17" height="14"> 官方网站：<a href="{companyUrl}" target="_blank">${companyName}</a>
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