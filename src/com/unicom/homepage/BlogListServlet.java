package com.unicom.homepage;

import com.alibaba.fastjson.JSON;
import com.unicom.entity.Blog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * @Author: lp
 * @Date: 2019/5/27 20:02
 * @Version 1.0
 */
@WebServlet("/BlogListServlet")
public class BlogListServlet extends HttpServlet {

    /**
     * 返回blog列表的方法
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        try {
            List<Blog> blogList = Homepage.getBlogList();
            resp.getWriter().write(JSON.toJSONString(blogList));
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
