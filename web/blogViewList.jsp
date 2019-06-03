<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.unicom.entity.*,com.unicom.util.*" %>
<%@ page import="java.util.List,java.util.ArrayList" %>
<%@ page import="static com.sun.xml.internal.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table" %>
<%@ page import="com.unicom.view.control.ViewControl" %>
<%@ page isELIgnored="false"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
 String basePath = request.getScheme()+"://"+request.getServerName()
 +":"+request.getServerPort()+request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-grid.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-reboot.css">
    <style>
        .bodyDemo{
            width: 100%;
        }
        .bodyDemo .leftBody{
            width: 90%;
            align-items: center;
        }
        .bodyDemo .rightBody{
            width: 90%;
            align-items: center;
        }
        body{margin-top:20px;}
        .comment-wrapper .panel-body {
            max-height:650px;
            overflow:auto;
        }
        .comment-wrapper .media-list .media img {
            width:64px;
            height:64px;
            border:2px solid #e5e7e8;
        }
        .comment-wrapper .media-list .media {
            border-bottom:1px dashed #efefef;
            margin-bottom:25px;
        }
        .imgDiv{
            text-align: center;
        }
    </style>
</head>
<body>

<%--    博客主题--%>
<div class="bodyDemo">
    <div class="leftBody">
    <div class="imgDiv">
        <h1>${bvenDemo.getTitle()}</h1>
    </div>
<%--    博客相关信息--%>
    <div>
        <h1>浏览量：58 关注量：38</h1>
    </div>
<%--    博客主要内容--%>
    <div>
        <div class="imgDiv">
            <img src="${bvenDemo.getCoverImageUrl()}" alt="" class="img-circle">
        </div>
        <p>${bvenDemo.getContent()}</p>
    </div>
<%--    博客评论区 <%=vc.comBv(bvenDemo.getId())%>--%>
<%--    <div class="comment">--%>
<%--        <div class="addcom"></div>--%>
<%--        <div>${comments}</div>--%>
<%--    </div>--%>
    </div>
<%--    博客评论区模板 http://localhost:8080/blogSystem/ViewControl--%>
    <div class="rightBody">
<form action="<%=basePath%>/ViewControl" method="get">
    <div class="row bootstrap snippets">
        <div class="col-md-6 col-md-offset-2 col-sm-12">
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
                        <div class="container">
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
    </div>
</form>
    </div>
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
<script src="js/bootstrap.bundle.js" type="text/javascript" charset="utf-8"></script>
<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
