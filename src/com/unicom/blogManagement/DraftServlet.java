package com.unicom.blogManagement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.unicom.entity.Blog;
@WebServlet("/DraftServlet")
public class DraftServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        BlogManagementDAO blog = new BlogManagementDAO();
        List<Blog> blogList = blog.findDraftByUsername(username);
        request.setAttribute("username", username);
        request.setAttribute("blogList", blogList);
        request.setAttribute("title", "草稿箱");
        request.getRequestDispatcher("/myDraft.jsp").forward(request, response);
    }
}
