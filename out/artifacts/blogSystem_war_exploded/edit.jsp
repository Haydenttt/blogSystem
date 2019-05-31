<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()
            +":"+request.getServerPort()+"/"+request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- 重置文件 -->
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <title>修改</title>
</head>
<body style="background: #f3f3f3">
<div class="reg_div" style="background: #A3B4DC">
    <p>修改用户信息</p>

    <form action ="<%=basePath%>/UserEditServlet" method="get">
        <ul class="reg_ul">
            <li>
                <span>用户名：</span>
                <input type="text" readonly value="" name="user" placeholder="请修改用户名" class="reg_user">
                <span class="tip user_hint"></span>
            </li>
            <li>
                <span>密码：</span>
                <input type="password" value="" name="password" placeholder="请修改密码" class="reg_password">
                <span class="tip password_hint"></span>
            </li>
            <li>
                <span>昵称：</span>
                <input type="password" name="nickname" value="" placeholder="请修改昵称" class="reg_confirm">
                <span class="tip confirm_hint"></span>
            </li>
            <!--     <li>
                    <span>邮箱：</span>
                    <input type="text" name="" value="" placeholder="邮箱" class="reg_email">
                    <span class="tip email_hint"></span>
                </li>
                <li>
                    <span>手机号码：</span>
                    <input type="email" name="" value="" placeholder="手机号" class="reg_mobile">
                    <span class="tip mobile_hint"></span>
                </li> -->
            <li>
                <button type="submit" name="button" class="red_button">确认修改</button>
            </li>
        </ul>
    </form>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<div style="text-align:center;">

</div>
</body>
</html>
