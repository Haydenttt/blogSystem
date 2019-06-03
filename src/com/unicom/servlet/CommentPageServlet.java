package com.unicom.servlet;

import com.unicom.dao.BlogPaginationDao;
import com.unicom.dao.CommentPaginationDao;
import com.unicom.entity.Blog;
import com.unicom.entity.BlogView;
import com.unicom.entity.Comment;
import com.unicom.util.CommonUtil;
import com.unicom.util.StaticConstant;
import com.unicom.util.ViewDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/comment")
public class CommentPageServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommentPaginationDao commentPage = new CommentPaginationDao();
        Integer currentPage = null;
        String numStr =request.getParameter("viewButton");
        int num = Integer.valueOf(numStr);
        ViewDB vdb = new ViewDB();
        List<BlogView> listbv = vdb.blogParById(num);
        BlogView bvenDemo = listbv.get(0);
        request.setAttribute("bvenDemo",bvenDemo);
        //关注量统计
        String likeViews = vdb.accountIsLikes(num);
        String str= likeViews.substring(13,likeViews.length()-1);
        System.out.println("test:likeViews="+likeViews);
        request.setAttribute("likeViews",str);
        //浏览量统计
        Blog blog = vdb.blogValue(num);
        int viewCount = blog.getViews();
        viewCount =viewCount+1;
        boolean flag = vdb.blogViewUpdate(num,viewCount);
        if(flag){
            Blog blog1 = vdb.blogValue(num);
            request.setAttribute("blog", blog1);
        }else {
            request.setAttribute("blog", blog);
        }
        //分页
        if (!CommonUtil.checkParam(request.getParameter(StaticConstant.currentPage))) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter(StaticConstant.currentPage));
        }
        List<Comment> list = commentPage.getAllData(currentPage,num);
        Integer totalPage = commentPage.getTotalPage();
        request.setAttribute("list", list);
        request.setAttribute("totalPage", totalPage);
        request.getRequestDispatcher("viewMyBlog.jsp").forward(request, response);
    }
}
