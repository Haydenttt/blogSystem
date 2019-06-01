package com.unicom.edit.servlet;

import com.unicom.edit.utils.DButil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/blogedit")
public class BlogEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户名及blog编号
        String id=req.getParameter("id");
        String username=req.getParameter("username");
        String title="";
        String content="";
        String category_name="";
        String views ="1";
        Date date=new Date();
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String create_time=dt.format(date);

        List list=new ArrayList();
        String sql="";
        ResultSet rs=null;
        //根据id获取数据
        boolean flag=false;
        try {
            sql="select * from blog where id=?";
            Object[] params={id};
            rs= DButil.select(sql,params);
            if (rs.next()) {
                flag=true;
                title=rs.getString("title");
                content=rs.getString("content");
                category_name=rs.getString("category_name");
                views=rs.getString("views");
                create_time=rs.getString("create_time");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.close();
        }

        //获取分类
        try {
            sql="select category_name from category";
            rs= DButil.select(sql,null);
            while (rs.next()) {
                list.add(rs.getString("category_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.close();
        }

        req.setAttribute("title",title);
        req.setAttribute("content",content);
        req.setAttribute("category_name",category_name);
        req.setAttribute("username",username);
        req.setAttribute("id",id);
        req.setAttribute("views",views);
        req.setAttribute("create_time",create_time);
        req.setAttribute("list",list);
        System.out.println("create_time:"+create_time);
        req.getRequestDispatcher("blogedit.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
