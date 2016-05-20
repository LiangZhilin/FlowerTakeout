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
		<title>登录</title>
		<link href="css/display.css" rel=”stylesheet” type=”text/css” />
		 <jsp:include page="/common/head.jsp"></jsp:include>
		<script type="text/javascript">
		//登录页面初始化
		$(document).ready(function(){
		doCenter("center");//初始化窗口登陆居中
		createCode();//初始化校验码
		});
		
		
		//登录框居中
		function doCenter(d){
		var windowWidth=$(window).width();//获得屏幕的宽
		var windowHeight=$(window).height();//获得屏幕的高
		var Width=$("."+d).width();//获得元素的宽
		var Height=$("."+d).height();//获得元素的高
		var centerWidth=(windowWidth-Width)/2;//求居中的宽
		var centerHeight=(windowHeight-Height)/2;//求居中的高
		$("."+d).css({"left":centerWidth,"top":centerHeight});//给css的方法输入参数
		}
	
	//登录
	function doLogin()
	{
	    alert("登录");
		$.ajax({
		url:"<%=path%>/login.action",
		data: {"user.username":$("#username").val(),"user.password":$("#password").val()},
		success : function(data) {
		if(data=="用户名为空"||data=="密码为空")
		{
		//alert(data);
		layer.alert(data, {icon: 6});
		}
		var inputCode = document.getElementById("checkcode").value.toUpperCase(); //取得输入的验证码并转化为大写        
	
		if(data!="用户名为空"&&data!="密码为空")
		{
			if (inputCode.length <= 0) { //若输入的验证码长度为0  
				//alert("请输入验证码！");  
				layer.alert("请输入验证码！", {icon: 6});//则弹出请输入验证码 
			} 
			else if (inputCode != code) 
			{ //若输入的验证码与产生的验证码不一致时  
				//alert("验证码输入错误！@_@"); 
				layer.alert("验证码输入错误！@_@", {icon: 6});//则弹出验证码输入错误  
			createCode();//刷新验证码  
				document.getElementById("checkcode").value = "";//清空文本框  
			} 
			else if(inputCode == code&&data=="用户名/密码不匹配") 
			{
			layer.alert("用户名/密码不匹配", {icon: 6});
			}
			else 
			{ //输入正确时  
			layer.alert("输入正确", {icon: 6});
			var url = "<%=path%>/SSHLogin/loginSuccess";
			window.location.href=url;
			}
		}
		}
			//跳转到登录成功的界面
			//if(data=="success")
			//{
			//var url = "<%=path%>/SSHLogin/loginSuccess";
   			//window.location.href=url;
			//}
			//if(data="用户名/密码不匹配") {
			//第三种想法：弹框
			//alert(data);
			//第二种想法：在最上面提示用户名为空...
			//var ui=document.getElementById("label");
			//ui.style.display="";
			//$("#label").html(data);//提示
			//第一种想法
			//提示用户名为空
			//if(data=="用户名为空")
			//提示密码为空
			//else if(data="密码为空")
			//$("#label").html(data);
			//提示用户名/密码不匹配
			//else if(data="用户名/密码不匹配")
			//$("#label").html(data);
		//}
		
	});
	}
	
	
	
	//注册
	function doRegister()
	{
	var url = "<%=path%>/SSHLogin/register";
		window.location.href = url;
	}



	var code; //在全局定义验证码   
	//产生验证码  
      function createCode() {
		code = "";
		var codeLength = 4;//验证码的长度  
		var checkCode = document.getElementById("code");
		var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
				'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数  
		for ( var i = 0; i < codeLength; i++) {//循环操作  
			var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35）  
			code += random[index];//根据索引取得随机数加到code上  
		}
		checkCode.value = code;//把code值赋给验证码  
	}
</script>


	</head>

	</style>
	<body style="border:0px;background-image:url(image/a.jpg); background-repeat:repeat-y;background-size:100%;">
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
    	
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
   
  </div><!-- /.container-fluid -->
</nav>
		<div class="center">			
			<!-- 账号start -->
			<div style="height: 30px;">
				<div class="perL">
					<label>
						账 号：
					</label>
				</div>
				<div class="perR">
					<input type="text" name="username" id="username">
				</div>
			</div>
			<!-- 账号end -->
			<!-- 密码start -->
			<div style="height: 30px;">
				<div class="perL">
					<label>
						密 码：
					</label>
				</div>
				<div class="perR">
					<input type="password" name="password" id="password">
				</div>
			</div>
			<!-- 秘密end -->
			<!-- 校验码start -->
			<div style="height: 30px;">
				<div class="perL">
					<label>
						校验码：
					</label>
				</div>
				<div class="perR">
				<input type = "text" id = "checkcode"/>  
            <input type = "button" id="code" onclick="createCode()"/>  
				</div>
			</div>
			<!-- 校验码end -->
			<!-- 按钮start -->
			<div align="center">
				<button onclick="doLogin()">
					登录
				</button>
				<button onclick="doRegister()">
					注册
				</button>
			</div>
			<!-- 按钮end -->
		</div>
	</body>
</html>
