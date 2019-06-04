<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="css/pagination.css">
</head>
<script src="js/jquery-2.2.4.min.js"></script>
<script>
    var count=1;
    function addLikes(blogId) {
        var demo =blogId;//strId  blogId
        alert("count:"+count);
        count++;
        var like = $("#likesAdd").text();
        // alert("blogId:"+blogId+",like:"+like);
        $.ajax({
            type: "POST",
            url: "ViewControl?blogId="+blogId+"&count="+count,
            dataType: "json",
            // data: {blogId : blogId},
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(data) {
                //temp = JSON.stringify(data);
                //alert(data);
                $("#likesAdd").text("关注："+data.likeCount);
                //console.log(data.likeCount)
            }
        });
    }
</script>
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
<!--================Blog Area =================-->
<section class="blog_area" style="margin-top: 80px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-9" style="margin-bottom: 80px;">
                <div class="blog_left_sidebar">
                    <div class="secondtitle" style="margin-bottom: 30px">
                        <a href="#" style="text-align: center"><h4>${bvenDemo.getTitle()}</h4></a>
                        <i id="viewsAdd" class="fa fa-comments-o" aria-hidden="true" >浏览量：</i>&nbsp;${blog.views}
                        <button type="button" id="likesAdd" class="fa fa-thumbs-o-up " aria-hidden="true" onclick="addLikes('${bvenDemo.getId()}')">关注：${likeViews}</button>
                    </div>
                    <div class="row">
                        <div class="col-md-11" style="padding-bottom: 15px;">
                            <div class="blog_style1 small">
                                <div class="blog_img" >
                                    <img class="img-fluid" src="img/04-01.jpg" style="object-fit:fill; width:750px;height: 470px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <p style=" word-wrap: break-word;  word-break: break-all;  overflow: hidden;">${bvenDemo.getContent()}</>
                <div class="row">
                    <form class="col-md-12" action="<%=basePath%>/ViewControl" method="get">
                        <div class="row bootstrap snippets">
                            <div class="col-md-offset-2 col-sm-12">
                                <div class="comment-wrapper">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            Comment panel
                                            <input name="viewButton" value="${bvenDemo.getId()}" style="display:none"></input>
                                        </div>
                                        <div class="panel-body">
                                            <textarea class="form-control" placeholder="write a comment..." rows="3" name="commentText"></textarea>
                                            <br>
                                            <button type="submit" class="btn btn-info pull-right">发表评论</button>
                                            <div class="clearfix"></div>
                                            <hr>
                                            <%--历史评论内容--%>
                                            <ul class="media-list">
                                                <c:forEach var="comList" items="${list}">
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
                                            <div class="page-navbar">
                                                <div class="nav-mainpage">
                                                    <c:choose>
                                                        <c:when test="${param.currentPage == 1}">
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination">
                                                                    <li class="disabled">
                                                                        <a class="page-link">首页</a>
                                                                    </li>
                                                                        <%--上一页按钮--%>
                                                                        <%--如果是第一页,不允许点击--%>
                                                                    <li class="disabled">
                                                                        <a class="page-link" aria-label="Previous">
                                                                            <span aria-hidden="true">&laquo;</span>
                                                                            <span class="sr-only"></span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <%-- 其他页，点击直达首页--%>
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination">
                                                                    <li class="page-item">
                                                                        <a class="page-link" href="comment?currentPage=1&viewButton=${bvenDemo.getId()}">首页</a>
                                                                    </li>
                                                                        <%-- 其他页，点击到上一页--%>
                                                                    <li class="page-item">
                                                                        <a class="page-link" href="comment?currentPage=${param.currentPage - 1}&viewButton=${bvenDemo.getId()}"
                                                                           aria-label="Previous">
                                                                            <span aria-hidden="true">&laquo;</span>
                                                                            <span class="sr-only"></span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <%-------------------------------------------------------%>
                                                <%--中间页--%>
                                                <%--显示3页中间页[begin=起始页,end=最大页]--%>
                                                <%--总页数<3页--%>
                                                <div class="nav-pagenum">
                                                    <c:choose>
                                                        <c:when test="${requestScope.totalPage <= 3}">
                                                            <c:set var="begin" value="1"/>
                                                            <c:set var="end" value="${requestScope.totalPage}"/>
                                                        </c:when>
                                                        <%--页数>3页--%>
                                                        <c:otherwise>
                                                            <c:set var="begin" value="${param.currentPage - 1}"/>
                                                            <c:set var="end" value="${param.currentPage + 1}"/>
                                                            <%--如果begin减1后为0,设置起始页为1,最大页为3--%>
                                                            <c:if test="${begin -1 <= 0}">
                                                                <c:set var="begin" value="1"/>
                                                                <c:set var="end" value="3"/>
                                                            </c:if>
                                                            <%--如果end超过最大页,设置起始页=最大页-2--%>
                                                            <c:if test="${end > requestScope.totalPage}">
                                                                <c:set var="begin" value="${requestScope.totalPage - 2}"/>
                                                                <c:set var="end" value="${requestScope.totalPage}"/>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <%--遍历--%>
                                                    <c:forEach var="i" begin="${begin}" end="${end}">
                                                        <%--当前页,选中--%>
                                                        <c:choose>
                                                            <%--<nav aria-label="Page navigation example">--%>
                                                            <c:when test="${i == param.currentPage}">
                                                                <nav aria-label="Page navigation example">
                                                                    <ul class="pagination">
                                                                        <li class="active">
                                                                            <a class="page-link">${i}</a>
                                                                        </li>
                                                                    </ul>
                                                                </nav>
                                                            </c:when>
                                                            <%--不是当前页--%>
                                                            <c:otherwise>
                                                                <nav aria-label="Page navigation example">
                                                                    <ul class="pagination">
                                                                        <li class="page-item">
                                                                            <a class="page-link" href="comment?currentPage=${i}&viewButton=${bvenDemo.getId()}">${i}</a>
                                                                        </li>
                                                                    </ul>
                                                                </nav>
                                                            </c:otherwise>
                                                            <%--</nav>--%>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                                <%-------------------------------------------------------%>
                                                <%--末页按钮--%>
                                                <%--如果是末页,不允许点击--%>
                                                <div class="nav-lastpage">
                                                    <c:choose>
                                                        <c:when test="${param.currentPage == requestScope.totalPage}">
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination">
                                                                    <li class="disabled">
                                                                        <a class="page-link">末页</a>
                                                                    </li>
                                                                        <%--下一页按钮--%>
                                                                        <%--如果是末页,不允许点击--%>
                                                                    <li class="disabled">
                                                                        <a class="page-link" aria-label="Next">
                                                                            <span aria-hidden="true">&raquo;</span>
                                                                            <span class="sr-only"></span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="page-item">
                                                                        <p class="page-item">
                                                                            <button type="button" class="btn btn-outline-primary">共${requestScope.totalPage}页
                                                                            </button>
                                                                        </p>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <%-- 其他页，点击直达末页--%>
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination">
                                                                    <li class="page-item">
                                                                        <a class="page-link" href="comment?currentPage=${requestScope.totalPage}&viewButton=${bvenDemo.getId()}">末页</a>
                                                                    </li>
                                                                        <%-- 其他页，点击到下一页--%>
                                                                    <li class="page-item">
                                                                        <a class="page-link" href="comment?currentPage=${param.currentPage + 1}&viewButton=${bvenDemo.getId()}"
                                                                           aria-label="Previous">
                                                                            <span aria-hidden="true">&raquo;</span>
                                                                            <span class="sr-only"></span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="page-item">
                                                                        <p class="page-item">
                                                                            <button type="button" class="btn btn-outline-primary">共${requestScope.totalPage}页
                                                                            </button>
                                                                        </p>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <%--    右侧分类    --%>
            <div class="col-lg-3" style="width: 10%">
                <div class="blog_right_sidebar">
                    <aside class="post_category_widget">
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
                    <aside class="single_sidebar_widget post_category_widget">
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
            $("#isLoggedIn").html('<li class="nav-item">欢迎你，' + username + '</li>');
        }
        ;
    }
</script>
</body>
</html>