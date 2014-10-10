<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <!-- Bootstrap -->
    <%@ include file="/commons/jsp/commons.jspf" %>
</head>
<body class="login-layout">
<div class="container">
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="login-container">
                <h1>
                    <i class="glyphicon glyphicon-leaf green"></i>
                    <span class="red">鼎鼎钨钼</span>
                    <span class="white">后台管理系统</span>
                </h1>
                <h4 class="blue">&copy;©鼎鼎钨钼</h4>

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
                                <span style="color:red">${message}</span>
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
	},submitHandler:function(form){
		//1 根据时候选择了记住我，对cookie进行操作
		/* if ($("#rememberMe").prop("checked")) {
			var cookietime = new Date();
			cookietime.setTime(date.getTime() + (60 * 60 * 1000));//coockie保存一小时 
			$.cookie('loginName', $("#loginName").val(),{expires:cookietime}); //设置cookie的值
			$.cookie('password', $("#password").val(),{expires:cookietime}); //设置cookie的值
		}else{
			if ($.cookie('loginName')!=null&&$.cookie('loginName')!='') {
				$.cookie('loginName',null);
			}
			if ($.cookie('password')!=null&&$.cookie('password')!='') {
				$.cookie('password',null);
			}
		} */
		//2 提交
		$(form).attr("action","${pageContext.request.contextPath}/user/login");
		form.submit();
	}
});
</script>
</html>