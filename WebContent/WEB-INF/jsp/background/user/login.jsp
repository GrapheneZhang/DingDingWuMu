<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <!-- Bootstrap -->
    <%@ include file="/commons/jsp/commons.jspf" %>
    <script src="${pageContext.request.contextPath}/script/jquery/jquery.cookie.js"></script>
</head>
<body class="login-layout">
<div class="container">
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="login-container">
                <h1>
                    <i class="glyphicon glyphicon-leaf green"></i>
                    <span class="red">鼎鼎钨钼后台管理系统</span>
                    <!-- <span class="white"></span> -->
                </h1>
                <h4 class="blue">&copy;鼎鼎钨钼</h4>

                <div class="position-relative">
                    <div id="login-box" class="login-box">
                        <form id="loginForm" method="post">
                            <fieldset>
                                <label class=" block margin-b20">
                                    <input type="text" class="form-control" placeholder="用户名" id="loginName" name="loginName"/>
                                </label>

                                <label class="block margin-b20">
                                    <input type="password" class="form-control" placeholder="密码" id="password" name="password"/>
                                </label>

                                <div>
                                    <input type="checkbox" id="rememberMe"/>
                                    <span class="white">记住我</span>
                                    <input type="submit" class="btn-info btn-sm fr" value="登录"/>
                                </div>
                                <div id="message" style="width:300px;height:9px;color:red;margin-top:10px">${message}</div>
                                <%-- <span style="color:red">${message}</span> --%>
                            </fieldset>
                        </form>
                    </div>
                    <!-- /login-box -->
                </div>
                <!-- /position-relative -->
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</div>
<!-- /.main-container -->
</body>
<script type="text/javascript">

/**1、键盘按键**/
$(window).keydown(function(event){
	switch(event.keyCode) {
		case 13:
			$("#loginForm").submit();
			break;
	}
});

$(function(){
	//设置页面载入的时候，如果cookie存在就填充两个input
	if ($.cookie('loginName')!="null") {
		$("#loginName").val($.cookie('loginName'));
		$("#password").val($.cookie('password'));
		$("#rememberMe").prop("checked",true);
	}
});

/**
* 验证 提交
*/
$("#loginForm").validate({
	rules:{
		loginName:{
			required:true
		},
		password:{
			required:true
		}
	},messages: {
		loginName:{
			required:"用户名不能为空!"
		},
		password:{
			required:"密码不能为空!"
		}
	},
	errorContainer:"message",
	errorLabelContainer:$("#message"),
	submitHandler:function(form){
		//1 根据时候选择了记住我，对cookie进行操作
		if ($("#rememberMe").prop("checked")) {
			$.cookie('loginName', $("#loginName").val(),{expires:1}); //设置cookie的值
			$.cookie('password', $("#password").val(),{expires:1}); //设置cookie的值
		}else{
			if ($.cookie('loginName')!="null"&&$.cookie('loginName')!='') {
				$.cookie('loginName',null);
			}
			if ($.cookie('password')!="null"&&$.cookie('password')!='') {
				$.cookie('password',null);
			}
		}
		//2 提交
		$(form).attr("action","${pageContext.request.contextPath}/user/login");
		form.submit();
	}
});
</script>
</html>