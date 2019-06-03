<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + "/" + request.getContextPath();
%>
<!doctype html>
<!doctype html>
<html lang="zh">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="<%=basePath %>/img/favicon.png" type="image/png">
    <title>博客首页</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/linericon/style.css">
    <link rel="stylesheet" href="<%=basePath %>/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/lightbox/simpleLightbox.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/animate-css/animate.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/jquery-ui/jquery-ui.css">
    <!-- main css -->
    <link rel="stylesheet" href="<%=basePath %>/css/style.css">
    <link rel="stylesheet" href="<%=basePath %>/css/responsive.css">
    <!-- 自定义css -->
    <link rel="stylesheet" href="<%=basePath %>/css/pagination.css">
    <link rel="stylesheet" href="<%=basePath %>/css/homepage.css">
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

<!--================Home Banner Area =================-->
<section class="home_banner_area">
    <div class="container">
        <div class="row">
            <div class="col-lg-5"></div>
            <div class="col-lg-7">
                <div id="topRankBlog"></div>
                <%--<div class="blog_text_slider owl-carousel">--%>
                <%--<div class="item">--%>
                <%--<div class="blog_text">--%>
                <%--<div class="cat">--%>
                <%--<a class="cat_btn" href="#">Gadgets</a>--%>
                <%--<a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>--%>
                <%--<a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>--%>
                <%--</div>--%>
                <%--<a href="#">--%>
                <%--<h4>杯子在多数时候，盛装的仅仅是半杯水，</h4>--%>
                <%--</a>--%>
                <%--<p>--%>
                <%--杯子在多数时候，盛装的仅仅是半杯水，遇见的那个人依然似乎无法填补内心的空洞，时间一点一点地过去，水也一点一点地蒸发掉，你开始觉得他越来越无法满足你的全部幻想全部期待，对望的时候，彼此的眼里充满了空洞犹疑。杯子里面的水终于全部消失。分离是如此容易的一件事，就连曾经淡淡的水痕都刹那间无影无踪。生活似乎回到了最初的样子，天依旧蓝得透心，城市依旧匆忙得落寞。只是你不明白，为什么在每一个狂欢之夜，隐藏在人群中望着烟花绽放的夜空，会一边默默地流泪，一边强作笑颜。--%>
                <%--</p>--%>
                <%--<a class="blog_btn" href="#">Read More</a>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="item">--%>
                <%--<div class="blog_text">--%>
                <%--<div class="cat">--%>
                <%--<a class="cat_btn" href="#">Gadgets</a>--%>
                <%--<a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>--%>
                <%--<a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>--%>
                <%--</div>--%>
                <%--<a href="#">--%>
                <%--<h4>Nest Protect: 2nd Gen Smoke + CO Alarm</h4>--%>
                <%--</a>--%>
                <%--<p>--%>
                <%--杯子在多数时候，盛装的仅仅是半杯水，遇见的那个人依然似乎无法填补内心的空洞，时间一点一点地过去，水也一点一点地蒸发掉，你开始觉得他越来越无法满足你的全部幻想全部期待，对望的时候，彼此的眼里充满了空洞犹疑。杯子里面的水终于全部消失。分离是如此容易的一件事，就连曾经淡淡的水痕都刹那间无影无踪。生活似乎回到了最初的样子，天依旧蓝得透心，城市依旧匆忙得落寞。只是你不明白，为什么在每一个狂欢之夜，隐藏在人群中望着烟花绽放的夜空，会一边默默地流泪，一边强作笑颜。--%>
                <%--</p>--%>
                <%--<a class="blog_btn" href="#">Read More</a>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="item">--%>
                <%--<div class="blog_text">--%>
                <%--<div class="cat">--%>
                <%--<a class="cat_btn" href="#">Gadgets</a>--%>
                <%--<a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>--%>
                <%--<a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>--%>
                <%--</div>--%>
                <%--<a href="#">--%>
                <%--<h4>Nest Protect: 2nd Gen Smoke + CO Alarm</h4>--%>
                <%--</a>--%>
                <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor--%>
                <%--incididunt ut labore.</p>--%>
                <%--<a class="blog_btn" href="#">Read More</a>--%>
                <%--</div>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
    </div>
</section>
<!--================End Home Banner Area =================-->

<!--================Blog Area =================-->
<section class="blog_area p_120">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="blog_left_sidebar">
                    <div id="blogList"></div>
                    <!-- 首页博客列表标准展示项 -->
                    <!-- <article class="blog_style1">
                        <div class="blog_img">
                            <img class="img-fluid" src="<%=basePath %>/img/home-blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog_text">
                            <div class="blog_text_inner">
                                <div class="cat">
                                    <a class="cat_btn" href="#">Gadgets</a>
                                    <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>
                                    <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>
                                </div>
                                <a href="#">
                                    <h4>Nest Protect: 2nd Gen Smoke + CO Alarm</h4>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud
                                    exercitation ullamco laboris nisi ut aliquip.</p>
                                <a class="blog_btn" href="#">Read More</a>
                            </div>
                        </div>
                    </article> -->
                    <!-- <div class="row">
                    <div class="col-md-6">
                        <article class="blog_style1 small">
                            <div class="blog_img">
                                <img class="img-fluid" src="img/home-blog/blog-small-1.jpg" alt="">
                            </div>
                            <div class="blog_text">
                                <div class="blog_text_inner">
                                    <div class="cat">
                                        <a class="cat_btn" href="#">Gadgets</a>
                                        <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>
                                    </div>
                                    <a href="single-blog.html"><h4>Nest Protect 2nd Gen Smoke CO Alarm</h4></a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua.</p>
                                    <a class="blog_btn" href="#">Read More</a>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="col-md-6">
                        <article class="blog_style1 small">
                            <div class="blog_img">
                                <img class="img-fluid" src="img/home-blog/blog-small-2.jpg" alt="">
                            </div>
                            <div class="blog_text">
                                <div class="blog_text_inner">
                                    <div class="cat">
                                        <a class="cat_btn" href="#">Gadgets</a>
                                        <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>
                                    </div>
                                    <a href="single-blog.html"><h4>Nest Protect 2nd Gen Smoke CO Alarm</h4></a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua.</p>
                                    <a class="blog_btn" href="#">Read More</a>
                                </div>
                            </div>
                        </article>
                    </div>
                </div> -->
                    <!--  <article class="blog_style1">
                        <div class="blog_img">
                            <img class="img-fluid" src="<%=basePath %>/img/home-blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog_text">
                            <div class="blog_text_inner">
                                <div class="cat">
                                    <a class="cat_btn" href="#">Gadgets</a>
                                    <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>
                                    <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>
                                </div>
                                <a href="single-blog.html">
                                    <h4>Nest Protect: 2nd Gen Smoke CO Alarm</h4>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud
                                    exercitation ullamco laboris nisi ut aliquip.</p>
                                <a class="blog_btn" href="#">Read More</a>
                            </div>
                        </div>
                    </article> -->
                    <!-- <div class="row">
                    <div class="col-md-6">
                        <article class="blog_style1 small">
                            <div class="blog_img">
                                <img class="img-fluid" src="img/home-blog/blog-small-3.jpg" alt="">
                            </div>
                            <div class="blog_text">
                                <div class="blog_text_inner">
                                    <div class="cat">
                                        <a class="cat_btn" href="#">Gadgets</a>
                                        <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>
                                    </div>
                                    <a href="single-blog.html"><h4>Nest Protect 2nd Gen Smoke CO Alarm</h4></a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua.</p>
                                    <a class="blog_btn" href="#">Read More</a>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="col-md-6">
                        <article class="blog_style1 small">
                            <div class="blog_img">
                                <img class="img-fluid" src="img/home-blog/blog-small-4.jpg" alt="">
                            </div>
                            <div class="blog_text">
                                <div class="blog_text_inner">
                                    <div class="cat">
                                        <a class="cat_btn" href="#">Gadgets</a>
                                        <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>
                                    </div>
                                    <a href="single-blog.html"><h4>Nest Protect 2nd Gen Smoke CO Alarm</h4></a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua.</p>
                                    <a class="blog_btn" href="#">Read More</a>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <article class="blog_style1 small">
                            <div class="blog_img">
                                <img class="img-fluid" src="img/home-blog/blog-small-5.jpg" alt="">
                            </div>
                            <div class="blog_text">
                                <div class="blog_text_inner">
                                    <div class="cat">
                                        <a class="cat_btn" href="#">Gadgets</a>
                                        <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>
                                    </div>
                                    <a href="single-blog.html"><h4>Nest Protect 2nd Gen Smoke CO Alarm</h4></a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua.</p>
                                    <a class="blog_btn" href="#">Read More</a>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="col-md-6">
                        <article class="blog_style1 small">
                            <div class="blog_img">
                                <img class="img-fluid" src="img/home-blog/blog-small-6.jpg" alt="">
                            </div>
                            <div class="blog_text">
                                <div class="blog_text_inner">
                                    <div class="cat">
                                        <a class="cat_btn" href="#">Gadgets</a>
                                        <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> March 14, 2018</a>
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 05</a>
                                    </div>
                                    <a href="single-blog.html"><h4>Nest Protect 2nd Gen Smoke CO Alarm</h4></a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua.</p>
                                    <a class="blog_btn" href="#">Read More</a>
                                </div>
                            </div>
                        </article>
                    </div>
                </div> -->
                    <%--<nav class="blog-pagination justify-content-center d-flex">--%>
                    <%--<ul class="pagination">--%>
                    <%--<li class="page-item">--%>
                    <%--<a href="#" class="page-link" aria-label="Previous">--%>
                    <%--<span aria-hidden="true">--%>
                    <%--<span class="lnr lnr-chevron-left"></span>--%>
                    <%--</span>--%>
                    <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="page-item"><a href="#" class="page-link">01</a></li>--%>
                    <%--<li class="page-item active"><a href="#" class="page-link">02</a></li>--%>
                    <%--<li class="page-item"><a href="#" class="page-link">03</a></li>--%>
                    <%--<li class="page-item"><a href="#" class="page-link">04</a></li>--%>
                    <%--<li class="page-item"><a href="#" class="page-link">09</a></li>--%>
                    <%--<li class="page-item">--%>
                    <%--<a href="#" class="page-link" aria-label="Next">--%>
                    <%--<span aria-hidden="true">--%>
                    <%--<span class="lnr lnr-chevron-right"></span>--%>
                    <%--</span>--%>
                    <%--</a>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <%--</nav>--%>
                </div>
                <div id="paginationNav" class="col-md-7 justify-content-center d-flex"><%--首页按钮--%>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="blog_right_sidebar">
                    <aside class="single_sidebar_widget search_widget">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="搜索博文">
                            <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i
                                            class="lnr lnr-magnifier"></i></button>
                                </span>
                        </div><!-- /input-group -->
                        <div class="br"></div>
                    </aside>
                    <aside id="topUser" class="single_sidebar_widget author_widget">
                        <!-- <img class="author_img img-fluid" src="<%=basePath %>/img/blog/author.png" alt="">
                        <h4>Charlie Barber</h4>
                        <p>Senior blog writer</p>
                        <p>Boot camps have its supporters andit sdetractors. Some people do not understand why you
                            should have to spend money on boot camp when you can get. Boot camps have itssuppor ters
                            andits detractors.</p>
                        <div class="social_icon">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-github"></i></a>
                            <a href="#"><i class="fa fa-behance"></i></a>
                        </div>
                        <div class="br"></div> -->
                    </aside>
                    <aside class="single_sidebar_widget popular_post_widget">
                        <h3 class="widget_title">最热博文</h3>
                        <div id="topBlog"></div>
                        <!-- <div class="media post_item">
                            <img src="<%=basePath %>/img/blog/popular-post/post1.jpg" alt="post">
                            <div class="media-body">
                                <a href="<%=basePath %>/blog-details.html">
                                    <h3>Space The Final Frontier</h3>
                                </a>
                                <p>02 Hours ago</p>
                            </div>
                        </div>
                        <div class="media post_item">
                            <img src="<%=basePath %>/img/blog/popular-post/post2.jpg" alt="post">
                            <div class="media-body">
                                <a href="<%=basePath %>/blog-details.html">
                                    <h3>The Amazing Hubble</h3>
                                </a>
                                <p>02 Hours ago</p>
                            </div>
                        </div>
                        <div class="media post_item">
                            <img src="<%=basePath %>/img/blog/popular-post/post3.jpg" alt="post">
                            <div class="media-body">
                                <a href="<%=basePath %>/blog-details.html">
                                    <h3>Astronomy Or Astrology</h3>
                                </a>
                                <p>03 Hours ago</p>
                            </div>
                        </div>
                        <div class="media post_item">
                            <img src="<%=basePath %>/img/blog/popular-post/post4.jpg" alt="post">
                            <div class="media-body">
                                <a href="<%=basePath %>/blog-details.html">
                                    <h3>Asteroids telescope</h3>
                                </a>
                                <p>01 Hours ago</p>
                            </div>
                        </div> -->
                        <div class="br"></div>
                    </aside>
                    <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">博文分类</h4>
                        <ul id="categoryList" class="list cat-list">
                        </ul>
                    </aside>
                </div>
            </div>
        </div>
        <div class="row">
            <div id="paginationNav1" class="col-md-7 justify-content-center d-flex"><%--首页按钮--%>
            </div>
        </div>
    </div>
</section>
<!--================Blog Area =================-->

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
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;
                <script>document.write(new Date().getFullYear());</script>
                All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by
                <a href="https://colorlib.com" target="_blank">Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
        </div>
    </div>
</footer>
<!--================ End footer Area  =================-->


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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

    var defaultBlogImg = "<%=basePath %>/img/home-blog/blog-4.jpg";//设置默认博客图片，当博客没有图片时置为默认图
    var defaultUserImg = "<%=basePath %>/img/blog/author.png";//设置默认博主头像图片，当博客没有图片时置为默认图
    var defaultTopBlogImg = "<%=basePath %>/img/blog/popular-post/post1.jpg";//设置默认热门博文图片，当博客没有图片时置为默认图

    var defaultUserDes = "个人博主";
    var defaultUserDesInfo = "该用户很懒，什么都没有写";

    $(document).ready(function () {
        blogListDisplay();
        categoryCount();
        userDisplay();
        topBlogDisplay();
        topRankBlogDisplay();
        isLoggedIn();
    });

    function blogListDisplay() {
        var currentPage = GetQueryString("currentPage");
        $.ajax({
            url: 'HomePagePaginationServlet',//请求的后台servlet地址
            dataType: 'json',//数据格式 
            data: {
                'currentPage': currentPage
            },
            type: 'get',//请求方式
            async: false,//是否异步请求
            success: function (data) {   //如果请求成功，返回数据。
                var blogDivList = '';
                var totalPage = data.totalPage;
                var list = data.list;
                for (var i = 0; i < list.length; i++) {    //遍历data数组
                    var blog = list[i];
                    var blogImg = isEmpty(blog.coverImageUrl) ? defaultBlogImg : blog.coverImageUrl;
                    blogDivList += " <div class='row'><articl blog-id='" + blog.id + "' class='blog_style1'> " +
                        "<div class='blog_img'> " +
                        "	<img class='img-fluid img-fill blog-img-init' src='" + blogImg + "' alt=''>" +
                        "</div>" +
                        "<div class='blog_text'>" +
                        "	<div class='blog_text_inner'>" +
                        "	<div class='cat'>" +
                        "<a class='cat_btn' href='#'>收藏</a>" +
                        "<a><i class='fa fa-calendar' aria-hidden='true'></i>&nbsp;" + blog.updateTime + "</a>" +
                        "<a><i class='fa fa-eye' aria-hidden='true'></i>&nbsp;" + blog.views + "</a>" +
                        "</div>" +
                        "<a href='#'><h4>" + blog.title + "</h4></a>" +
                        "<p>" + blog.content.substr(0, 200) + "...</p>" +
                        "<a class='blog_btn' href='#'>查看更多</a>" +
                        "</div>" +
                        "</div>" +
                        "</article></div>";
                }
                $('#blogList').html(blogDivList); //在html页面id=test的标签里显示html内容
                var begin, end;
                var pagination = '';
                //如果是第一页,不允许点击
                pagination = '<div class="page-navbar">' +
                    '<div class="nav-mainpage">';
                if (currentPage == 1)
                    pagination += '<nav aria-label="Page navigation example">' +
                        '<ul class="pagination">' +
                        '<li class="disabled">' +
                        '<a class="page-link">首页</a>' +
                        '</li>' +
                        '<li class="disabled">' +
                        '<a class="page-link" aria-label="Previous">' +
                        '<span aria-hidden="true">&laquo;</span>' +
                        '<span class="sr-only"></span>' +
                        '</a>' +
                        '</li>' +
                        '</ul>' +
                        '</nav>';
                else {
                    pagination +=
                        //其他页，点击直达首页
                        ' <nav aria-label="Page navigation example">' +
                        '   <ul class="pagination">' +
                        '   <li class="page-item">' +
                        '    <a class="page-link" href="index.jsp?currentPage=1">首页</a>' +
                        '    </li>' +
                        //其他页，点击到上一页
                        '   <li class="page-item">' +
                        '     <a class="page-link" href="index.jsp?currentPage=' + (totalPage - 1) + '"' +
                        '       aria-label="Previous">' +
                        '       <span aria-hidden="true">&laquo;</span>' +
                        '       <span class="sr-only"></span>' +
                        '     </a>' +
                        '  </li>' +
                        ' </ul>' +
                        '   </nav>' +
                        ' </div >' +
                        '</div >';
                }
                pagination +=
                    '<div class="nav-pagenum">';
                if (totalPage <= 3) {
                    begin = 1;
                    end = totalPage;
                } else {
                    begin = currentPage - 1;
                    end = currentPage + 1;
                    if (begin - 1 <= 0) {
                        begin = 1;
                        end = 3;
                    }
                    if (end > totalPage) {
                        begin = totalPage - 2;
                        end = totalPage;
                    }
                }
                for (var i = begin; i <= end; i++) {
                    if (i == currentPage) {
                        pagination += '<nav aria-label="Page navigation example">' +
                            '<ul class="pagination">' +
                            '<li class="active" > ' +
                            '<a class="page-link" > ' + i + ' </a > ' +
                            '</li > ' +
                            '</ul > ' +
                            '</nav>';
                    } else {
                        pagination += ' <nav aria-label="Page navigation example">' +
                            '<ul class="pagination">' +
                            '<li class="page-item">' +
                            ' <a class="page-link" href="index.jsp?currentPage=' + i + '">' + i + '</a>' +
                            '  </li>' +
                            '  </ul>' +
                            '</nav>';
                    }
                }
                pagination += '</div >';
                /*======================================================================= */
                pagination += '<div class="nav-lastpage">';
                if (currentPage == totalPage) {
                    pagination += '<nav aria-label="Page navigation example">' +
                        '  <ul class="pagination">' +
                        ' <li class="disabled">' +
                        '   <a class="page-link">末页</a>' +
                        '  </li>' +
                        '    <li class="disabled">' +
                        '  <a class="page-link" aria-label="Next">' +
                        '   <span aria-hidden="true">&raquo;</span>' +
                        '   <span class="sr-only"></span>' +
                        ' </a>' +
                        '</li>' +
                        '   <li class="page-item">' +
                        '  <p class="page-item">' +
                        '  <button type="button" class="btn btn-outline-primary">共' + totalPage + '页' +
                        '        </button>' +
                        ' </p>' +
                        ' </li>' +
                        ' </ul>' +
                        '</nav>';
                } else {
                    pagination += '   <nav aria-label="Page navigation example">' +
                        '<ul class="pagination">' +
                        '       <li class="page-item">' +
                        '    <a class="page-link" href="index.jsp?currentPage=' + currentPage + 1 + '"' +
                        '        aria-label="Previous">' +
                        '         <span aria-hidden="true">&raquo;</span>' +
                        '         <span class="sr-only"></span>' +
                        '     </a>' +
                        '   </li>' +
                        ' <li class="page-item">' +
                        '    <a class="page-link" href="index.jsp?currentPage=' + totalPage + '">末页</a>' +
                        '   </li>' +
                        '  <li class="page-item">' +
                        '    <p class="page-item">' +
                        '        <button type="button" class="btn btn-outline-primary">共' + totalPage + '页' +
                        '                </button>' +
                        '     </p>' +
                        '  </li>' +
                        '</ul>' +
                        '</nav>';
                }
                pagination += '</div></div>';
                $("#paginationNav").html(pagination);
            },
            error: function (data, type, err) {
                console.log("ajax错误类型：" + type);
                console.log(err);
            }
        });
    }

    function userDisplay() {

        $.ajax({
            url: 'UserDisplayServlet',//请求的后台servlet地址
            dataType: 'json',//数据格式 
            type: 'get',//请求方式
            data: {
                "username": "<%=request.getSession().getAttribute("username") %>"
            },
            async: false,//是否异步请求
            success: function (data) {   //如果请求成功，返回数据。
                console.log(data);
                var userImg = isEmpty(data.user.avatar) ? defaultUserImg : data.user.avatar;
                var userDes = isEmpty(data.user.des) ? defaultUserDes : data.user.des;
                var userDesInfo = isEmpty(data.user.desInfo) ? defaultUserDesInfo : data.user.desInfo;
                var topUser = "<img class='author_img img-fluid' src='" + userImg + "' alt=''>" +
                    "<h4>" + data.user.nickname + "</h4>" +
                    "<p>" + userDes + "</p>" +
                    "<p>" + userDesInfo + "</p>" +
                    "<div class='social_icon'>" +
                    "    <a href='#'><i class='fa fa-facebook'></i>&nbsp;关注</a> " +
                    "    <a href='#'><i class='fa fa-twitter'></i></a>" +
                    "    <a href='#'><i class='fa fa-github'></i></a>" +
                    "    <a href='#'><i class='fa fa-behance'></i></a>" +
                    "</div>" +
                    "<div class='br'></div>";

                $('#topUser').html(topUser); //在html页面id=topUser的标签里显示博主简介
            },
            error: function (data, type, err) {
                console.log("ajax错误类型：" + type);
                console.log(err);
            }
        })
    }

    function categoryCount() {
        $.ajax({
            url: 'CategoryCountServlet',//请求的后台servlet地址
            dataType: 'json',//数据格式 
            type: 'get',//请求方式
            async: false,//是否异步请求
            success: function (data) {   //如果请求成功，返回数据。
                var categoryList = '';
                for (var i = 0; i < data.length; i++) {
                    categoryList += "<li>" +
                        "<a href='<%=basePath %>/classification.jsp?category=" + data[i].category + "' class='d-flex justify-content-between'>" +
                        "<p>" + data[i].category + "</p>" +
                        "<p>" + data[i].count + "</p>" +
                        "</a>" +
                        "</li>";
                }
                $('#categoryList').html(categoryList); //在html页面id=category的标签里显示博文分类统计
            },
            error: function (data, type, err) {
                console.log("ajax错误类型：" + type);
                console.log(err);
            }
        })
    }

    function topBlogDisplay() {
        $.ajax({
            url: 'TopBlogDisplayServlet',//请求的后台servlet地址
            dataType: 'json',//数据格式 
            type: 'get',//请求方式
            async: false,//是否异步请求
            success: function (data) {   //如果请求成功，返回数据。
                var topBlogList = '';
                for (var i = 0; i < data.length; i++) {
                    var topBlogImg = isEmpty(data[i].blog.coverImageUrl) ? defaultTopBlogImg : data[i].blog.coverImgUrl;
                    topBlogList += "<div top-blog-id='" + data[i].blog.id + "'class='media post_item'>" +
                        "<img class='img-fill top-blog-img-init' src='<%=basePath %>/img/blog/popular-post/post1.jpg' alt='post'>" +
                        "<div class='media-body'>" +
                        "<a href='<%=basePath %>/blog-details.html'>" +
                        "<h3>" + data[i].blog.title + "</h3>" +
                        "</a>" +
                        "<p>" + data[i].time + "</p>" +
                        "</div>" +
                        "</div>";
                }
                $('#topBlog').html(topBlogList); //在html页面id=category的标签里显示博文分类统计
            },
            error: function (data, type, err) {
                console.log("ajax错误类型：" + type);
                console.log(err);
            }
        })
    }

    function topRankBlogDisplay() {
        $.ajax({
            url: 'TopRankBlogDisplayServlet',//请求的后台servlet地址
            dataType: 'json',//数据格式 
            type: 'get',//
            async: false,//是否异步请求
            success: function (data) {   //如果请求成功，返回数据。
                var topRankBlogList = '<div class="blog_text_slider owl-carousel">';
                for (var i = 0; i < data.length; i++) {
                    var blog = data[i];
                    topRankBlogList += " <div class='item'>" +
                        "<div class='blog_text'>" +
                        "<div class='cat'>" +
                        "<a class='cat_btn' href='#'>收藏</a>" +
                        "<a><i class='fa fa-calendar' aria-hidden='true'></i>" + blog.updateTime + "</a>" +
                        "<a><i class='fa fa-eye' aria-hidden='true'></i> " + blog.views + "</a>" +
                        "</div>" +
                        "<a href='#'>" +
                        "<h4>" + blog.title + "</h4>" +
                        "</a>" +
                        "<p>" + blog.content.substr(0, 200) +
                        "...</p>" +
                        "<a class='blog_btn' href='#'>查看更多</a>" +
                        "</div>" +
                        "</div>";
                }
                topRankBlogList += "</div>";
                $('#topRankBlog').html(topRankBlogList); //在html页面id=category的标签里显示博文分类统计
                text_slider();
            },
            error: function (data, type, err) {
                console.log("ajax错误类型：" + type);
                console.log(err);
            }
        })
    }

    function text_slider() {
        if ($('.blog_text_slider').length) {
            $('.blog_text_slider').owlCarousel({
                loop: true,
                margin: 20,
                items: 1,
                nav: false,
                autoplay: false,
                smartSpeed: 1500,
                dots: false,
                navContainer: '.blog_text_slider',
                navText: ['<i class="lnr lnr-arrow-left"></i>', '<i class="lnr lnr-arrow-right"></i>'],
            })
        }
    }

    function isLoggedIn() {
        var username = "<%=request.getSession().getAttribute("username") %>";
        if (!isEmpty(username)) {
            $("#isLoggedIn").html('<li class="nav-item">欢迎你，' + username + '</li>');
        }
        ;
    }
</script>
</body>

</html>