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
                    <!--<i class="icon-leaf"></i>-->
                   	 鼎鼎钨钼后台管理系统
                </small>
            </a><!-- /.brand -->
        </div>
        <!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <!--<img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo"/>-->
								<span class="user-info">
									<small>用户名,</small>
									Jason
								</span>
                                <span class="caret"></span>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu  dropdown-close">
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
                </li>
            </ul>
            <!-- /.ace-nav -->
        </div>
        <!-- /.navbar-header -->
    </div>
    <!-- /.container -->
</div>
</body>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</html>
