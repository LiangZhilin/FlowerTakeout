<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
	 <jsp:include page="/common/head.jsp"></jsp:include>
<script type="text/javascript">

//重置按钮，将输入框全部设置为空
function doReset()
{
$("#username").val("");
$("#password").val("");
$("#confirm").val("");
$("#tel").val("");
$("#email").val("");
$("#remark").val("");
}

//确定按钮，判断
function doConfirm()
{
var r= /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;//正则表达式，判断邮箱格式
if($("#username").val().trim()=="")
{
layer.alert("请输入用户名，用户名不能为空！", {icon: 6});
return false;
}
if($("#password").val()=="")
{
layer.alert("请输入密码，密码不能为空！", {icon: 6});
return false;
}
if($("#confirm").val()=="")
{
layer.alert("请输入确认密码，确认密码不能为空！", {icon: 6});
return false;
}
if($("#confirm").val()!=$("#password").val())
{
layer.alert("两次输入密码不同，请重新设置密码！", {icon: 6});
return false;
}
if($("#tel").val().trim()=="")
{
layer.alert("请输入联系电话，联系电话不能为空！", {icon: 6});
return false;
}
if($("#email").val().trim()=="")
{
layer.alert("请输入邮箱，邮箱不能为空！", {icon: 6});
return false;
}

if(r.test(email.value)!=true && $("#email").val().trim()!="")
{
layer.alert("邮箱格式不对，请重新输入！", {icon: 6});
return false;
}
alert("dsge");
$.ajax({
		url:"<%=path%>/SSHLogin/save",
		data: {"user.FUsername":$("#username").val(),"user.FPassword":$("#password").val(),"user.FTel": $("#tel").val(),"user.FEmail":$("#email").val()},
		success : function(data) {
		if(data=="success")
		{
			layer.alert("注册成功，请登录~", {icon: 6});
			var url="<%=path %>/login.jsp/"
			window.location.href=url;
		}
		else
		layer.alert("注册失败，请重新注册~", {icon: 6});
		}
	});
return true;

}
</script> 
</head>
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
        <li><a href="index.jsp">首页</a></li>
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
  <body>
  <div align="center" >
  <label id="usernameLabel" >用户名：</label><input style="width: 427px;"type="text" id="username"><br><br>
  <label id="passwordLabel" >密码：</label><input style="width: 427px;" type="password" id="password"><br><br>
  <label id="confirmLabel">确认密码：</label><input style="width: 427px;" type="password" id="confirm"><br><br>
  <label id="telLabel">电话：</label><input style="width: 427px;" type="text" id="tel"><br><br>
  <label id="emailLabel">邮箱：</label><input style="width: 427px;" type="text" id="email"><br><br>
  <label id="remarkLabel">备注：</label><textarea style="width: 427px;" rows="3" cols="20"></textarea>
 <input type="button" value="确定" onclick="return doConfirm()"/>
 <input type="button" value="重置" onclick="doReset()">
  </div>
  </body>
</html>
