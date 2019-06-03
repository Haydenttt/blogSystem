package com.unicom.classification;

import com.alibaba.fastjson.JSONObject;
import com.unicom.entity.Blog;
import com.unicom.util.CommonUtil;
import com.unicom.util.StaticConstant;

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
 * @Date: 2019/5/28 21:41
 * @Version 1.0
 */
@WebServlet("/ClassificationServlet")
public class ClassificationServlet extends HttpServlet {

    /**
     * 跳转页面
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
        String category = new String(req.getParameter("category").getBytes("iso-8859-1"),"utf-8");
        ClassficationPagination classficationPagination = new ClassficationPagination();
        Integer currentPage = null;
        if (!CommonUtil.checkParam(req.getParameter(StaticConstant.currentPage))) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(req.getParameter(StaticConstant.currentPage));
        }
        System.out.println(category);
        List<Blog> list = classficationPagination.getAllData(currentPage, category);
        Integer totalPage = classficationPagination.getTotalPage(category);
//        request.setAttribute("totalPage", totalPage);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",list);
        jsonObject.put("totalPage",totalPage);
        resp.getWriter().write(jsonObject.toJSONString());
    }

    /**
     * 返回当前目录下的博客列表
     *
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
