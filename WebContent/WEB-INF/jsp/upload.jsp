<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title>文件上传</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript">
    
    		//本来打算用ajax向后台传递json数据，但是没有成功。。。。
    		function userUpload(){
    				
    				alert("进入js中");
    				var loginname=$("#loginname").val();
    				var username=$("#username").val();
    				var password=$("#password").val();
    				var idcard=$("#idcard").val();
    				//这样的方式是可以进行赋值的
    				var josn={ "loginname": loginname, "username":username,
    										 "password":password, "idcard":idcard}
    				alert(josn.loginname+"开始进行ajax");			 
    			    $.post("${pageContext.request.contextPath}/fileUpload/add",
						    		josn,
						    		function(data,status){
						      				alert("数据：" + data + "\n状态：" + status);
									}
				   );
    		}
    </script>
  </head>
  
  <body>
		    <form  method="POST" action="${pageContext.request.contextPath}/fileUpload/add" enctype="multipart/form-data">  
				    username: <input type="text" name="loginName" id="loginname"/><br/>  
				    nickname: <input type="text" name="userName" id="username"/><br/>  
				    password: <input type="password" name="password" id="password"/><br/>  
				    yourmail: <input type="text" name="idCard" id="idcard"/><br/>  
				    yourfile: <input type="file" name="myfiles"/><br/>  
		    <input type="submit"   value="添加新用户"/>  
		</form>  
  </body>
</html>
