package com.unicom.pagination.servlet;

import com.alibaba.fastjson.JSONObject;
import com.unicom.entity.Blog;
import com.unicom.util.CommonUtil;
import com.unicom.util.StaticConstant;
import com.unicom.pagination.dao.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SearchDao searchDao = new SearchDao();
        Integer currentPage = null;
        if (!CommonUtil.checkParam(request.getParameter(StaticConstant.currentPage))) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter(StaticConstant.currentPage));
        }
        String keyword = request.getParameter("keyword");
        List<Blog> list = searchDao.getAllData(currentPage,keyword);
        Integer totalPage = searchDao.getTotalPage(keyword);
        request.setAttribute("list", list);
        request.setAttribute("totalPage", totalPage);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",list);
        jsonObject.put("totalPage",totalPage);
        response.getWriter().write(jsonObject.toJSONString());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
