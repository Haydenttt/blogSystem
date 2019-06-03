<%--
  Created by IntelliJ IDEA.
  User: 时尚
  Date: 2019/5/29
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
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
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
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
                        <li class="nav-item active"><a class="nav-link" href="<%=basePath %>/homepage.jsp" style="font-family: 微软雅黑;">首页</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false" style="font-family: 微软雅黑;">分类</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=政治经济" style="font-family: 微软雅黑;">政治经济</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=科技" style="font-family: 微软雅黑;">科技</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=体育" style="font-family: 微软雅黑;">体育</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=健康" style="font-family: 微软雅黑;">健康</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=旅游" style="font-family: 微软雅黑;">旅游</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/success.jsp" style="font-family: 微软雅黑;">统计</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/MineServlet?username=<%=request.getSession().getAttribute("username") %>&category=all" style="font-family: 微软雅黑;">
                            我的博客</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/follow.jsp" style="font-family: 微软雅黑;">博客收藏</a></li>
                    </ul>
                    <ul id="isLoggedIn" class="nav navbar-nav navbar-right header_social ml-auto">
                        <li class="nav-item"><a href="<%=basePath %>/login.jsp" style="font-family: 微软雅黑;"></i>登录/注册</a></li>
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
    <section class="blog_area" style="margin-top: 80px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-9" style="margin-bottom: 80px;">
                    <div class="blog_left_sidebar">
                        <div class="secondtitle">
                            <h3 style="margin-bottom: 30px;">${title}</h3>
                        </div>
                        <%--    左侧博客列表    --%>
                        <div class="row">
                            <c:forEach items="${blogList}" var="blog">
                                <div class="col-md-6" style="padding-bottom: 15px;">
                                    <div class="blog_style1 small">
                                        <div class="blog_img" >
                                            <img class="img-fluid" src="${blog.coverImageUrl}" style="width:420px;height: 425px;">
                                        </div>
                                        <div class="blog_text">
                                            <div class="blog_text_inner" style="margin-top: -380px;opacity: 0.9;padding-top: 30px;padding-bottom: 30px;">
                                                <a href="<%=basePath%>/indexComment?username=${username}&id=${blog.id}"><h4 style="width:260px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${blog.title}</h4></a>
                                                <fmt:formatDate value="${blog.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                                <div style="position: relative;margin-bottom: 0px;width:260px;height: 150px;line-height:25px;overflow:hidden;text-overflow: ellipsis;">
                                                        ${blog.content}
                                                </div>
                                                <div class="button-group-area mt-10" style="margin-top: 10px;display: flex; justify-content: space-around;">
                                                    <a class="genric-btn success-border circle" href="<%=basePath%>/blogedit?username=${username}&id=${blog.id}" style="font-size: 13px">编&nbsp;辑</a>
                                                    <a class="genric-btn danger-border circle" onclick="deleteDraft(${blog.id})" style="font-size: 13px">删&nbsp;除</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <%--    右侧分类    --%>
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
<!--================ start footer Area  =================-->
<footer class="footer-area p_120">
    <div class="container">
        <div class="row">
            <div class="col-lg-3  col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h6 class="footer_title">About Us</h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                        labore dolore magna aliqua.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h6 class="footer_title">Newsletter</h6>
                    <p>Stay updated with our latest trends</p>
                    <div id="mc_embed_signup">
                        <%--<form target="_blank"--%>
                        <%--action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"--%>
                        <%--method="get" class="subscribe_form relative">--%>
                        <%--<div class="input-group d-flex flex-row">--%>
                        <%--<input name="EMAIL" placeholder="Email Address" onfocus="this.placeholder = ''"--%>
                        <%--onblur="this.placeholder = 'Email Address '" required="" type="email">--%>
                        <%--<button class="btn sub-btn"><span class="lnr lnr-arrow-right"></span></button>--%>
                        <%--</div>--%>
                        <%--<div class="mt-10 info"></div>--%>
                        <%--</form>--%>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-footer-widget instafeed">
                    <h6 class="footer_title">Instagram Feed</h6>
                    <ul class="list instafeed d-flex flex-wrap">
                        <li><img src="<%=basePath %>/img/instagram/Image-01.jpg" alt=""></li>
                        <li><img src="<%=basePath %>/img/instagram/Image-02.jpg" alt=""></li>
                        <li><img src="<%=basePath %>/img/instagram/Image-03.jpg" alt=""></li>
                        <li><img src="<%=basePath %>/img/instagram/Image-04.jpg" alt=""></li>
                        <li><img src="<%=basePath %>/img/instagram/Image-05.jpg" alt=""></li>
                        <li><img src="<%=basePath %>/img/instagram/Image-06.jpg" alt=""></li>
                        <li><img src="<%=basePath %>/img/instagram/Image-07.jpg" alt=""></li>
                        <li><img src="<%=basePath %>/img/instagram/Image-08.jpg" alt=""></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6">
                <div class="single-footer-widget f_social_wd">
                    <h6 class="footer_title">Follow Us</h6>
                    <p>Let us be social</p>
                    <div class="f_social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-dribbble"></i></a>
                        <a href="#"><i class="fa fa-behance"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row footer-bottom d-flex justify-content-between align-items-center">
            <p class="col-lg-12 footer-text text-center">
                Copyright &copy;
                <script>document.write(new Date().getFullYear());</script>
                All rights reserved | Blog System Made By <strong>Group 8</strong>
                <a target="_blank" style="color: coral;"><br/> 李婉茹 | 刘沛 | 黄小明 | 李帅 | 时尚 | 唐隆基 | 刘杰</a>
            </p>
        </div>
    </div>
</footer>
<!--================ End footer Area  =================-->
    <script>
        function deleteDraft(id){
            console.log(id);
            var bool=confirm("是否删除？");
            if(bool){
                location.href="<%=basePath%>/DeleteDraftServlet?id="+id+"&username=${username}";
            }
        }
    </script>
<script src="<%=basePath %>/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath %>/js/popper.js"></script>
<script src="<%=basePath %>/js/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/stellar.js"></script>
<script src="<%=basePath %>/vendors/lightbox/simpleLightbox.min.js"></script>
<script src="<%=basePath %>/vendors/nice-select/js/jquery.nice-select.min.js"></script>
<script src="<%=basePath %>/vendors/isotope/imagesloaded.pkgd.min.js"></script>
<script src="<%=basePath %>/vendors/isotope/isotope-min.js"></script>
<script src="<%=basePath %>/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="<%=basePath %>/vendors/jquery-ui/jquery-ui.js"></script>
<script src="<%=basePath %>/js/jquery.ajaxchimp.min.js"></script>
<script src="<%=basePath %>/js/mail-script.js"></script>
<script src="<%=basePath %>/js/theme.js"></script>
<script src="<%=basePath %>/js/common.js"></script>
<script>
    $(document).ready(function () {
            isLoggedIn()
        }
    )

    function isLoggedIn() {
        var username = "<%=request.getSession().getAttribute("username") %>";
        if (!isEmpty(username)) {
            $("#isLoggedIn").html('<li class="nav-item"><a href="<%=basePath %>/edit.jsp">'+'欢迎你，' + username + '</a></li>');
        }
        ;
    }
</script>
</body>
</html>