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

<title>用户管理</title>
<jsp:include page="/common/head.jsp"></jsp:include>
<script type="text/javascript">
var page;
 var s="";
$(document).ready(function() {
	doUsermanage();
	});
function doUsermanage()
{
	$.ajax({
	url:"<%=path%>/initUserDemo.action",
			type : "post",
			dataType : "json",
			data : {
				"firstIdex" : 0
			},
			success : function(data) {
			page=data;
				//console.log(data);
				$("#thead").empty();
				//$("#pan").empty();
				//$("#pan").append("<div><button onclick='addUser()'>添加</button><button onclick='delUser()'>删除</button><button onclick='return update() '>编辑</button></div>");
				$("#thead").append("<tr><th></th><th style='width='100px'' >用户ID</th><th style='text-align: center;width='200px''>用户名</th><th style='text-align: center;width='200px''>真实名</th><th style='text-align: center;width='200px''>性别</th><th style='text-align: center;width='200px''>密码</th><th style='text-align: center;width='200px''>手机号码</th><th style='text-align: center;width='200px''>电子邮箱</th><th style='text-align: center;width='200px''>角色</th></tr>")
				for(var i=0;i<data.length;i++)
				$("#thead").append("<tr><th><input type='checkbox' name='test' value='"+data[i].uId+"' /></th><td id="+data[i].uId+"style='width='100px'' onmouseup='return delUser()'>"+data[i].uId+"</td><td style='text-align: center;width='200px''>"+data[i].username+"</td><td style='text-align: center;width='200px''>"+data[i].realname+"</td><td style='text-align: center;width='200px''>"+data[i].sex+"</td><td style='text-align: center;width='200px''>"+data[i].password+"</td><td style='text-align: center;width='200px''>"+data[i].mobile+"</td><td style='text-align: center;width='200px''>"+data[i].email+"</td><td style='text-align: center;width='200px''>"+data[i].rid+"</td></tr>")
				//$("#button").append( "<div style='margin-top:400px;padding-top:100px'><input style='margin-left:10px' type='button' value='上一页' onclick='return doTop(\"search\")'><input style='margin-left:10px' type='button' value='下一页' onclick='return doNext(\"search\")'></div>");
			//alert(data[4].rid.text)
			}
		});
	}
	
	
	//确定添加
	function doConfrim()
	{
	
	var username=$("#username").val();
	var realname=$("#realname").val();
	var sex=$("#sex").val();
	var password=$("#password").val();
	var mobile=$("#mobile").val();
	var email=$("#email").val();
	var rid=$("#rid").val();
	if(username==null||username=="")
	{
	alert("请输入用户名~");
	return false;
	}
	if(realname==null||realname=="")
	{
	alert("请输入真实名字~");
	return false;
	}
	if(sex==null||sex=="")
	{
	alert("请输入性别~");
	return false;
	}
	if(password==null||password=="")
	{
	alert("请输入密码~");
	return false;
	}
	if(mobile==null||mobile=="")
	{
	alert("请输入用户联系电话~");
	return false;
	}
	if(rid==null||rid=="")
	{
	alert("请输入角色~");
	return false;
	}
	alert("sgseddddddddddd");
 $.ajax({
	url:"<%=path%>/addUser.action",
			dataType : "json",
			type : "post",
			data : {
				"user.username" : username,
				"user.realname" : realname,
				"user.sex" : sex,
				"user.password" : password,
				"user.mobile" : mobile,
				"user.email" : email,
				"user.rid" : rid
			},
			success : function(data) {
				console.log(data);
				alert(data);
				if (data.success == "添加成功") {
					alert("添加成功~");
					doCancel();
					return true;
				} else {
					alert("添加失败~");
					return false;
				}
			}
		});

	}
	
	//取消
	function doCancel() {

		var username = $("#username").val("");
		var realname = $("#realname").val("");
		var sex = $("#sex").val("");
		var password = $("#password").val("");
		var mobile = $("#mobile").val("");
		var email = $("#email").val("");
		var rid = $("#rid").val("");
	}
	
	//删除
	function delUser() {
		 var v = new Array();
		 v= document.getElementsByName('test');
		  for(var i = 0; i < v.length; i++) {
		  if(v[i].checked)
		  {
		  s+=v[i].value+",";
		  }
		  }
		  if(s=="")
		  {
		  alert("请选择数据删除");
		  return false;
		  } 
		   var r=confirm("确定删除？");
		   if(r)
		   {
		    st=s.substr(0,s.length-1);
		    alert(st);
			 $.ajax({
	url:"<%=path%>/delUser.action",
				dataType : "json",
				type : "post",
				data : {
					"st" : st
				},
				success : function(data) {
					console.log(data);
					alert(data);
					if (data.success == "删除成功") {
						alert("删除成功~");
						doCancel();
						return true;

					} else {
						alert("删除失败~");
						return false;
					}
				}

			});
		}

	}
	//编辑
	function updateUser() {
		var count = 0;
		var v = new Array();

		v = document.getElementsByName('test');
		for (var i = 0; i < v.length; i++) {
			if (v[i].checked) {
				count++;
				s = s + v[i].value;
			}
		}
		if (count == "") {
			alert("请选择数据删除");
			return false;
		}

		if (count > 1) {
			alert("请只选择一条数据进行修改~");
			for (var i = 0; i < v.length; i++) {
				v[i].checked = false;
			}
			return false;
		}
		alert(s);
		$.ajax({
			url : "<%=path%>/initUpdateUser.action",
			dataType : "json",
			type : "post",
			data : {"updateid" : s},
			success : function(data) {
			console.log(data);
				 $("#updateusername").val(data[0].username);
				 $("#updaterealname").val(data[0].realname);
				 $("#updatesex").val(data[0].sex);
				$("#updatepassword").val(data[0].password);
				$("#updatemobile").val(data[0].mobile);
				$("#updateemail").val(data[0].email);
				 $("#updaterid").val(data[0].rid);
				 $('#detailmodal').modal('show');
			/* 	 $("#button1").attr("data-toggle","modal");
				 $("#button1").attr("data-target","#detailmodal"); */
				 return true;
			}

		});
		  
		
	}
	
	//确定更新
	function doUpdateConfrim()
	{
	
	var username=$("#updateusername").val();
	var realname=$("#updaterealname").val();
	var sex=$("#updatesex").val();
	var password=$("#updatepassword").val();
	var mobile=$("#updatemobile").val();
	var email=$("#updateemail").val();
	var rid=$("#updaterid").val();
	if(username==null||username=="")
	{
	alert("请输入用户名~");
	return false;
	}
	if(realname==null||realname=="")
	{
	alert("请输入真实名字~");
	return false;
	}
	if(sex==null||sex=="")
	{
	alert("请输入性别~");
	return false;
	}
	if(password==null||password=="")
	{
	alert("请输入密码~");
	return false;
	}
	if(mobile==null||mobile=="")
	{
	alert("请输入用户联系电话~");
	return false;
	}
	if(rid==null||rid=="")
	{
	alert("请输入角色~");
	return false;
	}
	alert("sgseddddddddddd");
 $.ajax({
	url:"<%=path%>/updateUser.action",
			dataType : "json",
			type : "post",
			data : {
			"user.uId":s,
				"user.username" : username,
				"user.realname" : realname,
				"user.sex" : sex,
				"user.password" : password,
				"user.mobile" : mobile,
				"user.email" : email,
				"user.rid" : rid,
				
			},
			success : function(data) {
				console.log(data);
				alert(data);
				if (data.success == "更新成功") {
					alert("更新成功~");
					 $('#detailmodal').modal('hide');
					 doUsermanage();
					return true;
				} else {
					alert("更新失败~");
					return false;
				}
			}
		});

	}
	
</script>
</head>

<body>
	<div>
		<jsp:include page="/common/navigation.jsp"></jsp:include>
	</div>
	<div></div>

	<div class="main-content" width="100%">
		<div
			style="width: 1450px;margin: auto;margin-top: 0px;padding-top: 0px">
			<div class="panel panel-info" style="width:100%;">
				<div class="panel-heading">
					<h3 class="panel-title">用户信息</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered">
						<caption>
							<div class="btn-group" role="group" aria-label="...">
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#myModal" style="height: 32px"
									onclick="return addUser()">添加</button>
								<button type="button" class="btn btn-default"
									onclick="return delUser()">删除</button>
								<button id="button1"type="button" class="btn btn-default" 
									onclick="return updateUser()" >修改</button>
							</div>

						</caption>
						<thead id="thead">
							<tr>
							
						</thead>

						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- Button trigger modal -->
		<!-- 添加学生模态框 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加信息</h4>
					</div>
					<!--输入框组 -->
					<div class="modal-body">
						<div class="input-group input-group-lg" style="padding-top: 10px">
							<span class="input-group-addon">用户名</span> <input type="text"
								class="form-control" placeholder="请输入用户名"
								aria-describedby="sizing-addon1" id="username">
						</div>
						<div class="input-group input-group-lg" style="padding-top: 10px">
							<span class="input-group-addon">真实姓名</span> <input type="text"
								class="form-control" placeholder="请输入真实"
								aria-describedby="sizing-addon1" id="realname">
						</div>
						<div class="input-group input-group-lg" style="padding-top: 10px">
							<span class="input-group-addon">性别</span> <input type="text"
								class="form-control" placeholder="请输入性别"
								aria-describedby="sizing-addon1" id="sex">
						</div>
						<div class="input-group input-group-lg" style="padding-top: 10px">
							<span class="input-group-addon">密码</span> <input type="text"
								class="form-control" placeholder="请输入密码"
								aria-describedby="sizing-addon1" id="password">
						</div>

						<div class="input-group input-group-lg" style="padding-top: 10px">
							<span class="input-group-addon">手机号码</span> <input type="text"
								class="form-control" placeholder="请输入手机号码"
								aria-describedby="sizing-addon1" id="mobile">
						</div>
						<div class="input-group input-group-lg" style="padding-top: 10px">
							<span class="input-group-addon">邮箱</span> <input type="text"
								class="form-control" placeholder="请输入邮箱"
								aria-describedby="sizing-addon1" id="email">
						</div>
						<div class="input-group input-group-lg" style="padding-top: 10px">
							<span class="input-group-addon">角色</span> <input type="text"
								class="form-control" placeholder="请输入角色"
								aria-describedby="sizing-addon1" id="rid">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary"
							onclick="return doConfrim()">添加</button>
					</div>
				</div>
			</div>
		</div>
		<!--详细信息modal框 -->
		<div class="modal fade" id="detailmodal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改信息</h4>
					</div>
					<div style="margin-left: 10px">
						<div style="margin: 10px">
							<h3>
								<span class="label label-default">用户名</span> 
								<input id="updateusername"></input>
							</h3>
						</div>
						<div style="margin: 10px">
							<h3>
								<span class="label label-default">真实名</span>
								<input id="updaterealname"></input>
							</h3>
						</div>
						<div style="margin: 10px">
							<h3>
								<span class="label label-default">性别</span> 
								<input id="updatesex"></input>
							</h3>
						</div>
						<div style="margin: 10px">
							<h3>
								<span class="label label-default">密码</span>
								<input  id="updatepassword"></input>
							</h3>
						</div>

						<div style="margin: 10px">
							<h3>
								<span class="label label-default">电话</span> 
								<input id="updatemobile"></input>
							</h3>
						</div>
						<div style="margin: 10px">
							<h3>
								<span class="label label-default">邮箱</span> 
								<input  id="updateemail"></input>
							</h3>
						</div>
						<div style="margin: 10px">
							<h3>
								<span class="label label-default">角色</span>  
								<input id="updaterid"></input>
							</h3>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" onclick=" return doUpdateConfrim()">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"  onclick="return  doCancel()">取消</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
