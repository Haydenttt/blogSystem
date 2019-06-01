package com.unicom.blogManagement;

import com.unicom.entity.Blog;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class MineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String category = request.getParameter("category");

        blogManagement blog = new blogManagement();
        List<Blog> blogList = blog.findCategoryByUsername(username, category);

        request.setAttribute("username", username);
        request.setAttribute("category", category);
        request.setAttribute("blogList", blogList);
        if(category.equals("all")){
            request.setAttribute("title", "所有博文");
        }else{
            request.setAttribute("title", category);
        }
        request.getRequestDispatcher("/myBlog.jsp").forward(request, response);
    }
}
