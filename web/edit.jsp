<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.unicom.entity.*" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()
            +":"+request.getServerPort()+"/"+request.getContextPath();
%>
<%
    User user=new User();

    String username=request.getParameter("username");

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- 重置文件 -->
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style2.css">
    <link rel="stylesheet" href="css/_header.scss" type='text/css' />
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <title>修改</title>
</head>
<body style="background: #f3f3f3">
<!--================Header Menu Area =================-->
<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container box_1620">
                <!-- Brand and toggle get grouped for better mobile display -->
                <!-- <a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> -->
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav">
                        <li class="nav-item active"><a class="nav-link" href="index.jsp">首页</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">分类</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=政治经济">政治经济</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=科技">科技</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=体育">体育</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=健康">健康</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=旅游">旅游</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/success.jsp">统计</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/viewMyBlog.jsp">我的博客</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/subscribe.html">我的关注</a></li>
                    </ul>
                    <ul id="isLoggedIn" class="nav navbar-nav navbar-right header_social ml-auto">
                        <li class="nav-item"><a href="<%=basePath %>/login.jsp"></i>登录/注册</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <%--<div class="logo_part">--%>
        <%--<div class="container">--%>
            <%--<h1 class="logo">欢迎使用第八组的博客</h1>--%>
            <%--<!-- <a class="logo" href="#"><img src="img/logo.png" alt=""></a> -->--%>
        <%--</div>--%>
    <%--</div>--%>
</header>
<!--================Header Menu Area =================-->
<div class="reg_div" style="background: #A3B4DC">
    <p>修改用户信息</p>

    <form action ="<%=basePath%>/UserEditServlet" method="get">
        <ul class="reg_ul" style="list-style-type:none">
            <li>
                <span>用户名：</span>
                <input type="text" readonly value="<%=username%>" name="user" placeholder="请修改用户名" class="reg_user">
                <span class="tip user_hint"></span>
            </li>
            <li>
                <span>密码：</span>
                <input type="password" value="" name="password" placeholder="请修改密码" class="reg_password">
                <span class="tip password_hint"></span>
            </li>
            <li>
                <span>昵称：</span>
                <input type="password" name="nickname" value="" placeholder="请修改昵称" class="reg_confirm">
                <span class="tip confirm_hint"></span>
            </li>
            <!--     <li>
                    <span>邮箱：</span>
                    <input type="text" name="" value="" placeholder="邮箱" class="reg_email">
                    <span class="tip email_hint"></span>
                </li>
                <li>
                    <span>手机号码：</span>
                    <input type="email" name="" value="" placeholder="手机号" class="reg_mobile">
                    <span class="tip mobile_hint"></span>
                </li> -->
            <li>
                <button type="submit" name="button" class="red_button">确认修改</button>
            </li>
        </ul>
    </form>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<div style="text-align:center;">

</div>
</body>
</html>
