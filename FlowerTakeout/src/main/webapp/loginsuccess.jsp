<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>成功</title>

		 <jsp:include page="/common/head.jsp"></jsp:include>
		 <script type="text/javascript">
		 function logout(){
   		var r = confirm("您是否确定注销");
   		if(r){
   		//在后台将session注销
   			var url = "<%=path%>/SSHLogin/logout";  
   			window.location.href=url;
   			return true;
   		}
   		return false;
   	}
     $(document).ready(function (){
  $(".menu ul li").menu();
});
		 </script>
	</head>
<body style="background-color:white;">
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
        <li><a href="" onclick="return logout()">注销</a></li>
        <li class="dropdown">
          <a href="javascript:void(0); " class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">关于我们<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="javascript:void(0); ">店铺</a></li>
            <li><a href="javascript:void(0); ">联系我们</a></li>
            <li><a href="javascript:void(0); ">邮件订阅</a></li>
            <li><a href="javascript:void(0); ">咨询</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid --> 

 
    <div id="content" style="background-color: white;float: left" >
    <div class="menu" style="background-color: white" >
        <ul>
        <li><a class="active" href="javascript:void(0); ">一流资源网</a>
            <ul style="display: block;">
                <li><a href="javascript:void(0); ">Subitem 1</a></li>
                <li><a href="javascript:void(0); ">Subitem 2</a>
                    <ul>
                        <li><a href="javascript:void(0); ">Subitem 1</a></li>
                        <li><a href="javascript:void(0); ">Subitem 2</a></li>
                        <li><a href="javascript:void(0); ">Subitem 3</a></li>
                        <li><a href="javascript:void(0); ">Subitem 4</a></li>
                    </ul>
                </li>
                <li><a href="javascript:void(0); ">Subitem 3</a></li>
                <li><a href="javascript:void(0); ">Subitem 4</a>
                    <ul>
                        <li><a href="javascript:void(0); ">Subitem 1</a></li>
                        <li><a href="javascript:void(0); ">Subitem 2</a></li>
                    </ul>
                </li>
                <li><a href="javascript:void(0); ">Subitem 5</a></li>
            </ul>
        </li>
        <li><a href="javascript:void(0); ">Item 2</a>
            <ul>
                <li><a href="javascript:void(0); ">Subitem 1</a></li>
                <li><a href="javascript:void(0); ">Subitem 2</a></li>
                <li><a href="javascript:void(0); ">Subitem 3</a></li>
                <li><a href="javascript:void(0); ">Subitem 4</a></li>
            </ul>
        </li>
        <li><a href="javascript:void(0); ">Item 3</a>
            <ul>
                <li><a href="javascript:void(0); ">Subitem 1</a></li>
                <li><a href="javascript:void(0); ">Subitem 2</a></li>
                <li><a href="javascript:void(0); ">Subitem 3</a></li>
                <li><a href="javascript:void(0); ">Subitem 4</a></li>
                <li><a href="javascript:void(0); ">Subitem 5</a></li>
                <li><a href="javascript:void(0); ">Subitem 6</a></li>
            </ul>
        </li>
        <li><a href="javascript:void(0); ">Item without subitems</a></li>
        <li><a href="javascript:void(0); ">Item without subitems</a></li>
    </ul>
    </div>
</div>
  </nav>



  </body>
</html>
