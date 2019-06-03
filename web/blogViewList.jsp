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
<script src="js/bootstrap.bundle.js" type="text/javascript" charset="utf-8"></script>
<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
