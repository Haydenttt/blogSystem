package com.unicom.pagination.servlet;

import com.unicom.pagination.dao.*;
import com.unicom.entity.Blog;
import com.unicom.util.CommonUtil;
import com.unicom.util.StaticConstant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;

/**
 * @program: BlogSystem
 * @description: 分页
 * @author: Hayden TONG
 * @create: 2019-05-28 16:00
 */
@WebServlet("/pagination")
public class PaginationServlet extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
  }

  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    BlogPaginationDao blogPaginationDao = new BlogPaginationDao();
    Integer currentPage = null;
    if (!CommonUtil.checkParam(request.getParameter(StaticConstant.currentPage))) {
      currentPage = 1;
    } else {
      currentPage = Integer.parseInt(request.getParameter(StaticConstant.currentPage));
    }
      List<Blog> list = blogPaginationDao.getAllData(currentPage);
      Integer totalPage = blogPaginationDao.getTotalPage();
      request.setAttribute("list", list);
      request.setAttribute("totalPage", totalPage);
//      这里写整合后的jsp
      request.getRequestDispatcher("pagination.jsp").forward(request, response);
  }
}
