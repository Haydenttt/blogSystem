<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + request.getContextPath();
%>
<html>
<head>
    <title>我的关注</title>
    <link rel="icon" href="<%=basePath %>/img/favicon.png" type="image/png">
    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.3/style/weui.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css">
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
    <style>
        .pClass {
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;

        }
    </style>
</head>
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
                        <li class="nav-item active"><a class="nav-link" href="<%=basePath %>/index.jsp" style="font-family: 微软雅黑;">首页</a></li>
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

<body>
<center><h1 style="margin-top: 50px">我的博客收藏</h1></center>
<div class="weui-cells">
    <div class="weui-form-preview" id="Tolist"></div>
</div>
<div id="demo2-1"></div>
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
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
<script src="../js/folow.js"></script>
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
        loadList();
        isLoggedIn();
        $.ajax({
            url: "<%=request.getContextPath()%>/qryFollow",        //后台url
            type: "post",                   //类型，POST或者GET
            dataType: 'json',              //数据返回类型，可以是xml、json等
            success: function (data) {      //成功，回调函数
                var jsp = "";
                for (var i = 0; i < data.length; i++) {
                    jsp += '<a class="weui-cell weui-cell_access" href="javascript:;">';
                    jsp += '<div class="layui-col-md2">';
                    jsp += '<div class="layui-row grid-demo">';
                    jsp += '<div class="layui-col-md12 layui-col-md-offset2">';
                    jsp += '<img src=' + data[i].coverImageUrl + ' alt="" style="width:150px;margin-right:5px;display:block">';
                    jsp += '</div>';
                    jsp += '</div>';
                    jsp += '</div>';
                    jsp += '<div class="layui-col-md9">';
                    jsp += '<div class="layui-row grid-demo grid-demo-bg1" onclick = fnToUrl(' + data[i].id + ',"' + data[i].username + '") >';
                    jsp += '<div class="layui-col-md12">';
                    jsp += '<p style="font-size:30px;color: #444444">' + data[i].title + '</p>';
                    jsp += '</div>';
                    jsp += '<div class="layui-col-md12">';
                    jsp += '<p style="font-size:20px;color: #999999;" class="pClass">' + data[i].content + '</p>';
                    jsp += '</div>';
                    jsp += '</div>';
                    jsp += '</div>';
                    jsp += '</a>';
                }
                $("#Tolist").append(jsp);
            },
            error: function (er) {          //失败，回调函数

            }
        });
    });

    function fnToUrl(id, username) {

        $.ajax({
            url: "<%=request.getContextPath()%>/indexComment?id=" + id + "&username=" + username,        //后台url
            type: "post",                   //类型，POST或者GET
            dataType: 'json',              //数据返回类型，可以是xml、json等
            success: function (data) {      //成功，回调函数
            },
            error: function (er) {          //失败，回调函数

            }
        });
        alert(buffer);
        //
    }

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
