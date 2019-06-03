package com.unicom.homepage;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: lp
 * @Date: 2019/5/28 8:55
 * @Version 1.0
 */
@WebServlet("/UserDisplayServlet")
public class UserDisplayServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        String loggedInUsername = null;
        Map<String, Object> topUserMap = new HashMap<>();
        try {
            if (req.getParameter("username") != null) {
                loggedInUsername = req.getParameter("username");
                topUserMap = Homepage.getHomepageUser(true, loggedInUsername);
            } else {
                topUserMap = Homepage.getHomepageUser(false, null);
            }
            //将包含博主信息的map返回到前端首页jsp
            resp.getWriter().write(JSONObject.parseObject(JSON.toJSONString(topUserMap)).toJSONString());
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
