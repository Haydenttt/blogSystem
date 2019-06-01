package com.unicom.edit.servlet;

import com.unicom.edit.utils.DButil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PublishBlog")
public class PublishBlog extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //修改文章状态
        String username=req.getParameter("username");
        String category=req.getParameter("category");
        String id=req.getParameter("id");
        String sql="";
        try{
            sql="update blog set status=? where id="+id;
            Object[] params={1};
            DButil.update(sql,params);
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            DButil.close();
        }
        req.setAttribute("username",username);
        req.setAttribute("category",category);
        req.getRequestDispatcher("/MineServlet").forward(req,resp);
    }
}