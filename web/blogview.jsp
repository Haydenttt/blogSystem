<%--
  Created by IntelliJ IDEA.
  User: Unicom
  Date: 2019/5/26
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.unicom.entity.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()
            +":"+request.getServerPort()+request.getContextPath();
%>
<html>

<head>
    <title>Title</title>
    <style>
        table{border-right:1px solid #00b7ee;border-bottom:1px solid #00b7ee;margin: 0 auto}
        td{border-left:1px solid #00b7ee;border-top:1px solid #00b7ee}
    </style>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="vendors/linericon/style.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css">
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="vendors/animate-css/animate.css">
    <!-- main css -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>
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
                            <li class="nav-item active"><a class="nav-link" href="index.html">首页</a></li>
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false">分类</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="<%=basePath %>/single-blog.html">分类一</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="<%=basePath %>/elements.html">分类二</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="<%=basePath %>/elements.html">分类三</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="<%=basePath %>/elements.html">分类四</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="<%=basePath %>/elements.html">分类五</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="<%=basePath %>/elements.html">分类六</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="<%=basePath %>/statistics.html">统计</a></li>
                            <li class="nav-item"><a class="nav-link" href="<%=basePath %>/myblog.html">我的博客</a></li>
                            <li class="nav-item"><a class="nav-link" href="<%=basePath %>/subscribe.html">我的关注</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right header_social ml-auto">
                            <li class="nav-item"><a href="<%=basePath %>/login.html"></i>登录</a></li>
                            <li class="nav-item"><a href="<%=basePath %>/regist.html"></i>注册</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <%--显示区容器--%>
    <div>
        <section class="blog_area" style="margin-top: -65px">
            <div class="container">
                <div class="row"  style="margin-bottom: 80px;">
                    <div class="col-lg-9" style="background:rgb(249,249,255);width: 100% ">
                        <div style="display: flex;height: auto;width: 100%">
                            <div style="width: 350%;margin-left: 20px;margin-top: 20px;height: auto;">
                                <center>
                                    <h2>${title}</h2>
                                </center>

                            </div>
                            <div style="margin-top: 20px;margin-right: 10px;">
                                <form action="${pageContext.request.contextPath}/blogedit" method="get">
                                    <input type="hidden" name="username" value="${username}">
                                    <input type="hidden" name="id" value="${id}" >
                                    <button type="submit" class="btn btn-primary">编辑</button>
                                </form>
                            </div>
                            <div style="margin-top: 20px;margin-right: 10px;">
                                    <form action="${pageContext.request.contextPath}/PublishBlog">
                                        <input type="hidden" name="id" value="${id}" >
                                        <input type="hidden" name="username" value="${username}">
                                        <input type="hidden" name="category" value="${category_name}">
                                        <button type="submit" class="btn btn-primary">发布</button>
                                    </form>
                                </div>
                            <div style="margin-top: 20px;margin-right: 60px;">
                                <a href="<%=basePath%>/MineServlet?username=${username}&category=all" type="submit" class="btn btn-primary">取消</a>
                            </div>
                        </div>
                        <div style="width: 95%;margin: 0 auto;">
                            <center>
                                <label>时间：${create_time} |</label>
                                <label>分类：${category_name} |</label>
                                <label>作者：${nickname} |</label>
                                <label>点击量：${views} </label>
                            </center>
                        </div>
                        <div style="width: 98%;margin: 0 auto">
                                <p style="word-break: break-word">${content}</p>
                            </div >
                    </div>
                    <div class="col-lg-3" style="width: 10%">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget post_category_widget">
                                <h4 class="widget_title"><a href="<%=basePath%>/MineServlet?username=${username}&category=all">博客分类</a></h4>
                                <ul class="list cat-list">
                                    <li><a href="<%=basePath%>/MineServlet?username=${username}&category=政治经济" class="d-flex justify-content-center" style=" font-weight: bold;"><p>政治经济</p></a></li>
                                    <li><a href="<%=basePath%>/MineServlet?username=${username}&category=科技" class="d-flex justify-content-center" style=" font-weight: bold;"><p>科技</p></a></li>
                                    <li><a href="<%=basePath%>/MineServlet?username=${username}&category=体育" class="d-flex justify-content-center" style=" font-weight: bold;"><p>体育</p></a></li>
                                    <li><a href="<%=basePath%>/MineServlet?username=${username}&category=健康" class="d-flex justify-content-center" style=" font-weight: bold;"><p>健康</p></a></li>
                                    <li><a href="<%=basePath%>/MineServlet?username=${username}&category=旅游" class="d-flex justify-content-center" style=" font-weight: bold;"><p>旅游</p></a></li>
                                </ul>
                            </aside>
                            <br>
                            <aside class=" post_category_widget">
                                <div class="button-group-area mt-10" style="display: flex; justify-content: center">
                                    <a href="<%=basePath%>/blogedit?username=${username}" class="genric-btn info-border circle arrow">新建博文<span class="lnr lnr-arrow-right"></span></a>
                                </div>
                                <div class="button-group-area mt-10" style="display: flex; justify-content: center">
                                    <a href="<%=basePath%>/DraftServlet?username=${username}" class="genric-btn info-border circle arrow">&nbsp;草稿箱&nbsp;<span class="lnr lnr-arrow-right"></span></a>
                                </div>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>