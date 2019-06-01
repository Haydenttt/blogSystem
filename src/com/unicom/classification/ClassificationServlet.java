package com.unicom.classification;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * @Author: lp
 * @Date: 2019/5/28 21:41
 * @Version 1.0
 */
@WebServlet("/ClassificationServlet")
public class ClassificationServlet extends HttpServlet {

    /**
     * 跳转页面
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
        String category = new String(req.getParameter("category").getBytes("iso-8859-1"), "utf-8");
        try {
            resp.getWriter().write(JSONObject.toJSONString(Classification.getBlogByCategory(category)));
        } catch (SQLException e) {
            e.printStackTrace();
        }    }

    /**
     * 返回当前目录下的博客列表
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
