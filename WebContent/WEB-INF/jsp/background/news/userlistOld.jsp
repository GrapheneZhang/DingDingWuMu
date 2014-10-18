<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/jsp/commons.jspf" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户列表页</title>
	<style type="text/css">
		table{
			border:1px solid blue;
		}
	</style>
</head>
<body>
<div>
	<spring:form id="form_search" name="form_search" commandName="user" method="post">
		登录名：<spring:input type="text" path="loginName" id="loginName"/>
		真实姓名：<spring:input type="text" path="userName" id="userName"/>
		身份证：<spring:input type="text" path="idCard" id="idCard"/>
		<input type="button" id="search" value="查询"/>
		<input type="reset" id="reset" value="重置"/>
	</spring:form>
</div>
<div align="left">
	<input type="button" value="新增" id="addUI"/>&nbsp;&nbsp;
	<input type="button" value="修改" id="updateUI"/>&nbsp;&nbsp;
	<input type="button" value="删除" id="delete"/>
</div>
<form id="form_list" name="form_list" method="post">
<table>
	<tr>
		<td><input type="checkbox" name="allId" id="allId"/></td>
		<td>编号</td>
		<td>登录名</td>
		<td>真实姓名</td>
		<td>用户权限</td>
		<td>身份证号</td>
	</tr>
	<c:forEach items="${userList}" var="user" varStatus="state">
	<tr class="info">
		<td><input type="checkbox" name="id" id="id" value="${user.id}"/></td>
		<td>${state.count}</td>
		<td>${user.loginName}</td>
		<td>${user.userName}</td>
		<td>${user.privilege=='1'?'超级管理员':'管理员'}</td>
		<td>${user.idCard}</td>
	</tr>
	</c:forEach>
</table>
</form>
</body>
<script type="text/javascript">
/**
 * Main
 */
$(function(){
	/**************页面准备 *************/
	$(".info:odd").css("background-color","#eeeeee");//1 斑马线，odd从0开始对应表格第二行
	$("#allId").click(function(){//2 全选、全不选
		if ($("#allId").prop("checked")) {
			$("input[name='id']").prop("checked",true);
		}else{
			$("input[name='id']").prop("checked",false);
		}
	});
	
	/**********ProcessingStart**********/
	//0.1 查询
	$("#search").click(function(){
		document.form_search.action="${pageContext.request.contextPath}/user/list";
		document.form_search.submit();
	});
	//0.2 重置
	$("#reset").click(function(){
		location.href="${pageContext.request.contextPath}/user/list";
	});
	
	//1 增加页
	$("#addUI").click(function(){
		location.href="${pageContext.request.contextPath}/user/addUI";
	});
	
	//2 修改页
	$("#updateUI").click(function(){
		var list= $("input:checkbox[name='id']:checked").length;
		if(list!=1){
			alert("必须且只能选择一个记录，否则无法继续操作。");
	        return false;
		}else{
			document.form_list.action="${pageContext.request.contextPath}/user/updateUI";
			document.form_list.submit();
		}
	});
	
	//3 删除
	$("#delete").click(function(){
		var list= $("input:checkbox[name='id']:checked").length;
		if(list!=1){
			alert("必须且只能选择一个记录，否则无法继续操作。");
	        return false;
		}else{
			var res=confirm("系统提醒您:\确认删除选中的所有记录吗?");
			if(res){
				document.form_list.action="${pageContext.request.contextPath}/user/delete";
				document.form_list.submit();
			}
		}
	});
});
</script>
</html>