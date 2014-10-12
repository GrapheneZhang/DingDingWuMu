<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户列表</title>
	<%@ include file="/commons/jsp/commons.jspf" %>
</head>
<body>
<div class="main-container" id="main-container">
<div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <a href="#">系统管理</a>
        </li>
        <li class="active">用户管理</li>
    </ul>
    <!-- .breadcrumb -->
</div>

<div class="page-content">
    <div class="page-header" id="mycategory">
        <h1>
           	 用户管理
            <small>
                <a id="addUI" class="btn btn-primary" data-toggle="modal" href="${pageContext.request.contextPath}/user/addUI">新建用户</a>
            </small>
        </h1>
    </div>
    <!-- /.page-header -->
    <div class="row">
        <div class="col-sm-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                            	<th><input type="checkbox" name="allId" id="allId"/></th>
                                <th>序号</th>
                                <th>登录名</th>
                                <th>真实姓名</th>
                                <th>用户权限</th>
                                <th>身份证号</th>
                                <th>操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${userList}" var="user" varStatus="state">
							<tr>
								<td><input type="checkbox" name="id" id="id" value="${user.id}"/></td>
								<td>${state.count}</td>
								<td>${user.loginName}</td>
								<td>${user.userName}</td>
								<td>${user.privilege=='1'?'超级管理员':'管理员'}</td>
								<td>${user.idCard}</td>
								<td>
                                    <div class="btn-group">
                                        <button name="updateUI" class="btn btn-xs btn-success">
                                            <i class="glyphicon glyphicon-pencil"></i>
                                        </button>
                                        <button name="delete" class="btn btn-xs btn-info">
                                            <i class="glyphicon glyphicon-remove"></i>
                                        </button>
                                    </div>
                                </td>
							</tr>
							</c:forEach>
                            <tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /span -->
            </div>
            <div class="text-center" style="width:100%">
            	<form id="page_form" action="${pageContext.request.contextPath}/user/list" method="post">
                <ul class="pagination">
                	<li class="text-left">
                		每页显示记录
	                	<select id="pageSize" name="pageSize" >
	                		<option value="10">10</option>
	                		<option value="5">5</option>
	                	</select>条 
                	</li>
                	<c:if test="${hasPreviousPage==true}">
                		<li><a href="#">上一页&laquo;</a></li>
                	</c:if>
                    <c:forEach items="${page.navigatepageNums}" var="item">
                    	<li class="navigate"><input type="button" value="${item}"></li>
                    </c:forEach>
                    <c:if test="${hasNextPage==true}">
                		<li><a href="#">下一页&raquo;</a></li>
                	</c:if>
                    <li>当前第${page.pageNum}页，共${page.pages}页 </li>
                    <li>到第<input type="text" id="pageNum" name="pageNum" value="${page.pageNum}" style="width:30px"/>页 <input type="submit" class="btn btn-xs btn-info" value="确定"/></li>
                </ul>
                </form>
            </div>
            <!-- /row -->
        </div>
    </div>
</div>
</div>
</body>
<script type="text/javascript">
/**
 * Main:准备方法
 */
$(function(){
	
	//每页显示记录数
	$("#pageSize").val("${page.pageSize}");//载入时回显
	$("#pageSize").change(function(){//改变时重新加载列表
		$("#page_form").submit();
	});
	// 点击导航页码的时候提交
	$(".navigate").click(function(){
		$("#pageNum").val($(this).find("input").val());
		$("#page_form").submit();
	});
	
	//1 全选、全不选
	$("#allId").click(function(){
		if ($("#allId").prop("checked")) {
			$("input[name='id']").prop("checked",true);
		}else{
			$("input[name='id']").prop("checked",false);
		}
	});
	
	//2 修改
	$("button[name=updateUI]").click(function(){
		var userId=$(this).parent().parent().parent().find("#id").val();
		location.href="${pageContext.request.contextPath}/user/updateUI?id="+userId;
	});
	//3 删除
	$("button[name=delete]").click(function(){
		
	});
});
</script>
</html>