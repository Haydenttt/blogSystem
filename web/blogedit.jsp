<%--
  Created by IntelliJ IDEA.
  User: Unicom
  Date: 2019/5/26
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>

<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<html>
<head>
    <title>$Title$</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
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
    <script type="text/javascript" charset="utf-8" src="static/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="static/js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="static/js/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>

<body>
<%
    String category_name= (String) request.getAttribute("category_name");
%>
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
    <!--================总容器 =================-->
    <div>
        <section class="blog_area" style="margin-top: -65px;">
            <div class="container">
                <div class="row" style="margin-bottom: 80px;">
                    <div class="col-lg-9" style="background: rgb(249,249,255)">
                        <!--================编辑区容器 =================-->
                        <div style="margin-left: 15px;margin-right: 10px;margin-top: 10px;">
                            <form action="${pageContext.request.contextPath}/PrestorageBlog" method="get">
                                <!--================表头容器 =================-->
                                <div style="margin: 10px auto;display: flex;width: 100%">
                                    <div style="margin-right: 10px;margin-left: 10px;width: 86%">
                                        <div style="width: 64%;float:left;margin-left: 15px">
                                            <input value="${title}" placeholder="请输入标题" type="text" name="title" style="font-family: 楷体;font-size: 18px;height: 34px;width: 100%">
                                        </div>
                                        <div style="width: 10%;float:left;margin-left: 15px">
                                            <select id="sel" name="category_name" style="width:auto;height: 34px;color: #0000cc;font-family: 楷体;font-size: 18px">
                                                <%
                                                    List list= (List) request.getAttribute("list");
                                                    for (int i = 0; i < list.size() ; i++) {
                                                        if (list.get(i) != category_name ) {
                                                %>
                                                <option><%=list.get(i)%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div style="width: 15%;float:right;margin-left: 20px">
                                            <input type="hidden" name="id" value="${id}" >
                                            <input type="hidden" name="views" value="${views}">
                                            <input type="hidden" name="username" value="${username}">
                                            <input type="hidden" name="create_time" value="${create_time}">
                                            <button type="submit" class="btn btn-primary">保存预览</button>
                                        </div>
                                    </div>
                                    <div style="width: 12%">
                                        <a href="<%=basePath%>/MineServlet?username=${username}&category=all" class="btn btn-primary">取消编辑</a>
                                    </div>
                                </div>
                                <!--================编辑区ueditor容器 =================-->
                                <div style="width: 100%;margin:15px auto;margin-left: 10px">
                                    <textarea id="content" name="content" style="height: 65%;width: 99%;"><?php $str = $info['content'];echo $str;?>${content}</textarea>
                                </div >
                            </form>
                            <br>
                            <script type="text/javascript">
                                ue_s = UE.getEditor('content',{toolbars: [[
                                        '|',
                                        'undo',//取消
                                        'redo',//还原
                                        '|',
                                        '|',
                                        'bold',//黑字体
                                        'italic',//斜字体
                                        'underline',//下划线
                                        'superscript',//上标高度
                                        'subscript',//下标
                                        'removeformat',//清除格式
                                        'formatmatch',//格式刷
                                        '|',
                                        '|',
                                        'forecolor',//字体颜色
                                        'backcolor',//字体背景颜色
                                        'selectall',//全选
                                        'cleardoc',//清空文档
                                        '|',
                                        '|',
                                        'lineheight',//行间距
                                        'fontfamily',//字体
                                        'fontsize',//字号
                                        '|',
                                        '|',
                                        'indent',//首行缩进
                                        'justifyleft',//局左对齐
                                        'justifycenter',//居中对齐
                                        'justifyright',//局右对齐
                                        '|',
                                        '|',
                                        'touppercase',//字母大写
                                        'tolowercase',//字母小写
                                        '|',
                                        '|',
                                        'simpleupload',//单图上传
                                        'insertimage',//多图上传
                                        'emotion',//表情
                                        'attachment',//附件上传
                                        '|',
                                        '|',
                                        'horizontal',//分隔线
                                        'date',//日历
                                        'time',//时间
                                        'spechars',//特殊字符
                                        '|',
                                        '|',
                                        'inserttable',//插入表格
                                        'deletetable',//删除表格
                                        '|',
                                        'insertparagraphbeforetable',//表格前插入行
                                        '|',
                                        'insertrow',//前插入行
                                        'deleterow',//删除行
                                        '|',
                                        'insertcol',//前插入列
                                        'deletecol',//删除列
                                        '|',
                                        'mergecells',//合并多个单元格
                                        'mergeright',//右合并多个单元格
                                        'mergedown',//下合并多个单元格
                                        '|',
                                        'splittocells',//完全拆分单元格
                                        'splittorows',//拆分成行
                                        'splittocols',//拆分成列
                                        '|',
                                        '|',
                                        'preview',//预览
                                        'searchreplace',//查询替换
                                        'fullscreen',//全画面
                                    ]]
                                });
                            </script>
                        </div>
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
