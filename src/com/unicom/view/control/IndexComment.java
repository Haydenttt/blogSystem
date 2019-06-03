package com.unicom.view.control;

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

    /**
     * 博客查看入口
     */
    @WebServlet("/indexComment")
    public class IndexComment extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ViewDB view = new ViewDB();
            List<Comment> list=new ArrayList<Comment>();
            //blogID 为传过来的博客id
            // List<BlogView> listbv = view.blogParById(blogId);
            List<BlogView> listbv=new ArrayList<BlogView>();
            listbv = view.blogPar();
            ViewControl vc = new ViewControl();
            BlogView bvenDemo = new BlogView();
            bvenDemo = listbv.get(0);
            req.setAttribute("bvenDemo",bvenDemo);
            //分页功能
            CommentPaginationDao commentPage = new CommentPaginationDao();
            Integer currentPage = null;
            if (!CommonUtil.checkParam(req.getParameter(StaticConstant.currentPage))) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(req.getParameter(StaticConstant.currentPage));
            }
            //bvenDemo.getId() 博客id
            int blogId =bvenDemo.getId();
            //浏览量 blog.views
//        Blog blog = view.blogValue(blogId);
//        req.setAttribute("blog", blog);
            Blog blog = view.blogValue(blogId);
            int viewCount = blog.getViews();
            viewCount =viewCount+1;
            boolean flag = view.blogViewUpdate(blogId,viewCount);
            System.out.println("-----------------------"+flag);
            if(flag){
                Blog blog1 = view.blogValue(blogId);
                // System.out.println(blog1.getViews()+"*****************");
                req.setAttribute("blog", blog1);
            }else {
                req.setAttribute("blog", blog);
            }
            //关注
            String likeViews = view.accountIsLikes(blogId);
            String str= likeViews.substring(13,likeViews.length()-1);
            System.out.println("test:likeViews="+likeViews);
            req.setAttribute("likeViews",str);
            List<Comment> list2 = commentPage.getAllData(currentPage,blogId);
            Integer totalPage = commentPage.getTotalPage();
            //list 存放数据库中评论的内容
            req.setAttribute("list", list2);
            //分页的信息
            req.setAttribute("totalPage", totalPage);
            req.getRequestDispatcher("viewMyBlog.jsp").forward(req,resp);
        }
    }
