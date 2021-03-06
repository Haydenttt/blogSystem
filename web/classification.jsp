<%--
  Created by IntelliJ IDEA.
  User: liup68
  Date: 2019/5/28
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + request.getContextPath();
%>
<html>
<head>
    <link rel="icon" href="<%=basePath %>/img/favicon.png" type="image/png">
    <title>博客列表</title>
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
                        <li class="nav-item active"><a class="nav-link" href="<%=basePath %>/index.jsp"
                                                       style="font-family: 微软雅黑;">首页</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false" style="font-family: 微软雅黑;">分类</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=政治经济"
                                                        style="font-family: 微软雅黑;">政治经济</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=科技"
                                                        style="font-family: 微软雅黑;">科技</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=体育"
                                                        style="font-family: 微软雅黑;">体育</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=健康"
                                                        style="font-family: 微软雅黑;">健康</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=旅游"
                                                        style="font-family: 微软雅黑;">旅游</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/success.jsp"
                                                style="font-family: 微软雅黑;">统计</a></li>
                        <li class="nav-item"><a class="nav-link"
                                                href="<%=basePath %>/MineServlet?username=<%=request.getSession().getAttribute("username") %>&category=all"
                                                style="font-family: 微软雅黑;">
                            我的博客</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/follow.jsp"
                                                style="font-family: 微软雅黑;">博客收藏</a></li>
                    </ul>
                    <ul id="isLoggedIn" class="nav navbar-nav navbar-right header_social ml-auto">
                        <li class="nav-item"><a href="<%=basePath %>/login.jsp" style="font-family: 微软雅黑;"></i>登录/注册</a>
                        </li>
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
<section class="blog_area p_120">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="blog_left_sidebar">
                    <div id="blogList"></div>
                </div>
                <div id="paginationNav" class="col-md-7 justify-content-center d-flex"><%--首页按钮--%>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="blog_right_sidebar">
                    <aside class="single_sidebar_widget search_widget">
                        <div class="input-group">
                            <input id="blogSearch" type="text" class="form-control" placeholder="搜索博文">
                            <span class="input-group-btn">
                                    <button id="blogSearchBtn" class="btn btn-default btn-primary"
                                            onclick="searchBlog();"><i
                                            class="lnr lnr-magnifier"></i></button>
                                </span>
                        </div><!-- /input-group -->
                        <div class="br"></div>
                    </aside>
                    <aside id="topUser" class="single_sidebar_widget author_widget">
                    </aside>
                    <aside class="single_sidebar_widget popular_post_widget">
                        <h3 class="widget_title">最热博文</h3>
                        <div id="topBlog"></div>
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
                Copyright &copy;
                <script>document.write(new Date().getFullYear());</script>
                All rights reserved | Blog System Made By <strong>Group 8</strong>
                <a target="_blank" style="color: coral;"><br/> 李婉茹 | 刘沛 | 黄小明 | 李帅 | 时尚 | 唐隆基 | 刘杰</a>
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

    function getQueryString(key) {
        var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
        var result = window.location.search.substr(1).match(reg);
        return result ? decodeURIComponent(result[2]) : null;
    }

    $(document).ready(function () {
            var defaultBlogImg = "<%=basePath %>/img/home-blog/blog-4.jpg";//设置默认博客图片，当博客没有图片时置为默认图
            var defaultTopBlogImg = "<%=basePath %>/img/blog/popular-post/post1.jpg";//设置默认热门博文图片，当博客没有图片时置为默认图
            var keyword = GetQueryString("keyword");
            var keyword1 = getQueryString("keyword");
            var category = GetQueryString("category");
            var category1 = getQueryString("category1");
        var currentPage = isEmpty(getQueryString("currentPage")) ? 1 : Number(getQueryString("currentPage"));
            var previous = parseInt(currentPage) - 1;
            var next = parseInt(currentPage) + 1;
            var blogListUrl = '';
            var data = '';
            isLoggedIn();
            if (!isEmpty(keyword)) {
                blogListUrl = 'search';
                data = {
                    keyword: keyword,
                };
                $.ajax({
                    url: blogListUrl,//请求的后台servlet地址
                    dataType: 'json',//数据格式 
                    type: 'post',//请求方式
                    async: false,//是否异步请求
                    data: data,
                    success: function (data) {   //如果请求成功，返回数据。
                        console.log(data);
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
                                "<a href='#'><i class='fa fa-calendar' aria-hidden='true'></i>" + blog.updateTime + "</a>" +
                                "<a href='#'><i class='fa fa-eye' aria-hidden='true'></i>" + blog.views + "</a>" +
                                "</div>" +
                                "<a href='" + "indexComment?id=" + blog.id + "'><h4>" + blog.title + "</h4></a>" +
                                "<p>" + blog.content.substr(0, 200) + "...</p>" +
                                "<a class='blog_btn' href='" + "indexComment?id=" + blog.id + "'>查看更多</a>" +
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
                                '    <a class="page-link" href="classification.jsp?keyword=' + keyword1 + '&currentPage=1">首页</a>' +
                                '    </li>' +
                                //其他页，点击到上一页
                                '   <li class="page-item">' +
                                '     <a class="page-link" href="classification.jsp?keyword=' + keyword1 + '&currentPage=' + previous + '"' +
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
                                    ' <a class="page-link" href="classification.jsp?keyword=' + keyword1 + '&currentPage=' + i + '">' + i + '</a>' +
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
                                '    <a class="page-link" href="classification.jsp?keyword=' + keyword1 + '&currentPage=' + next + '"' +
                                '        aria-label="Previous">' +
                                '         <span aria-hidden="true">&raquo;</span>' +
                                '         <span class="sr-only"></span>' +
                                '     </a>' +
                                '   </li>' +
                                ' <li class="page-item">' +
                                '    <a class="page-link" href="classification.jsp?keyword=' + keyword1 + '&currentPage=' + totalPage + '">末页</a>' +
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
                })
            } else {
                blogListUrl = 'ClassificationServlet';
                data = {
                    category: category
                };
                $.ajax({
                    url: blogListUrl,//请求的后台servlet地址
                    dataType: 'json',//数据格式 
                    type: 'post',//请求方式
                    async: false,//是否异步请求
                    data: data,
                    success: function (data) {   //如果请求成功，返回数据。
                        console.log(data);
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
                                "<a href='#'><i class='fa fa-calendar' aria-hidden='true'></i>" + blog.updateTime + "</a>" +
                                "<a href='#'><i class='fa fa-comments-o' aria-hidden='true'></i>" + blog.views + "</a>" +
                                "</div>" +
                                "<a href='indexComment?id=" + blog.id + "'><h4>" + blog.title + "</h4></a>" +
                                "<p>" + blog.content.substr(0, 200) + "...</p>" +
                                "<a class='blog_btn' href='indexComment?id=" + blog.id + "'>查看更多</a>" +
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
                                '    <a class="page-link" href="classification.jsp?category=' + category1 + '&currentPage=1">首页</a>' +
                                '    </li>' +
                                //其他页，点击到上一页
                                '   <li class="page-item">' +
                                '     <a class="page-link" href="classification.jsp?category=' + category1 + '&currentPage=' + (totalPage - 1) + '"' +
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
                                    ' <a class="page-link" href="classification.jsp?category=' + category1 + '&currentPage=' + i + '">' + i + '</a>' +
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
                                '    <a class="page-link" href="classification.jsp?category=' + category1 + '&currentPage=' + currentPage + 1 + '"' +
                                '        aria-label="Previous">' +
                                '         <span aria-hidden="true">&raquo;</span>' +
                                '         <span class="sr-only"></span>' +
                                '     </a>' +
                                '   </li>' +
                                ' <li class="page-item">' +
                                '    <a class="page-link" href="classification.jsp?category=' + category1 + '&currentPage=' + totalPage + '">末页</a>' +
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
                })
            }

            $.ajax({
                url: 'CategoryCountServlet',//请求的后台servlet地址
                dataType: 'json',//数据格式 
                type: 'get',//请求方式
                async: false,//是否异步请求
                success: function (data) {   //如果请求成功，返回数据。
                    var categoryList = '';
                    console.log(data);
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
            }),
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
                                "<a href='<%=basePath %>/indexComment?id=" + data[i].blog.id + "'>" +
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
    )
    ;

    function isLoggedIn() {
        var username = "<%=request.getSession().getAttribute("username") %>";
        if (!isEmpty(username)) {
            $("#isLoggedIn").html('<li class="nav-item"><a href="<%=basePath %>/edit.jsp">' + '欢迎你，' + username + '</a></li>');
        }
        ;
    }

    function searchBlog() {
        var keyword = $("#blogSearch").val();
        console.log(keyword);
        location.href = "<%=basePath %>/classification.jsp?keyword=" + keyword;
    }
</script>
</body>
</html>
