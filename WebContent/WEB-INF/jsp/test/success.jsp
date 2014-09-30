<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>成功页面</title>
  </head>
  
  <body>
		添加数据成功 <br>
		<c:forEach items="${users}" var="user">  
		    ${user.value.userName}----${user.value.userName}----${user.value.userName}----${user.value.idCard}  
		        <a href="<%=request.getContextPath()%>/user/${user.value.userName}">查看</a>  
		        <a href="<%=request.getContextPath()%>/user/${user.value.userName}/update">编辑</a>  
		        <a href="<%=request.getContextPath()%>/user/${user.value.userName}/delete">删除</a>  
		    <br/>  
		</c:forEach>  
		<br/>  
		<a href="<%=request.getContextPath()%>/upload/add">继续添加用户</a>  
  </body>
</html>
