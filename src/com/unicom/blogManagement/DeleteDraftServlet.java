package com.unicom.blogManagement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/DeleteDraftServlet")
public class DeleteDraftServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String category = request.getParameter("category");
        int id = Integer.valueOf(request.getParameter("id"));

        BlogManagementDAO blog = new BlogManagementDAO();
        blog.deleteBlogByID(id);

        request.setAttribute("username", username);
        request.setAttribute("category", category);
        request.getRequestDispatcher("/DraftServlet").forward(request, response);
    }
}
