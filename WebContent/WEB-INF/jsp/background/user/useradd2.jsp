<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>增加用户</title>
	<%@ include file="/commons/jsp/commons.jspf" %>
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
    <table class="table table-striped table-bordered table-hover">
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
    
</div>
</div>



<!-- <div class="modal fade">ss</div> -->
<div class="modal fade" id="newuser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-boxmargin">
	    <div class="modal-content">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span>
	                <span class="sr-only">Close</span>
	            </button>
	            <h4 class="modal-title" id="myModalLabel">新建用户</h4>
	        </div>
	        <div class="modal-body clearfix">
	            <div class="form-group">
	                <label class="col-sm-2 control-label no-padding-right" for="form-newuser">新建用户</label>
	                <div class="col-sm-9">
	                    <input class="col-sm-10 " type="text" id="form-newuser"/>
	                </div>
	            </div>
	
	        </div>
	        <div class="modal-footer">
	            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	            <button type="button" class="btn btn-primary">确定</button>
	        </div>
	    </div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</html>