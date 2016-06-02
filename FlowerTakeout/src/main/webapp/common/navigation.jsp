<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
  <div class="container-fluid" >
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="">学生管理系统</span></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="stumanage.action"  onclick="doUsermanage">学生管理</a></li>
        <li><a href="usermanage/usermanage.jsp"  onclick="doUsermanage">用户管理</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" onclick="doUsermanage">其他管理</a>
          <ul class="dropdown-menu">
            <li><a href="#">奖励管理</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">惩罚管理</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">添加管理</a></li>
          </ul>
        </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="请输入关键字">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form></li>
        <li><a href="#">欢迎您：${currentuser.realname}</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">账号<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="loginOut.action">注销</a></li>
            <li><a>我的信息</a></li>
            <li><a>修改信息</a></li>
            <li><a>修改密码</a></li>
            <li role="separator" class="divider"></li>
            <li><a>联系我们</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>