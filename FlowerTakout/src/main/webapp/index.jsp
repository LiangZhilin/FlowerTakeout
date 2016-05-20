<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ZARA</title>
    
	 <jsp:include page="/common/head.jsp"></jsp:include>

  </head>
  
  <body >
    <nav class="navbar" >
  <div class="container-fluid" style="background-color:white;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" >
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    	<img src="image/zara-logo.jpg" />
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"  style="border:0px;">
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="SSHLogin/login!login">登录</a></li>
        <li><a href="SSHLogin/login!register">注册</a></li>
        <li class="dropdown">
          <a href="regiter.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">关于我们<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">店铺</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">邮件订阅</a></li>
            <li><a href="#">咨询</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
  </body>
</html>
