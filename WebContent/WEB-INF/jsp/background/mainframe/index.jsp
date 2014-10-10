<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<frameset rows="80px,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="${pageContext.request.contextPath}/user/top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frameset cols="190px,*" frameborder="no" border="0" framespacing="0">
    <frame src="${pageContext.request.contextPath}/user/sider" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" />
    <frame src="" name="mainFrame" id="mainFrame"/>
  </frameset>
</frameset>
</html>


