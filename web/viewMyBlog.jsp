<%--
  Created by IntelliJ IDEA.
  User: 时尚
  Date: 2019/5/27
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/linericon/style.css">
    <link rel="stylesheet" href="<%=basePath %>/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/lightbox/simpleLightbox.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/animate-css/animate.css">
    <!-- main css -->
    <link rel="stylesheet" href="<%=basePath %>/css/style.css">
    <link rel="stylesheet" href="<%=basePath %>/css/responsive.css">
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
<!--================Blog Area =================-->
        <section class="blog_area p_100 " style="margin-top: 0px;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="blog_left_sidebar">
                            <div class="secondtitle" style="margin-bottom: 10px">
<%--                                <h3 style="margin-bottom: 40px;">热爱生活，热爱大自然</h3>--%>
                                <a href="#" style="text-align: center"><h4>${bvenDemo.getTitle()}</h4></a>
                                <%--                                                    <fmt:formatDate value="${blog.create_time}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></a>&nbsp;&nbsp;--%>
                                <i class="fa fa-comments-o" aria-hidden="true">浏览量：</i>&nbsp;188
                                <i class="fa fa-thumbs-o-up " aria-hidden="true">关注：</i>&nbsp;99
                            </div>
                            <%--    左侧博客列表    --%>
                            <div class="row">

                                    <div class="col-md-11" style="padding-bottom: 15px;">
                                        <div class="blog_style1 small">
                                            <div class="blog_img" >
                                                <img class="img-fluid" src="img/04-01.jpg" style="object-fit:fill; width:750px;height: 470px;">
                                            </div>
<%--&lt;%&ndash;                                            <div class="blog_text">&ndash;%&gt;${bvenDemo.getCoverImageUrl()}--%>
<%--                                                <div class="blog_text_inner" style="margin-top: -455px;opacity: 0.9;padding-top: 30px;padding-bottom: 30px;">--%>
<%--                                                    <a href="#"><h4>${bvenDemo.getTitle()}</h4></a>--%>
<%--&lt;%&ndash;                                                    <fmt:formatDate value="${blog.create_time}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></a>&nbsp;&nbsp;&ndash;%&gt;--%>
<%--                                                    <i class="fa fa-comments-o" aria-hidden="true"></i>&nbsp;88--%>
<%--                                                    <i class="fa fa-thumbs-o-up " aria-hidden="true"></i>&nbsp;99--%>
<%--&lt;%&ndash;                                                    <div class="button-group-area mt-10">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a class="genric-btn success-border circle" href="">&nbsp;Edit&nbsp;</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a class="genric-btn danger-border circle" onclick="deleteFt(${blog.id})">Delete</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>

                            </div>

                        </div>
                    </div>
                    <%--    右侧分类    --%>
                    <div class="row"></div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget post_category_widget">
                                <h4 class="widget_title"><a href="#">Categories</a></h4>
                                <ul class="list cat-list">
                                    <li><a href="#" class="d-flex justify-content-between"><p>政治经济</p></a></li>
                                    <li><a href="#" class="d-flex justify-content-between"><p>科技</p></a></li>
                                    <li><a href="#" class="d-flex justify-content-between"><p>体育</p></a></li>
                                    <li><a href="#" class="d-flex justify-content-between"><p>健康</p></a></li>
                                    <li><a href="#" class="d-flex justify-content-between"><p>旅游</p></a></li>
                                </ul>
                            </aside>
                            <aside class="single_sidebar_widget post_category_widget">
                                <h4 class="widget_title" style="margin-top: 30px;"><a href="#">Operation</a></h4>
                                <div class="button-group-area mt-10">
                                    <a href="#" class="genric-btn info-border circle arrow">新建博文<span class="lnr lnr-arrow-right"></span></a>
                                    <a href="#" class="genric-btn info-border circle arrow">&nbsp;草稿箱&nbsp;<span class="lnr lnr-arrow-right"></span></a>
                                </div>
                            </aside>
                        </div>
                    </div>
                </div>
                <p class="col-md-7" style=" word-wrap: break-word;  word-break: break-all;  overflow: hidden;">${bvenDemo.getContent()}</>

                <div class="row">
                    <form class="col-md-12" action="<%=basePath%>/ViewControl" method="get">
                        <div class="row bootstrap snippets">
                            <div class="col-md-7 col-md-offset-2 col-sm-12">
                                <div class="comment-wrapper">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            Comment panel<input name="viewButton" value="${bvenDemo.getId()}" style="display:none"></input>
                                        </div>
                                        <div class="panel-body">
                                            <textarea class="form-control" placeholder="write a comment..." rows="3" name="commentText"></textarea>
                                            <br>
                                            <button type="submit" class="btn btn-info pull-right">发表评论</button>
                                            <div class="clearfix"></div>
                                            <hr>
                                            <%--                        历史评论内容--%>

                                            <ul class="media-list">
                                                <c:forEach var="comList" items="${commentList}">
                                                    <li class="media">

                                                        <a href="#" class="pull-left">
                                                            <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
                                                        </a>

                                                        <div class="media-body">
                                                                <span class="text-muted pull-right">
                                                                    <small class="text-muted">${comList.createTime}</small>
                                                                </span>
                                                            <strong class="text-success">${comList.commentator}@MartinoMont</strong>
                                                            <p>
                                                                    ${comList.commentBody}
                                                            </p>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    <script>
        function deleteFt(id){
            var bool=confirm("是否删除？");
            if(bool){
                location.href="/ideablog/DeleteBlogServlet?id="+id+"&username=${username}&category=${category}";
            }
        }
    </script>
</body>
</html>
