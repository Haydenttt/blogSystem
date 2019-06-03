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
 * @author mac
 */
@WebServlet("/ViewControl")
public class ViewControl extends HttpServlet{
    ViewDB vdb = new ViewDB();
    List<Comment> list = new ArrayList<Comment>();
    //博客内容与评论关联
    List<BlogView> listbv = new ArrayList<BlogView>();
    public String comBv(int id){
        String comment ="";
        list = vdb.SelectComment();
     for (int i=0;i<list.size();i++){
         if (list.get(i).getBlogId()==id){
            comment = list.get(i).getCommentBody();
         }
     }
     return comment;
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        String num =(String)session.getAttribute("num"); //String.valueOf(req.getAttribute("num")); //"num:= "+num+
        //评论的内容
        String commentText = req.getParameter("commentText");
        System.out.println("-----------commentText------------:"+commentText);
        //博客id
        String numStr =req.getParameter("viewButton");
        int num = Integer.valueOf(numStr);
        //通过博客id获取当前博客信息， 并返回当前页
        List<BlogView> listbv = vdb.blogParById(num);
        BlogView bvenDemo = new BlogView();
        bvenDemo = listbv.get(0);
        ViewControl vc = new ViewControl();
        req.setAttribute("bvenDemo",bvenDemo);
        //浏览量
        Blog blog = vdb.blogValue(num);
        int viewCount = blog.getViews();
        viewCount =viewCount+1;
        boolean flag = vdb.blogViewUpdate(num,viewCount);
        System.out.println("-----------------------"+flag);
        if(flag){
            Blog blog1 = vdb.blogValue(num);
            System.out.println(blog1.getViews()+"*****************");
            req.setAttribute("blog", blog1);
        }else {
            req.setAttribute("blog", blog);
        }
        System.out.println("num:= "+num+", commentText:="+commentText);
        //关注量统计
        String likeViews = vdb.accountIsLikes(num);
        String str= likeViews.substring(13,likeViews.length()-1);
        System.out.println("test:likeViews="+likeViews);
        req.setAttribute("likeViews",str);
        //添加评论
        vdb.AddComment(num,commentText);
        //分页功能
        CommentPaginationDao commentPage = new CommentPaginationDao();
        Integer currentPage = null;
        if (!CommonUtil.checkParam(req.getParameter(StaticConstant.currentPage))) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(req.getParameter(StaticConstant.currentPage));
        }
        int blogId =bvenDemo.getId();
        List<Comment> list2 = commentPage.getAllData(currentPage,blogId);
        Integer totalPage = commentPage.getTotalPage();
        //list 存放数据库中评论的内容
        req.setAttribute("list", list2);
        req.setAttribute("totalPage", totalPage);
        req.getRequestDispatcher("viewMyBlog.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bg = req.getParameter("blogId");
        String count = req.getParameter("count");
        System.out.println("点击后count:"+count);

        int nulike = Integer.valueOf(bg);
        Blog b1 = vdb.blogValue(nulike);
        String followedName = b1.getUsername();
        String username =followedName;
        //添加关注量
        vdb.addIsLikes(nulike,username,followedName);
        System.out.println(nulike);

        //关注量统计
        String templike = vdb.accountIsLikes(nulike);
      //  System.out.println("-----------templike:"+templike);
        //传到前端
        resp.getWriter().print(templike);
    }
}
