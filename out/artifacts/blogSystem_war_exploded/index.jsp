<%--
  Created by IntelliJ IDEA.
  User: tanglj31
  Date: 2019/5/25
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+request.getContextPath();
    System.out.println(basePath);
  %>
  <a href="<%=basePath%>/MineServlet?username=ss&category=all">跳转</a>
  <h1>新建</h1>
  <form action="${pageContext.request.contextPath}/blogedit" method="get">
    <input type="text" name="username" value="ss">
    <button type="submit">新建Blog</button>
  </form>
  <form action="${pageContext.request.contextPath}/blogedit" method="get">
    <input type="text" name="username" value="ss">
    <input type="text" name="id" value="25">
    <button type="submit">编辑Blog</button>
  </form>
  </body>
</html>
