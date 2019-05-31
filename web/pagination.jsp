<%--
  Created by IntelliJ IDEA.
  User: tanglj31
  Date: 2019/5/28
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title></title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" href="<%=basePath %>css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
    <link rel="stylesheet" href="css/pagination.css">
</head>

<body>
<%--页面内容--%>
<%--<ul>--%>
    <%--<c:forEach items="${requestScope.list}" var="p">--%>
        <%--<li>标题：${p.title}</li>--%>
        <%--<li>${p.content}</li>--%>
    <%--</c:forEach>--%>
<%--</ul>--%>
<%-------------------------------------------------%>
<%--首页按钮--%>
<%--如果是第一页,不允许点击--%>
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
                            <a class="page-link" href="Action?currentPage=1">首页</a>
                        </li>
                            <%-- 其他页，点击到上一页--%>
                        <li class="page-item">
                            <a class="page-link" href="Action?currentPage=${param.currentPage - 1}"
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
                                <a class="page-link" href="Action?currentPage=${i}">${i}</a>
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
                            <a class="page-link" href="Action?currentPage=${requestScope.totalPage}">末页</a>
                        </li>
                            <%-- 其他页，点击到下一页--%>
                        <li class="page-item">
                            <a class="page-link" href="Action?currentPage=${param.currentPage + 1}"
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
</body>
</html>
