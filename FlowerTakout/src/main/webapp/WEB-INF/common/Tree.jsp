<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script type="text/javascript" src="../chajian/tree/js/jjs_jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../chajian/tree/js/jjs_menu_min.js"></script>
		<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<link rel="stylesheet" href="<%=path %>/bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path %>/bootstrap/css/bootstrap-theme.min.css" type="text/css"></link>
	<script type="text/javascript" src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/display.css" type="text/css"></link>
		<script type="text/javascript" src="js/layer/layer.js"></script>
<link rel="stylesheet" href="../chajian/tree/css/ccs_style.css" type="text/css"></link>
<link rel="stylesheet" href="../chajian/tree/css/ccs_menu-css.css" type="text/css"></link>

  <script type="text/javascript">
//  $(document).ready(function (){
//  $(".menu ul li").menu();
//});
  </script>

    <div id="content" style="background-color: white" >
    <div class="menu" style="background-color: white" >
        <ul>
        <li><a class="active" href="#">一流资源网</a>
            <ul style="display: block;">
                <li><a href="#">Subitem 1</a></li>
                <li><a href="#">Subitem 2</a>
                    <ul>
                        <li><a href="#">Subitem 1</a></li>
                        <li><a href="#">Subitem 2</a></li>
                        <li><a href="#">Subitem 3</a></li>
                        <li><a href="#">Subitem 4</a></li>
                    </ul>
                </li>
                <li><a href="#">Subitem 3</a></li>
                <li><a href="#">Subitem 4</a>
                    <ul>
                        <li><a href="#">Subitem 1</a></li>
                        <li><a href="#">Subitem 2</a></li>
                    </ul>
                </li>
                <li><a href="#">Subitem 5</a></li>
            </ul>
        </li>
        <li><a href="#">Item 2</a>
            <ul>
                <li><a href="#">Subitem 1</a></li>
                <li><a href="#">Subitem 2</a></li>
                <li><a href="#">Subitem 3</a></li>
                <li><a href="#">Subitem 4</a></li>
            </ul>
        </li>
        <li><a href="#">Item 3</a>
            <ul>
                <li><a href="#">Subitem 1</a></li>
                <li><a href="#">Subitem 2</a></li>
                <li><a href="#">Subitem 3</a></li>
                <li><a href="#">Subitem 4</a></li>
                <li><a href="#">Subitem 5</a></li>
                <li><a href="#">Subitem 6</a></li>
            </ul>
        </li>
        <li><a href="#">Item without subitems</a></li>
        <li><a href="#">Item without subitems</a></li>
    </ul>
    </div>
</div>


