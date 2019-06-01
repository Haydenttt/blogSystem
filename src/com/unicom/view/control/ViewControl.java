package com.unicom.view.control;

import com.unicom.entity.BlogView;
import com.unicom.entity.Comment;
import com.unicom.util.ViewDB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author mac
 */
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
        //博客id
        String numStr =req.getParameter("viewButton");
        int num = Integer.valueOf(numStr);
        //通过博客id获取当前博客信息， 并返回当前页
        List<BlogView> listbv = vdb.blogParById(num);
        //System.out.println("bv 主题:"+bv.get(0).getTitle());
        BlogView bvenDemo = new BlogView();
        bvenDemo = listbv.get(0);
        ViewControl vc = new ViewControl();
        String comments = vc.comBv(bvenDemo.getId());
        req.setAttribute("bvenDemo",bvenDemo);
        req.setAttribute("comments",comments);
        //String num = req.getParameter("num");
        System.out.println("num:= "+num+", commentText:="+commentText);
        vdb.AddComment(num,commentText);
        //将与当前页博客id关联的所有评论倒序输出
        //list = vdb.SelectCommentByTime();
        List<Comment> listDemo = new ArrayList<Comment>();
        listDemo = vdb.SelectCommentByTime();
        List<Comment> listComment = new ArrayList<Comment>();
        //判断评论区与博客关联
        for (int i=0;i<listDemo.size();i++){
            if (listbv.get(0).getId()==listDemo.get(i).getBlogId()){
                listComment.add(listDemo.get(i));
            }
        }
        req.setAttribute("commentList",listComment);
        //req.getRequestDispatcher("blogViewList.jsp").forward(req,resp);
        req.getRequestDispatcher("viewMyBlog.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
