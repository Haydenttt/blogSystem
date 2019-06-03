<%--
  Created by IntelliJ IDEA.
  User: 黄小明
  Date: 2019/5/27
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<html>
<head>
    <title>我的博客</title>
    <link rel="icon" href="<%=basePath %>/img/favicon.png" type="image/png">
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
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/blogList/templates/follow.jsp">我的关注</a></li>
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
    <script>
        function deleteFt(id){
            var bool=confirm("是否删除？");
            if(bool){
                location.href="/ideablog/DeleteBlogServlet?id="+id+"&username=${username}&category=${category}";
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
