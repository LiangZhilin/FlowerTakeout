<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>异常错误页面</title>
    
	 <jsp:include page="/common/head.jsp"></jsp:include>
	-->

  </head>
  
  <body>
   异常错误页面 <br>
  </body>
</html>
