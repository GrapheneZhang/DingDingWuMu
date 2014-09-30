<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/jsp/commons.jspf" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/DateFormat.js"></script><!-- 日期格式化 -->
	<title>修改用户</title>
	<style type="text/css">
		table{
			border:1px solid blue;
		}
	</style>
</head>
<body>
<spring:form id="form_update" name="form_update" path="form_update" commandName="user" method="post">
<div align="left">
	<input type="submit" value="确定" id="update"/>&nbsp;&nbsp;
	<input type="button" value="返回" id="showback"/>&nbsp;&nbsp;
	<input type="hidden" name="id" id="id" value="${user.id}"/>
</div>
<table>
	<tr>
		<td>登录名：</td>
		<td><spring:input type="text" name="loginName" id="loginName" path="loginName" size="30" maxlength="20"/></td>
	</tr>
	<tr>
		<td>原密码：</td>
		<td><input type="text" name="oldPassword" id="oldPassword" value="${user.password}" readonly="readonly" size="30" maxlength="20"/></td>
	</tr>
	<tr>
		<td>新密码：</td>
		<td><input type="password" name="password" id="password" size="30" maxlength="20"/></td>
	</tr>
	<tr>
		<td>新密码确认：</td>
		<td><input type="password" name="password2" id="password2" size="30" maxlength="20"/></td>
	</tr>
	<tr>
		<td>真实姓名：</td>
		<td><spring:input type="text" name="userName" id="userName" path="userName" size="30" maxlength="20"/></td>
	</tr>
	<tr>
		<td>身份证：</td>
		<td><spring:input type="text" name="idCard" id="idCard" path="idCard" size="30" maxlength="20"/></td>
	</tr>
</table>
</spring:form>
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
$("#form_update").validate({
	rules:{
		loginName:{
			required:true,
			num620Char:true,
			remote:{
				url:"${pageContext.request.contextPath}/user/checkUnique",
				type:"post",
				data:{updateId:$("#id").val()}
			}
		},
		oldPassword:{
			required:true,
			num620Char:true
		},
		password:{
			required:true,
			notEqual:true,
			num620Char:true,
			equalRePassword:true
		},
		password2:{
			required:true,
			equalTo:"#password"
		},
		userName:{
			required:true,
			char20:true
		},
		idCard:{
			required:true,
			idCardRule:true,
			remote:{
				url:"${pageContext.request.contextPath}/user/checkUnique",
				type:"post",
				data:{updateId:$("#id").val()}
			}
		}
	},messages: {
		loginName:{
			remote:"此登录名已经被使用"
		},
		password:{
			equalTo:"两次密码输入不一致！"
		},
		password2:{
			equalTo:"两次密码输入不一致！"
		},
		idCard:{
			remote:"此身份证已经被使用"
		}
	},submitHandler:function(form){
		$.post(
			 "${pageContext.request.contextPath}/user/update",
			 $(form).serialize(),
			 function(data){
				if (data=='true') {
					alert("修改成功！");
					location.href="${pageContext.request.contextPath}/user/list";
				} else {
					alert("密码错误，修改失败！");
				}
				
			 }
		 );
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
return regRule.test(value);
}, "只能为6-20位的数字字母,请重新确认!");

//3、新密码不能与现用密码一样
$.validator.addMethod("notEqual", function(value, element) {
	return value!=$("#oldPassword").val();
}, "新密码不能与现用密码一样,请重新确认!");

//4、密码要和确认密码一致
$.validator.addMethod("equalRePassword", function(value, element) {
	if($("#password2").val()!=""){
		return value==$("#password2").val();
	}
	return true;
}, "密码和确认密码不一致,请重新确认!");

//5 身份证号码验证逻辑
$.validator.addMethod("idCardRule", function(value, element) {
	var rule=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(X|x)$)/;
	var todayDate18=new Date().format("yyyyMMdd");//18位日期
	var todayDate15=new Date().format("yyMMdd");//15位日期
	if (rule.test(value)) {//1.1 位数正确
		if (value.lenth==15) {//1.2 身份证上的日期必须小于现在的日期
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
</script>
</html>