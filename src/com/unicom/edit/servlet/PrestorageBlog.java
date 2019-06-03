package com.unicom.edit.servlet;


import com.unicom.edit.utils.DButil;
import com.unicom.edit.utils.GetSubstr;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/PrestorageBlog")
public class PrestorageBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("=====================");
        String title=req.getParameter("title");
        String content=req.getParameter("content");
        String category_name=req.getParameter("category_name");
        String username=req.getParameter("username");
        String id=req.getParameter("id");
        String views=req.getParameter("views");
        String create_time=req.getParameter("create_time");
        String nickname="user";
        int status=0;
        int category_id=0;
        ResultSet rs=null;

        String sql="";
        //根据username获取昵称
        try {
            sql="select nickname from users where username=?";
            Object[] params={username};
            rs= DButil.select(sql,params);
            while (rs.next()) {
                nickname=rs.getString("nickname");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.close();
        }

        //根据category_name获取分类编号

        try {
            sql="select id from category where category_name=?";
            Object[] params={category_name};
            rs= DButil.select(sql,params);
            while (rs.next()) {
                category_id = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.close();
        }

        //读取常量文件获取背景图连接
        String stra="/blogSystem/static/image/";

        String strb="\" title=\"";

        String cover_image_url= GetSubstr.getSubstr(content,stra,strb);
        if (cover_image_url == null) {
            cover_image_url="/blogSystem/static/image/20190601/1559374012929056187.jpg";
        }
        //预览
        status=0;
        //判断blog是否已经在blog库
        boolean flag=false;
        try {
            System.out.println("PrestorageBlog id not null="+id);
            sql="select * from blog where id=?";
            Object[] params={id};
            rs= DButil.select(sql,params);
            if (rs.next()) {
                flag=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.close();
        }

        if (flag) {
            //更新，如果在库
            System.out.println("更新了 cover_image_url="+cover_image_url);
            try{
                sql="update blog set title=?,username=?,content=?,cover_image_url=?," +
                        "category_id=?,status=?,nickname=?,category_name=? where id="+id;
                System.out.println(sql);
                Object[] params={title,username,content,cover_image_url,category_id,status,nickname,category_name};
                DButil.update(sql,params);
            } catch (Exception e){
                e.printStackTrace();
            } finally {
                DButil.close();
            }

        } else {
            //插入，如果不在库
            System.out.println("插入了 id="+id);
            try{
                sql="insert into blog (title,username,content,cover_image_url,category_id,status,nickname,category_name) values(?,?,?,?,?,?,?,?)";
                Object[] params={title,username,content,cover_image_url,category_id,status,nickname,category_name};
                DButil.insert(sql,params);

            } catch (Exception e){
                e.printStackTrace();
            } finally {
                DButil.close();
            }
            //获取uid
            try {
                sql="select id from blog where username=? and title=?";
                Object[] params={username,title};
                rs= DButil.select(sql,params);
                while (rs.next()) {
                    id=String.valueOf(rs.getInt("id"));
                }
                System.out.println("insert后获取 id="+id);
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                DButil.close();
            }



        }
        req.setAttribute("nickname",nickname);
        req.setAttribute("username",username);
        req.setAttribute("category_name",category_name);
        req.setAttribute("content",content);
        req.setAttribute("title",title);
        req.setAttribute("id",id);
        req.setAttribute("views",views);
        req.setAttribute("create_time",create_time);

        req.getRequestDispatcher("blogview.jsp").forward(req,resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
