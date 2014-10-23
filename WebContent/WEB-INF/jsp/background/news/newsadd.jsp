<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>发布新闻</title>
	<%@ include file="/commons/jsp/commons.jspf" %>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/summernote/summernote.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/summernote/summernote-zh-CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/script/summernote/summernote.css"/>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
	<style type="text/css">
		div[class='note-insert btn-group']{
			display:none;
		}
	</style>
</head>
<body>
<!-- Modal newproduct -->
<div id="newproduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg modal-box">
        <div class="modal-content ">
            <div class="modal-header">
                <button type="button" class="close" id="close" data-dismiss="modal">
                    <span  aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">发布信息</h4>
            </div>
            <div class="modal-body clearfix">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <form class="form-horizontal" role="form" id="form_add" method="post">
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">新闻标题</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="" name="title" id="title"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">新闻内容</label>
                                <div class="col-sm-10">
                                	<textarea class="summernote" id="content" name="content" ></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <input type="submit" class="btn btn-success" value="保存"/>
                                    <input type="button" class="btn btn-default" id="showBack" value="取消" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Modal end-->
</body>
<script type="text/javascript">
/**
 * Main
 */
$(function(){
	/**********ProcessingStart**********/
	//1 返回
	$("#showBack").click(function(){
		location.href="${pageContext.request.contextPath}/news/list";
	});
	$("#close").click(function(){
		location.href="${pageContext.request.contextPath}/news/list";
	});
	
	//富文本
	$(".summernote").summernote({
		height:400,
		lang:'zh-CN'
	});
});

/**
* 验证 提交
*/
$("#form_add").validate({
	rules:{
		title:{
			required:true,
			char50:true
		},
		content:{
			required:true,
			char2000:true
		}
	},messages: {
		
	},submitHandler:function(form){
		alert($("#content").html());
		alert($(".note-editable").html());
		return false;
	    $(form).attr("action","${pageContext.request.contextPath}/news/add");
		form.submit();
	}
});

/**********************自定义验证部分*************************/
//1 50个字符，中文算2个
$.validator.addMethod("char50", function(value, element) {
	var result=false;
	if(value.replace(/[^\x00-\xff]/g,"**").length<=50){
		result= true;
	}
	return this.optional(element)||result;
}, "最多只能输入50个字符(中文占2个)。");

//2 2000个字符，中文算2个
$.validator.addMethod("char2000", function(value, element) {
	var result=false;
	if(value.replace(/[^\x00-\xff]/g,"**").length<=2000){
		result=true;
	}
	return this.optional(element)||result;
}, "最多只能输入2000个字符(中文占2个)。");
</script>
</html>