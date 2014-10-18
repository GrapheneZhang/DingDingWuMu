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
<div class="main-container" id="main-container">
<div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <a href="#">系统管理</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/user/list">用户管理</a>
        </li>
        <li class="active">新建用户</li>
    </ul>
    <!-- .breadcrumb -->
    <div id="total">
    	<form id="form_add" method="post">
	    <table class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:45%">登录名：</td>
				<td class="inputTd"><input type="text" name="loginName" id="loginName" size="30" maxlength="20"/></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td class="inputTd"><input type="password" name="password" id="password" size="30" maxlength="20"/></td>
			</tr>
			<tr>
				<td>确认密码：</td>
				<td class="inputTd"><input type="password" name="password2" id="password2" size="30" maxlength="20"/></td>
			</tr>
			<tr>
				<td>真实姓名：</td>
				<td class="inputTd"><input type="text" name="userName" id="userName" size="30" maxlength="20"/></td>
			</tr>
			<tr>
				<td>身份证：</td>
				<td class="inputTd"><input type="text" name="idCard" id="idCard" size="30" maxlength="20"/></td>
			</tr>
		</table>
		<div class="modal-footer">
	        <input type="button" id="showback" class="btn btn-default" value="取消"/>
	        <input type="submit" class="btn btn-primary" value="确定"/>
	    </div>
	    </form>
    </div>
</div>
</div>
</body>
<script type="text/javascript">
/**
 * Main
 */
$(function(){
	/**********ProcessingStart**********/
	//1 返回
	$("#showback").click(function(){
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
			idCardRule:true,
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
}, "最多只能输入20个字符(中文计为2个字符),请重新确认!");

//2 8-20位 数字字母
$.validator.addMethod("num620Char", function(value, element) {
var regRule = /^([A-Z]|[a-z]|[0-9]){6,20}$/;
return this.optional(element)||regRule.test(value);
}, "只能为6-20位的数字或字母,请重新确认!");

//3 身份证号码验证逻辑
$.validator.addMethod("idCardRule", function(value, element) {
	var rule=/^\d{15}||\d{18}||(\d{17}(X|x))$/;
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
}, "身份证号码非法,请重新确认!");

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
}, "只能输入中/英文/间隔号且长度不大于20(中文计为2)!");
</script>
</html>