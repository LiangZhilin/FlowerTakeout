<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/chajian/tree/js/jjs_jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/chajian/tree/js/jjs_menu_min.js"></script>
	<link rel="stylesheet" href="<%=path %>/bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path %>/bootstrap/css/bootstrap-theme.min.css" type="text/css"></link>
	<script type="text/javascript" src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/display.css" type="text/css"></link>
		<script type="text/javascript" src="js/layer/layer.js"></script>
<link rel="stylesheet" href="<%=path %>/chajian/tree/css/ccs_style.css" type="text/css"></link>
<link rel="stylesheet" href="<%=path %>/chajian/tree/css/ccs_menu-css.css" type="text/css"></link>