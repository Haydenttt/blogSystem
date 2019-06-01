package com.unicom.view.control;

import com.unicom.entity.BlogView;
import com.unicom.entity.Comment;
import com.unicom.util.ViewDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/indexComment")
public class IndexComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ViewDB view = new ViewDB();
        List<Comment> list=new ArrayList<Comment>();
        List<BlogView> listbv=new ArrayList<BlogView>();
        listbv = view.blogPar();
        ViewControl vc = new ViewControl();
        BlogView bvenDemo = new BlogView();
        bvenDemo = listbv.get(0);
        String comments = vc.comBv(bvenDemo.getId());
        req.setAttribute("bvenDemo",bvenDemo);
        req.setAttribute("comments",comments);
        //req.getRequestDispatcher("blogViewList.jsp").forward(req,resp);
        req.getRequestDispatcher("viewMyBlog.jsp").forward(req,resp);
    }
}
