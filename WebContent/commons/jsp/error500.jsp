<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body onload="load()">
	<div>
		<label>抱歉,网站出现异常。</label><br>
		将在5秒后转到主页,您也可以<a href="index.jsp">点击进入主页</a>
	</div>
</body>
<script type="text/javascript">
	function load(){
		setTimeout(function(){
			location.href="${pageContext.request.contextPath}/index.jsp";
		},5000); 
	}
</script>
</html>