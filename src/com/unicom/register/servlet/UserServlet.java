package com.unicom.register.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import com.unicom.register.dao.UserBizImpl;
import com.unicom.entity.User;
//@WebServlet(name = "UserServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        UserBizImpl bizImpl=new UserBizImpl();
        User user=new User();

        //System.out.println(username);
      //  System.out.println(password);
        request.setAttribute("username", username);
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        if (bizImpl.query(username,password)) {
            System.out.println("用户登录成功");

            request.getRequestDispatcher("edit.jsp").forward(request, response);
        }else {
            response.sendRedirect("error.jsp");

        }


    }
}
