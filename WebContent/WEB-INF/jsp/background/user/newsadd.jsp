<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>增加用户</title>
	<%@ include file="/commons/jsp/commons.jspf" %>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/commons/DateFormat.js"></script>
	<style type="text/css">
		#total{
			text-align:center;
		}
		.modal-footer{
			text-align:center;
		}
		.inputTd{
			text-align:left;
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
                <h4 class="modal-title" id="myModalLabel">新建用户</h4>
            </div>
            <div class="modal-body clearfix">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <form class="form-horizontal" role="form" id="form_add" method="post">
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">登录名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="请输入您的登录名" name="loginName" id="loginName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" placeholder="请输入您的密码" name="password" id="password" size="30" maxlength="20"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" placeholder="再次输入密码" name="password2" id="password2" size="30" maxlength="20"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">真实姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="userName" placeholder="请输入您的真实姓名" id="userName" size="30" maxlength="20"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">身份证</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="idCard" placeholder="请输入您的身份证号码" id="idCard" size="30" maxlength="20"/>
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
		location.href="${pageContext.request.contextPath}/user/list";
	});
	$("#close").click(function(){
		location.href="${pageContext.request.contextPath}/user/list";
	});
});

/**
* 验证 提交
*/
$("#form_add").validate({
	rules:{
		loginName:{
			required:true,
			num620Char:true,
			remote:{
				url:"${pageContext.request.contextPath}/user/checkUnique",
				type:"post"
			}
		},
		password:{
			required:true,
			num620Char:true
		},
		password2:{
			required:true,
			equalTo:"#password"
		},
		userName:{
			required:true,
			trueName:true
		},
		idCard:{
			required:true,
			//idCardRule:true,
			remote:{
				url:"${pageContext.request.contextPath}/user/checkUnique",
				type:"post"
			}
		}
	},messages: {
		loginName:{
			remote:"此登录名已经被使用"
		},
		password2:{
			equalTo:"两次密码输入不一致！"
		},
		idCard:{
			remote:"此身份证已经被使用"
		}
	},submitHandler:function(form){
	     $(form).attr("action","${pageContext.request.contextPath}/user/add");
		 form.submit();
	}
});

/**********************自定义验证部分*************************/
//1 20个字符，中文算2个
$.validator.addMethod("char20", function(value, element) {
	 if(value.replace(/[^\x00-\xff]/g,"**").length>20){
		 return false;
	 }
	 return true;
}, "最多只能输入20个字符(中文占2个)。");

//2 8-20位 数字字母
$.validator.addMethod("num620Char", function(value, element) {
var regRule = /^([A-Z]|[a-z]|[0-9]){6,20}$/;
return this.optional(element)||regRule.test(value);
}, "只能为6-20位的数字或字母。");

//3 身份证号码验证逻辑
$.validator.addMethod("idCardRule", function(value, element) {
	var rule=/^[0-9]{15}||[0-9]{18}||([0-9]{17}(X|x){1})$/;
	var todayDate18=new Date().format("yyyyMMdd");//18位日期
	var todayDate15=new Date().format("yyMMdd");//15位日期
	if (rule.test(value)) {//1.1 位数正确
		if (value.length==15) {//1.2 身份证上的日期必须小于现在的日期
			if (value.substring(6,12)<todayDate15) {
				return true;
			}
		}else{
			if (value.substring(6,14)<todayDate18) {
				return true;
			}
		}
	}
	return false;
}, "身份证号码非法,请重新确认。");

//4、人名
$.validator.addMethod("trueName", function(value, element) {
	//以汉字和字母开头,后面可以有汉字、字母、点,长度20位
	var rule=/^([\u4E00-\u9fa5]|[A-Z]|[a-z]){1}(·|[\u4E00-\u9fa5]|[A-Z]|[a-z]){0,19}$/;
	if (rule.test(value)){
		if(value.replace(/[^\x00-\xff]/g,"**").length<=20){
			return true;
		}
	}
	return false;
}, "只能输入中/英文/间隔号且长度不大于20(中文占2)。");
</script>
</html>