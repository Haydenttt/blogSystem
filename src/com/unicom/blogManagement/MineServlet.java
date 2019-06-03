package com.unicom.blogManagement;

import com.unicom.entity.Blog;
import com.unicom.exception.BlogException;
import com.unicom.exception.EmBlogError;
import com.unicom.util.CommonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author shishang
 */

@WebServlet("/MineServlet")
public class MineServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        if (!CommonUtil.checkParam(request.getParameter("category"))){
      throw new BlogException(
          EmBlogError.PARAMETER_VALIDATION_ERROR.setErrMsg("Request.GetParameter('category) FAILED"));
        }
        String category = request.getParameter("category");

        if (!CommonUtil.checkParam(String.valueOf(request.getSession().getAttribute("username")))
                || !CommonUtil.checkParam(request.getParameter("username"))){
            throw new BlogException(EmBlogError.PARAMETER_VALIDATION_ERROR.setErrMsg("username为空"));
        }
        String sessionUsername = String.valueOf(request.getSession().getAttribute("username"));
        String username = request.getParameter("username");

            BlogManagementDAO blog = new BlogManagementDAO();
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
         {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
      System.out.println(request.getContextPath() + "/login.jsp");
        }
    }
}
