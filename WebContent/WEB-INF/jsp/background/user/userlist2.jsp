<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户列表</title>
	<%@ include file="/commons/jsp/commons.jspf" %>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/commons/paging.js"></script><!-- 分页 -->
	<style type="text/css">
		html{ height:100%} /*兼容firefox的div高度100%*/  
		#left{
			float:left;
			width:200px;
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
        <li class="active">用户管理</li>
    </ul>
    <!-- .breadcrumb -->
</div>

<div class="page-content">
    <div class="page-header" id="mycategory">
        <h1>
           	 用户管理
            <small>
                <a id="addUI" class="btn btn-primary" href="${pageContext.request.contextPath}/user/addUI">新建用户</a>
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
                            	<th style="width:8%"><input type="checkbox" name="allId" id="allId"/></th>
                                <th style="width:8%">序号</th>
                                <th style="width:18%">登录名</th>
                                <th style="width:18%">真实姓名</th>
                                <th style="width:18%">用户权限</th>
                                <th style="width:20%">身份证号</th>
                                <th style="width:10%">操作</th>
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
            <!-- 分页模块 -->
            <div style="width:100%;text-align:center;">
            	<form id="page_form" action="${pageContext.request.contextPath}/user/list" method="post">
            	<div id="left">
	            	<ul class="pagination">
	            		<li>
	                		每页显示记录
		                	<select id="pageSize" name="pageSize" >
		                		<option value="10">10</option>
		                		<option value="5">5</option>
		                	</select>条 
                		</li>
	            	</ul>
            	</div>
            	<div id="center">
	                <ul class="pagination">
	                	<li id="previous"><a>${page.hasPreviousPage==true?'上一页&laquo;':'无上一页'}</a></li>
	                    <c:forEach items="${page.navigatepageNums}" var="item">
	                    	<li class="navigate"><a>${item}</a></li>
	                    </c:forEach>
	                    <li id="next"><a>${page.hasNextPage==true?'下一页&raquo;':'无下一页'}</a></li>
	                    <li>当前第${page.pageNum}页，共${page.pages}页 </li>
	                    <li>到第<input type="text" id="pageNum" name="pageNum" value="${page.pageNum}" style="width:30px"/>页 <input type="submit" class="btn btn-xs btn-info" value="确定"/></li>
	                </ul>
                </div>
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
	//分页方法对象
	new Page("${page.pageNum}","${page.pageSize}").paging();
	
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
		var userId=$(this).parent().parent().parent().find("#id").val();
		if (confirm("确认删除吗？")) {
			location.href="${pageContext.request.contextPath}/user/delete?id="+userId;
		}
	});
});
</script>
</html>