<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/style/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/background/content.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/script/jquery/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath}/style/bootstrap/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/style/background/sidebar.js"></script>
    <title>后台管理系统</title>
</head>
<body>
    <div class="main-container-inner">
        <div class="sidebar" id="sidebar">
            <!-- #sidebar-shortcuts -->

            <ul class="nav nav-list">
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="glyphicon glyphicon-th"></i>
                        <span class="menu-text">政策信息 </span>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="informationclassify.html" target="mainFrame">
                                信息分类
                            </a>
                        </li>

                        <li>
                            <a href="informationmanagement.html" target="mainFrame">
                                信息管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="glyphicon glyphicon-book"></i>
                        <span class="menu-text"> 知识库 </span>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="productclassify.html" target="mainFrame">
                                产品分类
                            </a>
                        </li>

                        <li>
                            <a href="productmanagement.html" target="mainFrame">
                                产品管理
                            </a>
                        </li>
                        <li>
                            <a href="questionlist.html" target="mainFrame">
                                互动模块
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                模板文档
                            </a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="newmessagelist.html" class="dropdown-toggle">
                        <i class="glyphicon glyphicon-earphone"></i>
                        <span class="menu-text"> QCS服务 </span>
                    </a>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="glyphicon glyphicon-phone"></i>
                        <span class="menu-text">通讯录 </span>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="addressbooklist.html" target="mainFrame">
                                通讯录管理
                            </a>
                        </li>
                        <li>
                            <a href="addressderive.html" target="mainFrame">
                                通讯录导出
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="active">
                    <a href="material.html" target="mainFrame">
                        <i class="glyphicon glyphicon-star"></i>
                        <span class="menu-text"> 素材库 </span>
                    </a>
                </li>
            </ul>
            <!-- /.nav-list -->
        </div>

    </div>
    <!-- menu end --><!-- menu end -->
</body>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</html>
