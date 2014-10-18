<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/jsp/commons.jspf" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>增加用户</title>
	<style type="text/css">
		table{
			border:1px solid blue;
		}
	</style>
</head>
<body>
<form id="form_add" name="form_add" method="post">
<div align="left">
	<input type="submit" value="确定" id="add"/>&nbsp;&nbsp;
	<input type="button" value="返回" id="showback"/>&nbsp;&nbsp;
</div>
<table>
	<tr>
		<td>登录名：</td>
		<td><input type="text" name="loginName" id="loginName" size="30" maxlength="20"/></td>
	</tr>
	<tr>
		<td>密码：</td>
		<td><input type="password" name="password" id="password" size="30" maxlength="20"/></td>
	</tr>
	<tr>
		<td>确认密码：</td>
		<td><input type="password" name="password2" id="password2" size="30" maxlength="20"/></td>
	</tr>
	<tr>
		<td>真实姓名：</td>
		<td><input type="text" name="userName" id="userName" size="30" maxlength="20"/></td>
	</tr>
	<tr>
		<td>身份证：</td>
		<td><input type="text" name="idCard" id="idCard" size="30" maxlength="20"/></td>
	</tr>
</table>
</form>
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
			char20:true
		},
		idCard:{
			required:true,
			char20:true,
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
return regRule.test(value);
}, "只能为6-20位的数字字母,请重新确认!");
</script>
</html>