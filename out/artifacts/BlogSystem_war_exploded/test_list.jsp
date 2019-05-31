<%--
  Created by IntelliJ IDEA.
  User: tanglj31
  Date: 2019/5/28
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'test_list.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>

<ul>
    <c:forEach items="${requestScope.tests}" var="p">
        <li>用户名：${p.username}</li>
    </c:forEach>

</ul>

<c:if test="${param.currentPage == 1}">
    <a>首页</a>
    <a>上一页</a>
</c:if>

<c:if test="${param.currentPage != 1}">
    <a href="Action?cur=1">首页</a>
    <a href="Action?cur=${param.currentPage - 1}">上一页</a>
</c:if>

<c:if test="${param.currentPage == requestScope.totalPage}">
    <a>下一页</a>
    <a>尾页</a>
</c:if>

<c:if test="${param.currentPage != requestScope.totalPage}">
    <a href="Action?cur=${param.currentPage + 1}">下一页</a>
    <a href="Action?cur=${requestScope.totalPage}">尾页</a>
</c:if>

<p>
    当前第${param.currentPage}页       总共${requestScope.totalPage}页
</p>

</body>
</html>
