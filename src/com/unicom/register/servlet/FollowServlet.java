package com.unicom.register.servlet;

import com.google.gson.Gson;
import com.unicom.entity.Blog;
import com.unicom.entity.Follow;
import com.unicom.register.dao.ViewImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/FollowServlet")
public class FollowServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        //  String username=request.getParameter("username");
        ViewImpl view=new ViewImpl();
        List<Follow> list=new ArrayList<Follow>();
        list= view.query6();
        //   System.out.println(list);
        Gson gson = new Gson();
        String json = gson.toJson(list);  //将Pricels转化为Json数组
        response.getWriter().print(json);
        out.flush();
        out.close();

    }
}
