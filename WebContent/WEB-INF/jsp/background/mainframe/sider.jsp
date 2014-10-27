<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <ul class="nav nav-list">
                <li class="li1">
                    <a href="#" class="dropdown-toggle">
                        <i class="glyphicon glyphicon-th"></i>
                        <span class="menu-text">系统管理</span>
                    </a>
                    <ul class="submenu">
                    	<c:if test="${CURRENT_USER.privilege==49}">
                        <li>
                            <a href="${pageContext.request.contextPath}/user/list" target="mainFrame">
                            <i class="icon-double-angle-right"></i>
                           	用户管理
                            </a>
                        </li>
                        </c:if>
                        <li>
                            <a href="informationclassify.html" target="mainFrame">操作记录管理 </a>
                        </li>
                    </ul>
                </li>
                <li class="li1">
                    <a href="#" class="dropdown-toggle">
                        <i class="glyphicon glyphicon-bookmark"></i>
                        <span class="menu-text">产品信息管理</span>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="productclassify.html" target="mainFrame">产品类别管理</a>
                        </li>
                        <li>
                            <a href="productclassify.html" target="mainFrame">产品管理</a>
                        </li>
                    </ul>
                </li>
                <li class="li1">
                    <a href="${pageContext.request.contextPath}/news/list" class="dropdown-toggle" target="mainFrame">
                        <i class="glyphicon glyphicon-list-alt"></i>
                        <span class="menu-text"> 新闻管理 </span>
                    </a>
                </li>
                <li class="li1">
                    <a href="newmessagelist.html" class="dropdown-toggle" target="mainFrame">
                        <i class="glyphicon glyphicon-picture"></i>
                        <span class="menu-text"> 素材库管理 </span>
                    </a>
                </li>
                <li class="li1">
                    <a href="newmessagelist.html" class="dropdown-toggle" target="mainFrame">
                        <i class="glyphicon glyphicon-book"></i>
                        <span class="menu-text"> 知识库管理 </span>
                    </a>
                </li>
                <li class="li1">
                    <a href="newmessagelist.html" class="dropdown-toggle" target="mainFrame">
                        <i class="glyphicon glyphicon-cloud-upload"></i>
                        <span class="menu-text"> 上传文件管理 </span>
                    </a>
                </li>
                <li class="li1">
                    <a href="newmessagelist.html" class="dropdown-toggle" target="mainFrame">
                        <i class="glyphicon glyphicon-envelope"></i>
                        <span class="menu-text"> 留言板管理 </span>
                    </a>
                </li>
            </ul>
        </div>

    </div>
    <!-- menu end --><!-- menu end -->
</body>
</html>