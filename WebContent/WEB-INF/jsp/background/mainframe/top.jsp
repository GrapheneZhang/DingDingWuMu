<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>后台管理系统</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/style/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/background/content.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/script/jquery/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath}/style/bootstrap/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/style/background/sidebar.js"></script>
</head>
<body>
<div class="navbar navbar-default" id="navbar">
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="glyphicon glyphicon-leaf"></i>
                   	 鼎鼎钨钼后台管理系统
                </small>
            </a><!-- /.brand -->
        </div>
        <!-- /.navbar-header -->
        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a href="#">
                        <!--<img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo"/>-->
								<span class="user-info">
									<small>用户名:</small>
									${user.loginName}
								</span>
                                <!-- <span class="caret"></span> -->
                    </a>
                    <li class="light-blue"><a id="logout"><small><i class="glyphicon glyphicon-off"></i> &nbsp;注销</small></a></li>
                   

                  <!--   <ul class="user-menu pull-right dropdown-menu  dropdown-close">
                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-wrench"></i>
                                è®¾ç½®
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-user"></i>
                                ä¸ªäººèµæ
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-off"></i>
                                éåº
                            </a>
                        </li>
                    </ul>
                </li>-->
            </ul>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#logout").click(function(){
			var result=confirm("您确认要注销本次登录吗?");
			if (result) {
				window.parent.location.href="${pageContext.request.contextPath}/user/logout";
			}
		});
	});
</script>
</html>