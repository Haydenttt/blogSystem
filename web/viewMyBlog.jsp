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
    <link rel="stylesheet" href="css/pagination.css">
    <!-- main css -->
    <link rel="stylesheet" href="<%=basePath %>/css/style.css">
    <link rel="stylesheet" href="<%=basePath %>/css/responsive.css">
</head>
<script src="js/jquery-2.2.4.min.js"></script>
<script>
    var count=1;
    function addLikes(blogId) {
        var demo =blogId;//strId  blogId
        // alert("count:"+count);
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
<body>
<!--================Header Menu Area =================-->
<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container box_1620">
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
                        <li class="nav-item"><a class="nav-link" href="<%=basePath%>/MineServlet?username=${username}&category=all">我的博客</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/subscribe.html">我的关注</a></li>
                    </ul>
                    <%--                        <ul class="nav navbar-nav navbar-right header_social ml-auto">--%>
                    <%--                            <li class="nav-item"><a href="<%=basePath %>/login.html"></i>登录</a></li>--%>
                    <%--                            <li class="nav-item"><a href="<%=basePath %>/regist.html"></i>注册</a></li>--%>
                    <%--                        </ul>--%>
                </div>
            </div>
        </nav>
    </div>
</header>
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
                        <i id="viewsAdd" class="fa fa-comments-o" aria-hidden="true" >浏览量：</i>&nbsp;${blog.views}
                        <%--                                <i id="likesAdd" class="fa fa-thumbs-o-up " aria-hidden="true" onclick="addLikes('${bvenDemo.getId()}')">关注：</i>&nbsp;99--%>
                        <button type="button" id="likesAdd" class="fa fa-thumbs-o-up " aria-hidden="true" onclick="addLikes('${bvenDemo.getId()}')">关注：${likeViews}</button>
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
                <div class="blog_right_sidebar position-fixed" style="width: 380px;height: 500px">
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
                    <%--                            <aside class="single_sidebar_widget post_category_widget">--%>
                    <%--                                <h4 class="widget_title" style="margin-top: 30px;"><a href="#">Operation</a></h4>--%>
                    <%--                                <div class="button-group-area mt-10">--%>
                    <%--                                    <a href="#" class="genric-btn info-border circle arrow">新建博文<span class="lnr lnr-arrow-right"></span></a>--%>
                    <%--                                    <a href="#" class="genric-btn info-border circle arrow">&nbsp;草稿箱&nbsp;<span class="lnr lnr-arrow-right"></span></a>--%>
                    <%--                                </div>--%>
                    <%--                            </aside>--%>
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
